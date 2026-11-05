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
    constant _16* fp_c9 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_31.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _47;
    float _75 = _73 * _53;
    float _77 = _73 * _59;
    float _79 = _73 * _65;
    float _81 = _73 * _71;
    float2 _293 = float2(_75, _77);
    float4 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_293, float2(0.0), isnan(_293))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_293, float2(0.0), isnan(_293))).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float2 _312 = float2(_79, _81);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_312, float2(0.0), isnan(_312))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float _104 = in.m_33.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_35.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_37.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_35.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_33.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _73 * _132;
    float _136 = _92 * _102;
    float _138 = _73 * _108;
    float _140 = _73 * _114;
    float _142 = _136 * _138;
    float _144 = _73 * _120;
    float _146 = _140 * _142;
    float _148 = 0.0 + _146;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = _150 * _144;
    bool _156 = _152 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _158 = isnan(_152);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _164 = _160 || _162;
    float _166 = in.m_35.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_33.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_33.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_35.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    if (!_164)
    {
        discard_fragment();
    }
    float _190 = _96 * _96;
    float _192 = _98 * _98;
    float _194 = _86 * _86;
    float _196 = _88 * _88;
    float _198 = _90 * _90;
    float _200 = _100 * _100;
    float _202 = _194 * _190;
    float _204 = _196 * _192;
    float _206 = _198 * _200;
    float _208 = _73 * _170;
    float _210 = _73 * _176;
    float _212 = _73 * _182;
    float _214 = _73 * _188;
    float _216 = _73 * _126;
    float _218 = -_208;
    float _220 = _212 + _218;
    float _222 = -_214;
    float _224 = _210 + _222;
    float _226 = -_216;
    float _228 = _134 + _226;
    float _230 = fma(_204, _220, _208);
    float _232 = fma(_202, _224, _214);
    float _234 = fma(_206, _228, _216);
    if (!_164)
    {
        out.m_40.x = _232;
        out.m_40.y = _230;
        out.m_40.z = _234;
        out.m_40.w = _146;
        return out;
    }
    float _236 = 0.0 + _152;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    out.m_40.x = _232;
    out.m_40.y = _230;
    out.m_40.z = _234;
    out.m_40.w = _238;
    return out;
}

