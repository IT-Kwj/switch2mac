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
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _122 = false;
    bool _120 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _390 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float _56 = in.m_40.x;
    float _58 = -_54;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _56;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = -_62;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _76 = -_62;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _80 = !_70;
    int _83 = _80 ? 0 : 1;
    int _85 = 2;
    if (!_70)
    {
        _85 = 1;
    }
    int _87 = _85;
    int _89 = _87;
    if (!_74)
    {
        _89 = _83;
    }
    int _91 = _89;
    int _93 = _91 + 1;
    uint _96 = uint(_93);
    if (!_78)
    {
        _96 = uint(_91);
    }
    uint _98 = _96;
    uint _100 = min(_98, 2u);
    int _102 = int(_100) << 2;
    float _104 = in.m_40.y;
    uint _106 = uint(int(uint(_102) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    float _114 = _62 * _104;
    bool _116 = as_type<int>(_112) == 384;
    if (!_116)
    {
        bool _118 = as_type<int>(_112) == 656;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _114 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _114 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _114 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _114 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _152;
            _160 = _148;
            _162 = _150;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _114 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _114 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _114 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _114 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _192;
            _160 = _188;
            _162 = _190;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _114 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _114 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _114 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _114 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _224;
            _160 = _220;
            _162 = _222;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _114 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _238 = _114 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _240 = 1.0 / _228;
    float _242 = float(int(_98));
    float _244 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _236);
    float _246 = _114 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _248 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _238);
    float _250 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _244);
    float _252 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _248);
    float _254 = rint(_242);
    float _256 = precise::max(_254, 0.0);
    uint _258 = uint(_256);
    uint _260 = clamp(_258, 0u, 65535u);
    float _262 = _250 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _264 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _246);
    float _266 = _252 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _268 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _264);
    float _270 = _240 * _230;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = 1.0 / _262;
    float _276 = _240 * _232;
    float _278 = _268 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _280 = _272 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _282 = _240 * _234;
    float _284 = _280 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _286 = _280 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _288 = fma(_286, 0.5, _282);
    float _290 = _278 * _274;
    float _292 = _266 * _274;
    float _294 = fma(_284, 0.5, _276);
    float _296 = fma(_284, -0.5, _276);
    float _298 = fma(_286, -0.5, _282);
    float2 _897 = float2(_290, _292);
    float2 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_897, float2(0.0), isnan(_897))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_897, float2(0.0), isnan(_897))).xy;
    float _304 = _302.x;
    float _306 = _302.y;
    float3 _913 = float3(_296, _288, float(int(_260)));
    float3 _917 = select(_913, float3(0.0), isnan(_913));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _917.xy, uint(rint(_917.z)), _272);
    float3 _926 = float3(_294, _288, float(int(_260)));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _928.xy, uint(rint(_928.z)), _272);
    float3 _937 = float3(_294, _298, float(int(_260)));
    float3 _939 = select(_937, float3(0.0), isnan(_937));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _939.xy, uint(rint(_939.z)), _272);
    float3 _948 = float3(_296, _298, float(int(_260)));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _950.xy, uint(rint(_950.z)), _272);
    float2 _956 = float2(_50, _52);
    float _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_956, float2(0.0), isnan(_956))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_956, float2(0.0), isnan(_956))).x;
    float _318 = _114 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _320 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _318);
    float _322 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _320);
    float _324 = _322 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _326 = precise::min(_324, 1.0);
    float _328 = -_62;
    float _330 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _332 = _328 + _330;
    float _334 = -_62;
    float _336 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _338 = _334 + _336;
    float _340 = _332 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = -_304;
    float _346 = fma(_344, _304, _306);
    float _348 = -_304;
    float _350 = _326 + _348;
    float _352 = fma(_350, _350, _346);
    float _354 = _310 + _308;
    bool _356 = _350 <= 0.001000000047497451305389404296875;
    float _358 = float(_356);
    float _360 = 1.0 / _352;
    float _362 = _354 + _312;
    float _364 = _362 + _314;
    float _366 = fma(_364, 0.25, _342);
    float _368 = _346 * _360;
    float _370 = _338 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _372 = precise::clamp(_370, 0.0, 1.0);
    float _374 = precise::max(_368, _358);
    float _376 = precise::min(_374, 1.0);
    float _378 = _376 + _372;
    out.m_43.x = _316;
    out.m_43.y = _366;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _378;
    return out;
}

