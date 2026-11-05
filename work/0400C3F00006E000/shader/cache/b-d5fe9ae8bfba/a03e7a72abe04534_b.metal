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
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _114 = false;
    bool _112 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _422 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_422, float2(0.0), isnan(_422))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _58;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = _66 * _60;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _82 = !_74;
    uint _85 = uint(_82 ? 0 : 1);
    uint _87 = 2u;
    if (!_74)
    {
        _87 = 1u;
    }
    uint _89 = _87;
    uint _91 = _89;
    if (!_80)
    {
        _91 = _85;
    }
    uint _93 = _91;
    uint _95 = min(_93, 2u);
    int _98 = int(_95) << 2;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    bool _108 = as_type<int>(_106) == 336;
    if (!_108)
    {
        bool _110 = as_type<int>(_106) == 608;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _140;
            _152 = _144;
            _154 = _142;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _76 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _76 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _76 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _180;
            _152 = _184;
            _154 = _182;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _76 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _76 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _76 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _76 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _212;
            _152 = _216;
            _154 = _214;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float2 _793 = float2(_52, _54);
    float2 _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_793, float2(0.0), isnan(_793))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_793, float2(0.0), isnan(_793))).xy;
    float _232 = _230.x;
    float _234 = _230.y;
    float _236 = _76 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _238 = float(int(_93));
    float _240 = 1.0 / _220;
    float _242 = _76 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _244 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _236);
    float _246 = _76 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _248 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _242);
    float _250 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _244);
    float _252 = rint(_238);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    uint _258 = clamp(_256, 0u, 65535u);
    float _260 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _248);
    float _262 = _250 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _264 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _246);
    float _266 = _260 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _268 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _264);
    float _270 = 1.0 / _262;
    float _272 = _240 * _222;
    float _274 = _240 * _224;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _268 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _280 = _240 * _226;
    float _282 = _278 * _270;
    float _284 = _266 * _270;
    float _286 = fma(_234, 2.0, -1.0);
    float _288 = fma(_232, 2.0, -1.0);
    float _290 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _292 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _294 = _286 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _296 = _288 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _298 = fma(_276, _290, _272);
    float _300 = -_292;
    float _302 = fma(_276, _300, _280);
    float _304 = fma(_294, 2.0, _54);
    float _306 = fma(_296, 2.0, _52);
    float _308 = -_290;
    float _310 = fma(_276, _308, _272);
    float _312 = fma(_276, _292, _280);
    float3 _954 = float3(_272, _312, float(int(_258)));
    float3 _958 = select(_954, float3(0.0), isnan(_954));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _958.xy, uint(rint(_958.z)), _276);
    float3 _967 = float3(_298, _312, float(int(_258)));
    float3 _969 = select(_967, float3(0.0), isnan(_967));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _969.xy, uint(rint(_969.z)), _276);
    float3 _978 = float3(_310, _312, float(int(_258)));
    float3 _980 = select(_978, float3(0.0), isnan(_978));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _980.xy, uint(rint(_980.z)), _276);
    float3 _989 = float3(_298, _280, float(int(_258)));
    float3 _991 = select(_989, float3(0.0), isnan(_989));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _991.xy, uint(rint(_991.z)), _276);
    float3 _1000 = float3(_272, _280, float(int(_258)));
    float3 _1002 = select(_1000, float3(0.0), isnan(_1000));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1002.xy, uint(rint(_1002.z)), _276);
    float2 _1008 = float2(_282, _284);
    float2 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1008, float2(0.0), isnan(_1008))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1008, float2(0.0), isnan(_1008))).xy;
    float _326 = _324.x;
    float _328 = _324.y;
    float3 _1023 = float3(_310, _280, float(int(_258)));
    float3 _1025 = select(_1023, float3(0.0), isnan(_1023));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1025.xy, uint(rint(_1025.z)), _276);
    float3 _1034 = float3(_298, _302, float(int(_258)));
    float3 _1036 = select(_1034, float3(0.0), isnan(_1034));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1036.xy, uint(rint(_1036.z)), _276);
    float3 _1045 = float3(_272, _302, float(int(_258)));
    float3 _1047 = select(_1045, float3(0.0), isnan(_1045));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1047.xy, uint(rint(_1047.z)), _276);
    float3 _1056 = float3(_310, _302, float(int(_258)));
    float3 _1058 = select(_1056, float3(0.0), isnan(_1056));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1058.xy, uint(rint(_1058.z)), _276);
    float2 _1064 = float2(_306, _304);
    float _338 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1064, float2(0.0), isnan(_1064))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1064, float2(0.0), isnan(_1064))).x;
    float _340 = _76 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _342 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _340);
    float _344 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _342);
    float _346 = _344 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _348 = precise::min(_346, 1.0);
    float _350 = -_66;
    float _352 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _354 = _350 + _352;
    float _356 = _354 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = _316 + _314;
    float _362 = _360 + _318;
    float _364 = -_326;
    float _366 = fma(_364, _326, _328);
    float _368 = -_326;
    float _370 = _348 + _368;
    float _372 = _362 + _320;
    float _374 = fma(_370, _370, _366);
    float _376 = _372 + _322;
    bool _378 = _370 <= 0.001000000047497451305389404296875;
    float _380 = float(_378);
    float _382 = 1.0 / _374;
    float _384 = _376 + _330;
    float _386 = _384 + _332;
    float _388 = _386 + _334;
    float _390 = _388 + _336;
    float _392 = _366 * _382;
    float _394 = -_66;
    float _396 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _398 = _394 + _396;
    float _400 = precise::max(_392, _380);
    float _402 = _398 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = precise::min(_400, 1.0);
    float _408 = fma(_390, 0.111111111938953399658203125, _404);
    float _410 = _406 + _358;
    out.m_45.x = _338;
    out.m_45.y = _408;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _410;
    return out;
}

