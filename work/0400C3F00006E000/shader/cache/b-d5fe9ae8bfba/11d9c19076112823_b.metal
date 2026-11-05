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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _53;
    float _87 = _85 * _59;
    float _89 = _85 * _65;
    float _91 = _85 * _71;
    float _93 = _85 * _77;
    float _95 = 1.0 / _87;
    float _97 = _85 * _83;
    float _99 = _89 * _95;
    float _101 = _91 * _95;
    float2 _368 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_368, float2(0.0), isnan(_368))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_368, float2(0.0), isnan(_368))).x;
    float2 _379 = float2(_93, _97);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_35.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_41.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _136 = _85 * _120;
    float _138 = _136 * _95;
    float _140 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c8)._m0[30].w, _140);
    float _144 = _85 * _126;
    float _146 = _85 * _132;
    float _148 = 1.0 / _142;
    float _150 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _152 = _148 * _150;
    float _154 = in.m_43.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_39.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_43.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_43.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _85 * _164;
    float _180 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _182 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[30].w, _180);
    float _184 = 1.0 / _182;
    float _186 = _114 * _144;
    float _188 = 0.0 + _186;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _194 = -_152;
    float _196 = fma(_184, _192, _194);
    float _198 = _196 * _134;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _190 * _200;
    float _204 = _202 * _146;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _210 = isnan(_204);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _216 = _212 || _214;
    float _218 = in.m_39.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_39.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = _152;
    float _232 = _112;
    if (!_216)
    {
        discard_fragment();
    }
    float _234 = _85 * _170;
    float _236 = _85 * _222;
    float _238 = _85 * _228;
    float _240 = _85 * _158;
    float _242 = _85 * _176;
    float _244 = fma(_108, _178, _240);
    float _246 = fma(_110, _236, _234);
    float _248 = fma(_112, _238, _242);
    if (!_216)
    {
        out.m_46.x = _244;
        out.m_46.y = _246;
        out.m_46.z = _248;
        out.m_46.w = _186;
        return out;
    }
    float _250 = _246 * 0.715200006961822509765625;
    float _252 = fma(_244, 0.2125999927520751953125, _250);
    float _254 = fma(_248, 0.072200000286102294921875, _252);
    bool _256 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _258 = 1.0 / _254;
    float _260 = 0.0 + _204;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _262;
    if (_256)
    {
        float _266 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _268 = _152 + _266;
        _230 = _268;
    }
    float _270 = _230;
    float _272 = _258 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    if (_256)
    {
        float _276 = _270 * 8.0;
        float _278 = precise::clamp(_276, 0.0, 1.0);
        _232 = _278;
    }
    float _280 = _232;
    float _282 = fma(_274, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_256)
    {
        float _284 = _262 * _280;
        _264 = _284;
    }
    float _286 = _264;
    float _288 = _244 * _282;
    float _290 = _246 * _282;
    float _292 = _248 * _282;
    float _294 = 0.0 + _286;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    out.m_46.x = _288;
    out.m_46.y = _290;
    out.m_46.z = _292;
    out.m_46.w = _296;
    return out;
}

