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
    float2 _341 = float2(_91, _93);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_341, float2(0.0), isnan(_341))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float2 _360 = float2(_95, _97);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_360, float2(0.0), isnan(_360))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_360, float2(0.0), isnan(_360))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float2 _376 = float2(_99, _101);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_376, float2(0.0), isnan(_376))).xyzw;
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
    float _152 = in.m_39.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = _112 + (-1.0);
    float _160 = _89 * _138;
    float _162 = fma(_122, _132, _158);
    float _164 = _89 * _144;
    float _166 = -_160;
    float _168 = _162 + _166;
    float _170 = _89 * _150;
    float _172 = _164 * _168;
    float _174 = 0.0 + _172;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _176 * _170;
    bool _182 = _178 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_178);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_37.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_37.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_37.y;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_39.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_39.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    if (!_190)
    {
        discard_fragment();
    }
    float _222 = _116 * _126;
    float _224 = _118 * _128;
    float _226 = _120 * _130;
    float _228 = _222 * _106;
    float _230 = _224 * _108;
    float _232 = _226 * _110;
    float _234 = _89 * _196;
    float _236 = _89 * _202;
    float _238 = _89 * _208;
    float _240 = _89 * _214;
    float _242 = _89 * _220;
    float _244 = _89 * _156;
    float _246 = -_240;
    float _248 = _236 + _246;
    float _250 = -_242;
    float _252 = _238 + _250;
    float _254 = -_244;
    float _256 = _234 + _254;
    float _258 = fma(_228, _248, _240);
    float _260 = fma(_230, _252, _242);
    float _262 = fma(_232, _256, _244);
    if (!_190)
    {
        out.m_44.x = _258;
        out.m_44.y = _260;
        out.m_44.z = _262;
        out.m_44.w = _172;
        return out;
    }
    float _264 = 0.0 + _178;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    out.m_44.x = _258;
    out.m_44.y = _260;
    out.m_44.z = _262;
    out.m_44.w = _266;
    return out;
}

