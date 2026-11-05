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
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
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
    float2 _378 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_378, float2(0.0), isnan(_378))).x;
    float2 _389 = float2(_93, _97);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).xyzw;
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
    float _128 = in.m_41.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_43.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _142 = _85 * _120;
    float _144 = _142 * _95;
    float _146 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _148 = fma(_144, (*spvDescriptorSet0.fp_c8)._m0[30].w, _146);
    float _150 = _85 * _126;
    float _152 = 1.0 / _148;
    float _154 = in.m_39.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_41.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _168 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[30].w, _166);
    float _170 = _114 * _150;
    float _172 = _85 * _132;
    float _174 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _176 = _152 * _174;
    float _178 = _85 * _138;
    float _180 = 1.0 / _168;
    float _182 = _172 * _170;
    float _184 = 0.0 + _182;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _190 = -_176;
    float _192 = fma(_180, _188, _190);
    float _194 = _192 * _140;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _186 * _196;
    float _200 = _198 * _178;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _206 = isnan(_200);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _212 = _208 || _210;
    float _214 = in.m_39.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_39.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_41.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_41.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = _176;
    float _240 = _112;
    if (!_212)
    {
        discard_fragment();
    }
    float _242 = _85 * _218;
    float _244 = _85 * _158;
    float _246 = _85 * _224;
    float _248 = _85 * _230;
    float _250 = _85 * _236;
    float _252 = _85 * _164;
    float _254 = fma(_108, _246, _248);
    float _256 = fma(_110, _242, _250);
    float _258 = fma(_112, _244, _252);
    if (!_212)
    {
        out.m_46.x = _254;
        out.m_46.y = _256;
        out.m_46.z = _258;
        out.m_46.w = _182;
        return out;
    }
    float _260 = _256 * 0.715200006961822509765625;
    float _262 = fma(_254, 0.2125999927520751953125, _260);
    float _264 = fma(_258, 0.072200000286102294921875, _262);
    bool _266 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _268 = 1.0 / _264;
    float _270 = 0.0 + _200;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _272;
    if (_266)
    {
        float _276 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _278 = _176 + _276;
        _238 = _278;
    }
    float _280 = _238;
    float _282 = _268 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    if (_266)
    {
        float _286 = _280 * 8.0;
        float _288 = precise::clamp(_286, 0.0, 1.0);
        _240 = _288;
    }
    float _290 = _240;
    float _292 = fma(_284, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_266)
    {
        float _294 = _272 * _290;
        _274 = _294;
    }
    float _296 = _274;
    float _298 = _254 * _292;
    float _300 = _256 * _292;
    float _302 = _258 * _292;
    float _304 = 0.0 + _296;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    out.m_46.x = _298;
    out.m_46.y = _300;
    out.m_46.z = _302;
    out.m_46.w = _306;
    return out;
}

