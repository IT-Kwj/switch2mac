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
    bool _118 = false;
    bool _116 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _404 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_404, float2(0.0), isnan(_404))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = in.m_42.y;
    float _72 = _68 * _58;
    float _74 = -_68;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _84 = !_78;
    uint _87 = uint(_84 ? 0 : 1);
    uint _89 = 2u;
    if (!_78)
    {
        _89 = 1u;
    }
    uint _91 = _89;
    uint _93 = _91;
    if (!_82)
    {
        _93 = _87;
    }
    uint _95 = _93;
    uint _97 = min(_95, 2u);
    int _100 = int(_97) << 2;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    uint _104 = uint(int(uint(int(_102)) >> uint(2)));
    int _106 = int(_102) & 3;
    float _108 = (*spvDescriptorSet0.fp_c1)._m0[int(_104)][_106];
    float _110 = _68 * _70;
    bool _112 = as_type<int>(_108) == 368;
    if (!_112)
    {
        bool _114 = as_type<int>(_108) == 640;
        _116 = _114;
        if (!_116)
        {
            _118 = true;
        }
    }
    float _152;
    float _154;
    float _156;
    float _158;
    if (!_116)
    {
        if (!_118)
        {
            float _120 = _110 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _122 = _110 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _124 = _110 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _126 = _110 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _128 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
            float _130 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _122);
            float _132 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
            float _134 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
            float _142 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _152 = _150;
            _154 = _144;
            _156 = _146;
            _158 = _148;
        }
    }
    if ((false || _118) || _116)
    {
        if ((!_118) || _116)
        {
            _116 = false;
            float _160 = _110 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _162 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _164 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _166 = _110 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _168 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, _160);
            float _170 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].x, _162);
            float _172 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].x, _164);
            float _174 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].x, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _172);
            float _182 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _174);
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _152 = _190;
            _154 = _184;
            _156 = _186;
            _158 = _188;
        }
        if (false || _118)
        {
            _118 = false;
            float _192 = _110 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _194 = _110 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _196 = _110 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _198 = _110 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _200 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].x, _192);
            float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].x, _194);
            float _204 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].x, _196);
            float _206 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _204);
            float _214 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _206);
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _152 = _222;
            _154 = _216;
            _156 = _218;
            _158 = _220;
        }
    }
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float2 _780 = float2(_52, _54);
    float2 _234 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_780, float2(0.0), isnan(_780))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_780, float2(0.0), isnan(_780))).xy;
    float _236 = _234.x;
    float _238 = _234.y;
    float _240 = _110 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _242 = _110 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _244 = 1.0 / _224;
    float _246 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].x, _240);
    float _248 = _110 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _250 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].x, _242);
    float _252 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].z, _246);
    float _254 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].z, _250);
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _258 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].x, _248);
    float _260 = _254 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _262 = 1.0 / _256;
    float _264 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].z, _258);
    float _266 = _244 * _226;
    float _268 = _244 * _228;
    float _270 = _244 * _230;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _264 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _276 = float(int(_95));
    float _278 = _272 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _280 = rint(_276);
    float _282 = precise::max(_280, 0.0);
    uint _284 = uint(_282);
    uint _286 = clamp(_284, 0u, 65535u);
    float _288 = _274 * _262;
    float _290 = _260 * _262;
    float _292 = _278 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _294 = _278 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float2 _897 = float2(_288, _290);
    float2 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_897, float2(0.0), isnan(_897))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_897, float2(0.0), isnan(_897))).xy;
    float _298 = _296.x;
    float _300 = _296.y;
    float _302 = fma(_292, 0.5, _266);
    float _304 = fma(_292, -0.5, _266);
    float _306 = fma(_294, 0.5, _268);
    float _308 = fma(_294, -0.5, _268);
    float _310 = fma(_238, 2.0, -1.0);
    float _312 = fma(_236, 2.0, -1.0);
    float _314 = _310 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _316 = _312 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _318 = fma(_314, 2.0, _54);
    float _320 = fma(_316, 2.0, _52);
    float3 _948 = float3(_304, _306, float(int(_286)));
    float3 _952 = select(_948, float3(0.0), isnan(_948));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _952.xy, uint(rint(_952.z)), _272);
    float3 _961 = float3(_302, _306, float(int(_286)));
    float3 _963 = select(_961, float3(0.0), isnan(_961));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _963.xy, uint(rint(_963.z)), _272);
    float3 _972 = float3(_302, _308, float(int(_286)));
    float3 _974 = select(_972, float3(0.0), isnan(_972));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _974.xy, uint(rint(_974.z)), _272);
    float3 _983 = float3(_304, _308, float(int(_286)));
    float3 _985 = select(_983, float3(0.0), isnan(_983));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _985.xy, uint(rint(_985.z)), _272);
    float2 _991 = float2(_320, _318);
    float _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_991, float2(0.0), isnan(_991))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_991, float2(0.0), isnan(_991))).x;
    float _332 = _110 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _334 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _332);
    float _336 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].z, _334);
    float _338 = _336 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _340 = precise::min(_338, 1.0);
    float _342 = -_298;
    float _344 = fma(_342, _298, _300);
    float _346 = -_298;
    float _348 = _340 + _346;
    float _350 = fma(_348, _348, _344);
    bool _352 = _348 <= 0.001000000047497451305389404296875;
    float _354 = float(_352);
    float _356 = 1.0 / _350;
    float _358 = -_68;
    float _360 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _362 = _358 + _360;
    float _364 = _362 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _344 * _356;
    float _370 = -_68;
    float _372 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _374 = _370 + _372;
    float _376 = precise::max(_368, _354);
    float _378 = _374 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = precise::min(_376, 1.0);
    float _384 = _382 + _366;
    float _386 = _324 + _322;
    float _388 = _386 + _326;
    float _390 = _388 + _328;
    float _392 = fma(_390, 0.25, _380);
    out.m_45.x = _330;
    out.m_45.y = _392;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _384;
    return out;
}

