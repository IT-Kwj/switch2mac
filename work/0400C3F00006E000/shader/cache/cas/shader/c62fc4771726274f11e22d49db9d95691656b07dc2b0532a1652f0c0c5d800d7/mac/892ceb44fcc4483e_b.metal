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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _51;
    float _91 = _89 * _57;
    float _93 = _89 * _63;
    float _95 = _89 * _69;
    float _97 = _89 * _75;
    float _99 = _89 * _81;
    float _101 = _89 * _87;
    float2 _359 = float2(_91, _93);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_359, float2(0.0), isnan(_359))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_359, float2(0.0), isnan(_359))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float2 _378 = float2(_95, _97);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_378, float2(0.0), isnan(_378))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float2 _394 = float2(_99, _101);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_394, float2(0.0), isnan(_394))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float _134 = in.m_37.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_39.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_39.y;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_39.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _112 + (-1.0);
    float _166 = _89 * _138;
    float _168 = fma(_122, _132, _164);
    float _170 = _89 * _144;
    float _172 = -_166;
    float _174 = _168 + _172;
    float _176 = _89 * _150;
    float _178 = _170 * _174;
    float _180 = 0.0 + _178;
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = _182 * _176;
    bool _188 = _184 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _190 = isnan(_184);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _196 = _192 || _194;
    float _198 = in.m_37.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_37.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_37.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_39.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    if (!_196)
    {
        discard_fragment();
    }
    float _222 = _126 * _126;
    float _224 = _118 * _118;
    float _226 = _128 * _128;
    float _228 = _116 * _116;
    float _230 = _120 * _120;
    float _232 = _130 * _130;
    float _234 = _224 * _226;
    float _236 = _228 * _222;
    float _238 = _108 * _108;
    float _240 = _230 * _232;
    float _242 = _89 * _156;
    float _244 = _106 * _106;
    float _246 = _110 * _110;
    float _248 = _89 * _162;
    float _250 = _234 * _238;
    float _252 = _89 * _202;
    float _254 = _89 * _208;
    float _256 = _89 * _214;
    float _258 = _89 * _220;
    float _260 = _236 * _244;
    float _262 = _240 * _246;
    float _264 = -_242;
    float _266 = _252 + _264;
    float _268 = -_258;
    float _270 = _254 + _268;
    float _272 = -_248;
    float _274 = _256 + _272;
    float _276 = fma(_250, _266, _242);
    float _278 = fma(_260, _270, _258);
    float _280 = fma(_262, _274, _248);
    if (!_196)
    {
        out.m_44.x = _278;
        out.m_44.y = _276;
        out.m_44.z = _280;
        out.m_44.w = _178;
        return out;
    }
    float _282 = 0.0 + _184;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    out.m_44.x = _278;
    out.m_44.y = _276;
    out.m_44.z = _280;
    out.m_44.w = _284;
    return out;
}

