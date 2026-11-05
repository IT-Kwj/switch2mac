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
    float2 _510 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_510, float2(0.0), isnan(_510)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _527 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = _130 * _142;
    float _152 = _110 * _142;
    float _154 = _118 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _152;
    float _160 = -_156;
    float _162 = fma(_146, _154, _160);
    float _164 = _148 * _154;
    float _166 = -_158;
    float _168 = fma(_148, _150, _166);
    float _170 = _162 * _162;
    float _172 = -_164;
    float _174 = fma(_144, _152, _172);
    float _176 = -_68;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _180 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[46].z, _178);
    float _182 = fma(_168, _168, _170);
    float _184 = -_180;
    bool _188 = _184 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _190 = fma(_174, _174, _182);
    float _192 = -_180;
    bool _194 = _192 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _196 = !_188;
    uint _199 = uint(_196 ? 0 : 1);
    float _201 = rsqrt(_190);
    uint _203 = 2u;
    if (!_188)
    {
        _203 = 1u;
    }
    uint _205 = _203;
    uint _207 = _205;
    if (!_194)
    {
        _207 = _199;
    }
    uint _209 = _207;
    uint _211 = min(_209, 2u);
    float _213 = _162 * _201;
    float _215 = _168 * _201;
    float _217 = _174 * _201;
    int _220 = int(_211) << 2;
    float _222 = _213 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _224 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[35].x, _222);
    float _226 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[35].z, _224);
    uint _228 = uint(int(uint(_220) >> uint(2)));
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
    float _256 = _215 * _252;
    float _258 = fma(_217, _252, _180);
    float _260 = fma(_180, _70, _254);
    float _262 = fma(_180, _72, _256);
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
            float _272 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _274 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _276 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _278 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _280 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
            float _282 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].x, _274);
            float _284 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].x, _276);
            float _286 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
            float _288 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
            float _290 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
            float _292 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
            float _294 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].z, _286);
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _304 = _302;
            _306 = _296;
            _308 = _300;
            _310 = _298;
        }
    }
    if ((false || _270) || _268)
    {
        if ((!_270) || _268)
        {
            _268 = false;
            float _312 = _260 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _314 = _260 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _316 = _260 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _318 = _260 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _320 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].x, _312);
            float _322 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].x, _314);
            float _324 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].x, _316);
            float _326 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].x, _318);
            float _328 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].z, _320);
            float _330 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].z, _322);
            float _332 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].z, _324);
            float _334 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].z, _326);
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _304 = _342;
            _306 = _336;
            _308 = _340;
            _310 = _338;
        }
        if (false || _270)
        {
            _270 = false;
            float _344 = _260 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _346 = _260 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _348 = _260 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _350 = _260 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _352 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].x, _344);
            float _354 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].x, _346);
            float _356 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].x, _348);
            float _358 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].x, _350);
            float _360 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].z, _352);
            float _362 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].z, _354);
            float _364 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].z, _356);
            float _366 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _304 = _374;
            _306 = _368;
            _308 = _372;
            _310 = _370;
        }
    }
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float2 _1117 = float2(_54, _56);
    float2 _386 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1117, float2(0.0), isnan(_1117))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1117, float2(0.0), isnan(_1117))).xy;
    float _388 = _386.x;
    float _390 = _386.y;
    float _392 = float(int(_209));
    float _394 = 1.0 / _376;
    float _396 = rint(_392);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    uint _402 = clamp(_400, 0u, 65535u);
    float _404 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _406 = _394 * _378;
    float _408 = _394 * _380;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _394 * _382;
    float _414 = -_404;
    float _416 = fma(_410, _414, _412);
    float _418 = fma(_388, 2.0, -1.0);
    float _420 = fma(_390, 2.0, -1.0);
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _424 = _418 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _426 = _420 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _428 = -_422;
    float _430 = fma(_410, _428, _406);
    float _432 = fma(_424, 2.0, _54);
    float _434 = fma(_410, _422, _406);
    float _436 = fma(_426, 2.0, _56);
    float _438 = fma(_410, _404, _412);
    float3 _1211 = float3(_406, _438, float(int(_402)));
    float3 _1215 = select(_1211, float3(0.0), isnan(_1211));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1215.xy, uint(rint(_1215.z)), _410);
    float3 _1224 = float3(_434, _438, float(int(_402)));
    float3 _1226 = select(_1224, float3(0.0), isnan(_1224));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1226.xy, uint(rint(_1226.z)), _410);
    float3 _1235 = float3(_430, _438, float(int(_402)));
    float3 _1237 = select(_1235, float3(0.0), isnan(_1235));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1237.xy, uint(rint(_1237.z)), _410);
    float3 _1246 = float3(_434, _412, float(int(_402)));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1248.xy, uint(rint(_1248.z)), _410);
    float3 _1257 = float3(_406, _412, float(int(_402)));
    float3 _1259 = select(_1257, float3(0.0), isnan(_1257));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1259.xy, uint(rint(_1259.z)), _410);
    float3 _1268 = float3(_430, _412, float(int(_402)));
    float3 _1270 = select(_1268, float3(0.0), isnan(_1268));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1270.xy, uint(rint(_1270.z)), _410);
    float3 _1279 = float3(_434, _416, float(int(_402)));
    float3 _1281 = select(_1279, float3(0.0), isnan(_1279));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1281.xy, uint(rint(_1281.z)), _410);
    float3 _1290 = float3(_406, _416, float(int(_402)));
    float3 _1292 = select(_1290, float3(0.0), isnan(_1290));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1292.xy, uint(rint(_1292.z)), _410);
    float3 _1301 = float3(_430, _416, float(int(_402)));
    float3 _1303 = select(_1301, float3(0.0), isnan(_1301));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1303.xy, uint(rint(_1303.z)), _410);
    float2 _1309 = float2(_432, _436);
    float _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1309, float2(0.0), isnan(_1309))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1309, float2(0.0), isnan(_1309))).x;
    float _460 = -_180;
    float _462 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _464 = _460 + _462;
    float _466 = _464 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _442 + _440;
    float _472 = _470 + _444;
    float _474 = _472 + _446;
    float _476 = -_180;
    float _478 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _480 = _476 + _478;
    float _482 = _474 + _448;
    float _484 = _480 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = _482 + _450;
    float _490 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[48].w, _486);
    float _492 = _488 + _452;
    float _494 = _492 + _454;
    float _496 = _494 + _456;
    float _498 = fma(_496, 0.111111111938953399658203125, _468);
    out.m_47.x = _458;
    out.m_47.y = _498;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _490;
    return out;
}

