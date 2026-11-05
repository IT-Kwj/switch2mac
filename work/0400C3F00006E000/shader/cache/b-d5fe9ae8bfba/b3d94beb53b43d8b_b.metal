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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _63 = _57 * _55;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _67 = floor(_61);
    float _69 = floor(_65);
    float _71 = _67 + 0.5;
    float _73 = _71 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _75 = _69 + 0.5;
    float _77 = _75 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float2 _320 = float2(_73, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_320, float2(0.0), isnan(_320)), int2(0), component::x).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _92 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _94 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _96 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _100 = _90 + _98;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _104 = _92 + _102;
    float _106 = -_90;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _112 = _94 + _110;
    float _114 = -_92;
    float _116 = _114 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _118 = precise::max(0.0, _100);
    float _120 = -_94;
    float _122 = _120 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _124 = precise::max(0.0, _104);
    float _126 = precise::max(_118, _108);
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _130 = _96 + _128;
    float _132 = precise::max(0.0, _112);
    float _134 = -_96;
    float _136 = _134 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _138 = precise::max(_124, _116);
    float _140 = precise::max(_132, _122);
    float _142 = precise::max(0.0, _130);
    float _144 = _126 + _138;
    float _146 = precise::max(_142, _136);
    float _148 = _140 + _144;
    float _150 = -_146;
    bool _154 = _148 != _150;
    bool _156 = isnan(_148);
    bool _158 = _154 || _156;
    bool _160 = isnan(_150);
    bool _162 = _158 || _160;
    if (!_162)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        out.m_36.x = 0.0;
        return out;
    }
    float _164 = _77 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _166 = _73 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _471 = float2(_166, _164);
    float4 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_471, float2(0.0), isnan(_471))).xyzw;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    float _176 = _168.w;
    float2 _487 = float2(_73, _164);
    float4 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_487, float2(0.0), isnan(_487))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_487, float2(0.0), isnan(_487))).xyzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = _178.w;
    float2 _503 = float2(_166, _77);
    float4 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503))).xyzw;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _188.w;
    float2 _519 = float2(_73, _77);
    float4 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_519, float2(0.0), isnan(_519))).xyzw;
    float _200 = _198.x;
    float _202 = _198.y;
    float _204 = _198.z;
    float _206 = _198.w;
    float _208 = _146 + _148;
    float _210 = -_146;
    bool _212 = _148 > _210;
    float _214 = 1.0 / _208;
    float _216 = _138 * _176;
    float _218 = _138 * _170;
    float _220 = _138 * _172;
    float _222 = _138 * _174;
    float _224 = fma(_126, _186, _216);
    float _226 = fma(_126, _180, _218);
    float _228 = fma(_126, _182, _220);
    float _230 = fma(_126, _184, _222);
    float _232 = fma(_140, _196, _224);
    float _234 = fma(_140, _190, _226);
    float _236 = _212 ? _214 : 1.0;
    float _238 = fma(_140, _192, _228);
    float _240 = fma(_140, _194, _230);
    float _242 = fma(_146, _206, _232);
    float _244 = fma(_146, _200, _234);
    float _246 = fma(_146, _202, _238);
    float _248 = fma(_146, _204, _240);
    float _250 = _242 * _236;
    float _252 = _244 * _236;
    float _254 = _246 * _236;
    float _256 = _248 * _236;
    out.m_34.x = _252;
    out.m_34.y = _254;
    out.m_34.z = _256;
    out.m_34.w = _250;
    out.m_36.x = _250;
    return out;
}

