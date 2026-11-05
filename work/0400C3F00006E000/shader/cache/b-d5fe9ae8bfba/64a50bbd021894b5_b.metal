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
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
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
    bool _128 = false;
    bool _126 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _414 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _58;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_68;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_68;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_76;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_76)
    {
        _91 = 1;
    }
    int _93 = _91;
    int _95 = _93;
    if (!_80)
    {
        _95 = _89;
    }
    int _97 = _95;
    int _99 = _97 + 1;
    uint _102 = uint(_99);
    if (!_84)
    {
        _102 = uint(_97);
    }
    uint _104 = _102;
    uint _106 = min(_104, 2u);
    int _108 = int(_106) << 2;
    float _110 = in.m_42.y;
    uint _112 = uint(int(uint(_108) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.fp_c1)._m0[int(_114)][_116];
    float _120 = _68 * _110;
    bool _122 = as_type<int>(_118) == 416;
    if (!_122)
    {
        bool _124 = as_type<int>(_118) == 688;
        _126 = _124;
        if (!_126)
        {
            _128 = true;
        }
    }
    float _162;
    float _164;
    float _166;
    float _168;
    if (!_126)
    {
        if (!_128)
        {
            float _130 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _132 = _120 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _134 = _120 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _136 = _120 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _134);
            float _144 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _136);
            float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _138);
            float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _140);
            float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _142);
            float _152 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _144);
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _162 = _160;
            _164 = _154;
            _166 = _156;
            _168 = _158;
        }
    }
    if ((false || _128) || _126)
    {
        if ((!_128) || _126)
        {
            _126 = false;
            float _170 = _120 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _172 = _120 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _174 = _120 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _176 = _120 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _174);
            float _184 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _176);
            float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _178);
            float _188 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _180);
            float _190 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _182);
            float _192 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _184);
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _162 = _200;
            _164 = _194;
            _166 = _196;
            _168 = _198;
        }
        if (false || _128)
        {
            _128 = false;
            float _202 = _120 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _204 = _120 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _206 = _120 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _208 = _120 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _206);
            float _216 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _208);
            float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _210);
            float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _212);
            float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _214);
            float _224 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _216);
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _162 = _232;
            _164 = _226;
            _166 = _228;
            _168 = _230;
        }
    }
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float2 _806 = float2(_52, _54);
    float2 _244 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_806, float2(0.0), isnan(_806))).xy;
    float _246 = _244.x;
    float _248 = _244.y;
    float _250 = _120 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _252 = _120 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _254 = 1.0 / _234;
    float _256 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _250);
    float _258 = _120 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _260 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _252);
    float _262 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].z, _256);
    float _264 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].z, _260);
    float _266 = _262 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _268 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _258);
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _272 = 1.0 / _266;
    float _274 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].z, _268);
    float _276 = _254 * _236;
    float _278 = _254 * _238;
    float _280 = _254 * _240;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _274 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _286 = float(int(_104));
    float _288 = _282 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _290 = rint(_286);
    float _292 = precise::max(_290, 0.0);
    uint _294 = uint(_292);
    uint _296 = clamp(_294, 0u, 65535u);
    float _298 = _284 * _272;
    float _300 = _270 * _272;
    float _302 = _288 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _304 = _288 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float2 _923 = float2(_298, _300);
    float2 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_923, float2(0.0), isnan(_923))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_923, float2(0.0), isnan(_923))).xy;
    float _308 = _306.x;
    float _310 = _306.y;
    float _312 = fma(_302, 0.5, _276);
    float _314 = fma(_302, -0.5, _276);
    float _316 = fma(_304, 0.5, _278);
    float _318 = fma(_304, -0.5, _278);
    float _320 = fma(_248, 2.0, -1.0);
    float _322 = fma(_246, 2.0, -1.0);
    float _324 = _320 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _326 = _322 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _328 = fma(_324, 2.0, _54);
    float _330 = fma(_326, 2.0, _52);
    float3 _974 = float3(_314, _316, float(int(_296)));
    float3 _978 = select(_974, float3(0.0), isnan(_974));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _978.xy, uint(rint(_978.z)), _282);
    float3 _987 = float3(_312, _316, float(int(_296)));
    float3 _989 = select(_987, float3(0.0), isnan(_987));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _989.xy, uint(rint(_989.z)), _282);
    float3 _998 = float3(_312, _318, float(int(_296)));
    float3 _1000 = select(_998, float3(0.0), isnan(_998));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1000.xy, uint(rint(_1000.z)), _282);
    float3 _1009 = float3(_314, _318, float(int(_296)));
    float3 _1011 = select(_1009, float3(0.0), isnan(_1009));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1011.xy, uint(rint(_1011.z)), _282);
    float2 _1017 = float2(_330, _328);
    float _340 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1017, float2(0.0), isnan(_1017))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1017, float2(0.0), isnan(_1017))).x;
    float _342 = _120 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _344 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _342);
    float _346 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].z, _344);
    float _348 = _346 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _350 = precise::min(_348, 1.0);
    float _352 = -_308;
    float _354 = fma(_352, _308, _310);
    float _356 = -_308;
    float _358 = _350 + _356;
    float _360 = fma(_358, _358, _354);
    bool _362 = _358 <= 0.001000000047497451305389404296875;
    float _364 = float(_362);
    float _366 = 1.0 / _360;
    float _368 = -_68;
    float _370 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _372 = _368 + _370;
    float _374 = _372 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = _354 * _366;
    float _380 = -_68;
    float _382 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _384 = _380 + _382;
    float _386 = precise::max(_378, _364);
    float _388 = _384 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = precise::min(_386, 1.0);
    float _394 = _392 + _376;
    float _396 = _334 + _332;
    float _398 = _396 + _336;
    float _400 = _398 + _338;
    float _402 = fma(_400, 0.25, _390);
    out.m_45.x = _340;
    out.m_45.y = _402;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _394;
    return out;
}

