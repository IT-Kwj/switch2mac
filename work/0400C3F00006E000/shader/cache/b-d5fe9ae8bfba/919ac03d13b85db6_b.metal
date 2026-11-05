#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _270 = false;
    bool _268 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _488 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_488, float2(0.0), isnan(_488)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _505 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = _70 * _86;
    float _96 = _74 * _86;
    float _98 = -_94;
    float _100 = fma(_92, _72, _98);
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = -_96;
    float _110 = fma(_92, _78, _108);
    float _112 = -_86;
    float _114 = _112 + _92;
    float _116 = _100 * _100;
    float _118 = -_94;
    float _120 = fma(_106, _76, _118);
    float _122 = -_96;
    float _124 = fma(_106, _80, _122);
    float _126 = -_86;
    float _128 = _126 + _106;
    float _130 = fma(_110, _110, _116);
    float _132 = _120 * _120;
    float _134 = fma(_114, _114, _130);
    float _136 = fma(_124, _124, _132);
    float _138 = fma(_128, _128, _136);
    float _140 = rsqrt(_134);
    float _142 = rsqrt(_138);
    float _144 = _110 * _140;
    float _146 = _114 * _140;
    float _148 = _100 * _140;
    float _150 = _128 * _142;
    float _152 = _124 * _142;
    float _154 = _120 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _154;
    float _160 = -_156;
    float _162 = fma(_146, _152, _160);
    float _164 = _148 * _152;
    float _166 = -_158;
    float _168 = fma(_148, _150, _166);
    float _170 = _162 * _162;
    float _172 = -_164;
    float _174 = fma(_144, _154, _172);
    float _176 = fma(_168, _168, _170);
    float _178 = -_68;
    float _180 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _182 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[46].z, _180);
    float _184 = fma(_174, _174, _176);
    float _186 = -_182;
    bool _190 = _186 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _192 = -_182;
    bool _194 = _192 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _196 = rsqrt(_184);
    bool _198 = !_190;
    uint _201 = uint(_198 ? 0 : 1);
    uint _203 = 2u;
    if (!_190)
    {
        _203 = 1u;
    }
    uint _205 = _203;
    uint _207 = _205;
    if (!_194)
    {
        _207 = _201;
    }
    uint _209 = _207;
    float _211 = _162 * _196;
    float _213 = _168 * _196;
    uint _215 = min(_209, 2u);
    float _217 = _174 * _196;
    float _219 = _211 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _222 = int(_215) << 2;
    float _224 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[35].x, _219);
    float _226 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[35].z, _224);
    uint _228 = uint(int(uint(_222) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = abs(_226);
    float _238 = -_236;
    float _240 = _238 + 1.0;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = abs(_242);
    float _246 = log2(_244);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _250 = exp2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _254 = _213 * _252;
    float _256 = _211 * _252;
    float _258 = fma(_217, _252, _182);
    float _260 = fma(_182, _74, _254);
    float _262 = fma(_182, _70, _256);
    bool _264 = as_type<int>(_234) == 1216;
    if (!_264)
    {
        bool _266 = as_type<int>(_234) == 1488;
        _268 = _266;
        if (!_268)
        {
            _270 = true;
        }
    }
    float _304;
    float _306;
    float _308;
    float _310;
    if (!_268)
    {
        if (!_270)
        {
            float _272 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _274 = _262 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _276 = _262 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _278 = _262 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _280 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
            float _282 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _274);
            float _284 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
            float _288 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
            float _290 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
            float _292 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
            float _294 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].z, _286);
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _304 = _302;
            _306 = _300;
            _308 = _296;
            _310 = _298;
        }
    }
    if ((false || _270) || _268)
    {
        if ((!_270) || _268)
        {
            _268 = false;
            float _312 = _262 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _314 = _262 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _316 = _262 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _318 = _262 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _320 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].x, _312);
            float _322 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].x, _314);
            float _324 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].x, _318);
            float _328 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].z, _320);
            float _330 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].z, _322);
            float _332 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].z, _324);
            float _334 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].z, _326);
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _304 = _342;
            _306 = _340;
            _308 = _336;
            _310 = _338;
        }
        if (false || _270)
        {
            _270 = false;
            float _344 = _262 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _346 = _262 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _348 = _262 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _350 = _262 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _352 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].x, _344);
            float _354 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].x, _346);
            float _356 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].x, _350);
            float _360 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].z, _352);
            float _362 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].z, _354);
            float _364 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].z, _356);
            float _366 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _304 = _374;
            _306 = _372;
            _308 = _368;
            _310 = _370;
        }
    }
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float2 _1095 = float2(_54, _56);
    float2 _386 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1095, float2(0.0), isnan(_1095))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1095, float2(0.0), isnan(_1095))).xy;
    float _388 = _386.x;
    float _390 = _386.y;
    float _392 = 1.0 / _376;
    float _394 = float(int(_209));
    float _396 = rint(_394);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    uint _402 = clamp(_400, 0u, 65535u);
    float _404 = _392 * _378;
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = _392 * _380;
    float _410 = _392 * _382;
    float _412 = _406 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _414 = _412 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _416 = _412 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _418 = fma(_414, -0.5, _408);
    float _420 = fma(_416, -0.5, _410);
    float _422 = fma(_414, 0.5, _408);
    float _424 = fma(_416, 0.5, _410);
    float3 _1164 = float3(_418, _424, float(int(_402)));
    float3 _1168 = select(_1164, float3(0.0), isnan(_1164));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1168.xy, uint(rint(_1168.z)), _406);
    float3 _1177 = float3(_422, _424, float(int(_402)));
    float3 _1179 = select(_1177, float3(0.0), isnan(_1177));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1179.xy, uint(rint(_1179.z)), _406);
    float3 _1188 = float3(_422, _420, float(int(_402)));
    float3 _1190 = select(_1188, float3(0.0), isnan(_1188));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1190.xy, uint(rint(_1190.z)), _406);
    float3 _1199 = float3(_418, _420, float(int(_402)));
    float3 _1201 = select(_1199, float3(0.0), isnan(_1199));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1201.xy, uint(rint(_1201.z)), _406);
    float _434 = fma(_388, 2.0, -1.0);
    float _436 = fma(_390, 2.0, -1.0);
    float _438 = _434 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _440 = _436 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _442 = fma(_438, 2.0, _54);
    float _444 = fma(_440, 2.0, _56);
    float2 _1228 = float2(_442, _444);
    float _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1228, float2(0.0), isnan(_1228))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1228, float2(0.0), isnan(_1228))).x;
    float _448 = -_182;
    float _450 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _452 = _448 + _450;
    float _454 = _452 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[48].w, _456);
    float _460 = _428 + _426;
    float _462 = -_182;
    float _464 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _466 = _462 + _464;
    float _468 = _460 + _430;
    float _470 = _466 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float _474 = _468 + _432;
    float _476 = fma(_474, 0.25, _472);
    out.m_47.x = _446;
    out.m_47.y = _476;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _458;
    return out;
}

