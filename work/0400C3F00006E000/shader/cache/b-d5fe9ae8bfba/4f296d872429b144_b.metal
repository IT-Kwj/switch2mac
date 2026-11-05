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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _338 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_338, float2(0.0), isnan(_338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_338, float2(0.0), isnan(_338)), level(0.0)).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    bool _72 = _68 >= 0.001000000047497451305389404296875;
    bool _74 = isnan(_68);
    bool _76 = _72 || _74;
    bool _78 = isnan(0.001000000047497451305389404296875);
    bool _80 = _76 || _78;
    if (!_80)
    {
        discard_fragment();
    }
    if (!_80)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[636].w;
    float _84 = _55 + _82;
    float _86 = _57 + (*spvDescriptorSet0.fp_c3)._m0[636].w;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[636].w;
    float _90 = _57 + _88;
    float _92 = _55 + (-0.001953125);
    float _94 = _57 + (-0.001953125);
    float2 _406 = float2(_84, _86);
    float _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406)), level(0.0)).w;
    float2 _414 = float2(_84, _90);
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414)), level(0.0)).w;
    float _100 = _57 + 0.001953125;
    float2 _425 = float2(_92, _94);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_425, float2(0.0), isnan(_425)), level(0.0)).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _55 + 0.001953125;
    float2 _441 = float2(_92, _100);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441)), level(0.0)).xyz;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float2 _455 = float2(_112, _100);
    float3 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_455, float2(0.0), isnan(_455)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_455, float2(0.0), isnan(_455)), level(0.0)).xyz;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float2 _469 = float2(_112, _94);
    float3 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_469, float2(0.0), isnan(_469)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_469, float2(0.0), isnan(_469)), level(0.0)).xyz;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = in.m_29.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_29.w;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = _53 * _142;
    float _152 = _53 * _148;
    float _154 = abs(_150);
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[637].w;
    float _158 = _154 + _156;
    float _160 = -_96;
    float _162 = _68 + _160;
    float _164 = -_98;
    float _166 = _68 + _164;
    float _168 = _162 * (*spvDescriptorSet0.fp_c3)._m0[636].z;
    float _170 = _166 * (*spvDescriptorSet0.fp_c3)._m0[636].z;
    float _172 = fma(_168, _168, 2.0);
    float _174 = fma(_170, _170, 2.0);
    float _176 = _110 + _120;
    float _178 = rsqrt(_172);
    float _180 = _128 + _176;
    float _182 = _136 + _180;
    float _184 = rsqrt(_174);
    float _186 = _168 * _178;
    float _188 = _178 + _178;
    float _190 = _170 * _184;
    float _192 = _184 * _186;
    float _194 = _184 * _188;
    float _196 = -(*spvDescriptorSet0.fp_c3)._m0[637].w;
    float _198 = spvFAdd(_196, 50.0);
    float _200 = -_178;
    float _202 = -_192;
    float _204 = fma(_190, _200, _202);
    float _206 = _194 * _194;
    float _208 = -_178;
    float _210 = fma(_190, _208, _192);
    float _212 = 1.0 / _198;
    float _214 = fma(_204, _204, _206);
    float _216 = -(*spvDescriptorSet0.fp_c3)._m0[638].y;
    float _218 = _216 + (*spvDescriptorSet0.fp_c3)._m0[640].y;
    float _220 = fma(_210, _210, _214);
    float _222 = -(*spvDescriptorSet0.fp_c3)._m0[638].z;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[640].z;
    float _226 = rsqrt(_220);
    float _228 = _158 * _212;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = fma(_230, _218, (*spvDescriptorSet0.fp_c3)._m0[638].y);
    float _234 = -(*spvDescriptorSet0.fp_c3)._m0[638].x;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[640].x;
    float _238 = fma(_230, _236, (*spvDescriptorSet0.fp_c3)._m0[638].x);
    float _240 = _204 * _226;
    float _242 = _194 * _226;
    float _244 = fma(_230, _224, (*spvDescriptorSet0.fp_c3)._m0[638].z);
    float _246 = _210 * _226;
    float _248 = _240 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _250 = -_242;
    float _252 = -_248;
    float _254 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[11].y, _252);
    float _256 = _106 + _116;
    float _258 = _108 + _118;
    float _260 = -_246;
    float _262 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].z, _254);
    float _264 = _124 + _256;
    float _266 = _126 + _258;
    float _268 = fma(_66, 2.0, _182);
    float _270 = fma(_262, 0.5, 0.5);
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _132 + _264;
    float _276 = _134 + _266;
    float _278 = _268 * 0.16665999591350555419921875;
    float _280 = _152 * _272;
    float _282 = fma(_62, 2.0, _274);
    float _284 = fma(_64, 2.0, _276);
    float _286 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[637].x, _238);
    float _288 = _282 * 0.16665999591350555419921875;
    float _290 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[637].y, _232);
    float _292 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[637].z, _244);
    float _294 = _284 * 0.16665999591350555419921875;
    float _296 = _288 * _286;
    float _298 = _68 * (*spvDescriptorSet0.fp_c3)._m0[633].y;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _278 * _292;
    float _304 = _294 * _290;
    out.m_32.x = _296;
    out.m_32.y = _304;
    out.m_32.z = _302;
    out.m_32.w = _300;
    return out;
}

