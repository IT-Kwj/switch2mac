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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _270 = false;
    bool _268 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _441 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _458 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).x;
    float2 _466 = float2(_52, _54);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_466, float2(0.0), isnan(_466))).x;
    float _70 = in.m_38.y;
    float _72 = in.m_38.x;
    float _74 = in.m_40.y;
    float _76 = in.m_42.y;
    float _78 = in.m_40.x;
    float _80 = in.m_42.x;
    float _82 = -_60;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_62;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_64;
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
    float _176 = -_66;
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
    uint _224 = uint(int(uint(_220) >> uint(2)));
    uint _226 = uint(int(uint(int(_224)) >> uint(2)));
    int _228 = int(_224) & 3;
    float _230 = (*spvDescriptorSet0.fp_c1)._m0[int(_226)][_228];
    float _232 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[35].x, _222);
    float _234 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[35].z, _232);
    float _236 = abs(_234);
    float _238 = -_236;
    float _240 = _238 + 1.0;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = abs(_242);
    float _246 = log2(_244);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _250 = exp2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _254 = _215 * _252;
    float _256 = _213 * _252;
    float _258 = fma(_217, _252, _180);
    float _260 = fma(_180, _72, _254);
    float _262 = fma(_180, _70, _256);
    bool _264 = as_type<int>(_230) == 1248;
    if (!_264)
    {
        bool _266 = as_type<int>(_230) == 1520;
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
            float _274 = _262 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _276 = _262 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _278 = _262 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _280 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
            float _282 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _274);
            float _284 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
            float _288 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
            float _290 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].z, _282);
            float _292 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].z, _284);
            float _294 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].z, _286);
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
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
            float _314 = _262 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _316 = _262 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _318 = _262 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _320 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].x, _312);
            float _322 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].x, _314);
            float _324 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].x, _318);
            float _328 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].z, _320);
            float _330 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].z, _322);
            float _332 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].z, _324);
            float _334 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].z, _326);
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
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
            float _346 = _262 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _348 = _262 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _350 = _262 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _352 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].x, _344);
            float _354 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].x, _346);
            float _356 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].x, _350);
            float _360 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].z, _352);
            float _362 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].z, _354);
            float _364 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].z, _356);
            float _366 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
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
    float _384 = 1.0 / _376;
    float _386 = float(int(_209));
    float _388 = rint(_386);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    uint _394 = clamp(_392, 0u, 65535u);
    float _396 = _384 * _378;
    float _398 = _384 * _380;
    float _400 = _384 * _382;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float3 _1085 = float3(_398, _396, float(int(_394)));
    float3 _1089 = select(_1085, float3(0.0), isnan(_1085));
    float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1089.xy, uint(rint(_1089.z)), _402);
    float _406 = -_180;
    float _408 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _410 = _406 + _408;
    float _412 = -_180;
    float _414 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _416 = _412 + _414;
    float _418 = _410 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _416 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[48].w, _420);
    float _428 = _404 + _424;
    out.m_45.x = _68;
    out.m_45.y = _428;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _426;
    return out;
}

