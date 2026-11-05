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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_31 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.z;
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
    float2 _323 = float2(_77, _79);
    float4 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_323, float2(0.0), isnan(_323))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_323, float2(0.0), isnan(_323))).xyzw;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float _94 = _86.w;
    float2 _342 = float2(_81, _83);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_342, float2(0.0), isnan(_342))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_342, float2(0.0), isnan(_342))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float _106 = in.m_33.w;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_35.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _75 * _110;
    float _132 = in.m_37.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_37.y;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_37.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_33.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_33.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_33.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = _75 * _154;
    float _170 = _75 * _166;
    float _172 = _94 * _104;
    float _174 = _172 * _130;
    float _176 = _75 * _116;
    float _178 = _75 * _122;
    float _180 = _176 * _174;
    float _182 = _75 * _128;
    float _184 = _178 * _180;
    float _186 = 0.0 + _184;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _188 * _182;
    bool _194 = _190 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _196 = isnan(_190);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _202 = _198 || _200;
    float _204 = in.m_35.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_35.y;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_35.z;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    if (!_202)
    {
        discard_fragment();
    }
    float _222 = _88 * _98;
    float _224 = _90 * _100;
    float _226 = _92 * _102;
    float _228 = _75 * _136;
    float _230 = _75 * _142;
    float _232 = _75 * _148;
    float _234 = _75 * _208;
    float _236 = _75 * _214;
    float _238 = _75 * _220;
    float _240 = _75 * _160;
    float _242 = -_228;
    float _244 = _234 + _242;
    float _246 = -_230;
    float _248 = _236 + _246;
    float _250 = -_232;
    float _252 = _238 + _250;
    float _254 = fma(_222, _244, _228);
    float _256 = fma(_224, _248, _230);
    float _258 = fma(_226, _252, _232);
    float _260 = _254 * _168;
    float _262 = _256 * _240;
    float _264 = _258 * _170;
    if (!_202)
    {
        out.m_42.x = _260;
        out.m_42.y = _262;
        out.m_42.z = _264;
        out.m_42.w = _184;
        return out;
    }
    float _266 = 0.0 + _190;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    out.m_42.x = _260;
    out.m_42.y = _262;
    out.m_42.z = _264;
    out.m_42.w = _268;
    return out;
}

