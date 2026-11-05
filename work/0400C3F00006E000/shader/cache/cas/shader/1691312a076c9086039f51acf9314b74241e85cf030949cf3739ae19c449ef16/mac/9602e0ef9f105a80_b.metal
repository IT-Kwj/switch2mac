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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_31 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_31.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _49;
    float _77 = _75 * _55;
    float _79 = _75 * _61;
    float _81 = _75 * _67;
    float _83 = _75 * _73;
    float2 _305 = float2(_77, _83);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_305, float2(0.0), isnan(_305))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_305, float2(0.0), isnan(_305))).w;
    float2 _316 = float2(_79, _81);
    float4 _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_316, float2(0.0), isnan(_316))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_316, float2(0.0), isnan(_316))).xyzw;
    float _90 = _88.x;
    float _92 = _88.y;
    float _94 = _88.z;
    float _96 = _88.w;
    float _98 = in.m_33.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_35.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_37.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = _75 * _108;
    float _118 = in.m_35.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_39.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_33.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_33.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_33.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _75 * _128;
    float _156 = _75 * _140;
    float _158 = _75 * _146;
    float _160 = _96 * _85;
    float _162 = _75 * _102;
    float _164 = _160 * _162;
    float _166 = _75 * _114;
    float _168 = _116 * _164;
    float _170 = 0.0 + _168;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _172 * _166;
    bool _178 = _174 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _180 = isnan(_174);
    bool _182 = _178 || _180;
    bool _184 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _186 = _182 || _184;
    float _188 = in.m_35.y;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_39.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_35.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    if (!_186)
    {
        discard_fragment();
    }
    float _206 = _75 * _122;
    float _208 = _90 * _90;
    float _210 = _92 * _92;
    float _212 = _94 * _94;
    float _214 = _75 * _192;
    float _216 = _75 * _198;
    float _218 = _75 * _204;
    float _220 = _75 * _134;
    float _222 = -_154;
    float _224 = _214 + _222;
    float _226 = -_216;
    float _228 = _206 + _226;
    float _230 = _75 * _152;
    float _232 = -_220;
    float _234 = _218 + _232;
    float _236 = fma(_210, _224, _154);
    float _238 = fma(_208, _228, _216);
    float _240 = fma(_212, _234, _220);
    float _242 = _236 * _158;
    float _244 = _238 * _156;
    float _246 = _240 * _230;
    if (!_186)
    {
        out.m_42.x = _244;
        out.m_42.y = _242;
        out.m_42.z = _246;
        out.m_42.w = _168;
        return out;
    }
    float _248 = 0.0 + _174;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    out.m_42.x = _244;
    out.m_42.y = _242;
    out.m_42.z = _246;
    out.m_42.w = _250;
    return out;
}

