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
    float2 _296 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296)), level(0.0)).xyzw;
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
    float _82 = _57 + (*spvDescriptorSet0.fp_c3)._m0[636].w;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[636].w;
    float _86 = _55 + _84;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[636].w;
    float _90 = _57 + _88;
    float _92 = _55 + (-0.001953125);
    float _94 = _57 + (-0.001953125);
    float _96 = _57 + 0.001953125;
    float2 _367 = float2(_86, _82);
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_367, float2(0.0), isnan(_367)), level(0.0)).w;
    float _100 = _55 + 0.001953125;
    float2 _377 = float2(_86, _90);
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377)), level(0.0)).w;
    float2 _385 = float2(_92, _94);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385)), level(0.0)).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _399 = float2(_92, _96);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399)), level(0.0)).xyz;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float2 _413 = float2(_100, _96);
    float3 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_413, float2(0.0), isnan(_413)), level(0.0)).xyz;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float2 _427 = float2(_100, _94);
    float3 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427)), level(0.0)).xyz;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = in.m_29.w;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = _53 * _142;
    float _146 = -_98;
    float _148 = _68 + _146;
    float _150 = _148 * (*spvDescriptorSet0.fp_c3)._m0[636].z;
    float _152 = -_102;
    float _154 = _68 + _152;
    float _156 = fma(_150, _150, 2.0);
    float _158 = _154 * (*spvDescriptorSet0.fp_c3)._m0[636].z;
    float _160 = fma(_158, _158, 2.0);
    float _162 = rsqrt(_156);
    float _164 = _112 + _120;
    float _166 = rsqrt(_160);
    float _168 = _128 + _164;
    float _170 = _150 * _162;
    float _172 = _162 + _162;
    float _174 = _108 + _116;
    float _176 = _110 + _118;
    float _178 = _136 + _168;
    float _180 = _124 + _174;
    float _182 = _126 + _176;
    float _184 = _158 * _166;
    float _186 = _166 * _170;
    float _188 = _166 * _172;
    float _190 = _132 + _180;
    float _192 = _134 + _182;
    float _194 = -_162;
    float _196 = -_186;
    float _198 = fma(_184, _194, _196);
    float _200 = _188 * _188;
    float _202 = -_162;
    float _204 = fma(_184, _202, _186);
    float _206 = fma(_62, 2.0, _190);
    float _208 = fma(_198, _198, _200);
    float _210 = fma(_64, 2.0, _192);
    float _212 = fma(_204, _204, _208);
    float _214 = fma(_66, 2.0, _178);
    float _216 = _206 * 0.16665999591350555419921875;
    float _218 = _210 * 0.16665999591350555419921875;
    float _220 = _214 * 0.16665999591350555419921875;
    float _222 = rsqrt(_212);
    float _224 = _198 * _222;
    float _226 = _188 * _222;
    float _228 = _204 * _222;
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _232 = -_226;
    float _234 = -_230;
    float _236 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[11].y, _234);
    float _238 = -_228;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[11].z, _236);
    float _242 = fma(_240, 0.5, 0.5);
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _144 * _244;
    float _248 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[10].x, 0.100000001490116119384765625);
    float _250 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[10].y, 0.100000001490116119384765625);
    float _252 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[10].z, 0.100000001490116119384765625);
    float _254 = _216 * _248;
    float _256 = _218 * _250;
    float _258 = _220 * _252;
    float _260 = _68 * (*spvDescriptorSet0.fp_c3)._m0[633].y;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    out.m_32.x = _254;
    out.m_32.y = _256;
    out.m_32.z = _258;
    out.m_32.w = _262;
    return out;
}

