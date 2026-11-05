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
    float2 _380 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_380, float2(0.0), isnan(_380))).x;
    float2 _391 = float2(_93, _97);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_391, float2(0.0), isnan(_391))).xyzw;
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
    float _154 = in.m_39.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_43.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_43.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_43.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _180 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[30].w, _178);
    float _182 = 1.0 / _180;
    float _184 = _114 * _144;
    float _186 = 0.0 + _184;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _192 = -_152;
    float _194 = fma(_182, _190, _192);
    float _196 = _194 * _134;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _188 * _198;
    float _202 = _200 * _146;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _208 = isnan(_202);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _214 = _210 || _212;
    float _216 = in.m_39.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_39.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _152;
    float _230 = _112;
    if (!_214)
    {
        discard_fragment();
    }
    float _232 = _85 * _158;
    float _234 = _85 * _170;
    float _236 = _85 * _220;
    float _238 = _85 * _226;
    float _240 = _85 * _164;
    float _242 = _85 * _176;
    float _244 = -_234;
    float _246 = _236 + _244;
    float _248 = -_240;
    float _250 = _232 + _248;
    float _252 = -_242;
    float _254 = _238 + _252;
    float _256 = fma(_110, _246, _234);
    float _258 = fma(_108, _250, _240);
    float _260 = fma(_112, _254, _242);
    if (!_214)
    {
        out.m_46.x = _258;
        out.m_46.y = _256;
        out.m_46.z = _260;
        out.m_46.w = _184;
        return out;
    }
    float _262 = _256 * 0.715200006961822509765625;
    float _264 = fma(_258, 0.2125999927520751953125, _262);
    float _266 = fma(_260, 0.072200000286102294921875, _264);
    bool _268 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _270 = 1.0 / _266;
    float _272 = 0.0 + _202;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _274;
    if (_268)
    {
        float _278 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _280 = _152 + _278;
        _228 = _280;
    }
    float _282 = _228;
    float _284 = _270 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    if (_268)
    {
        float _288 = _282 * 8.0;
        float _290 = precise::clamp(_288, 0.0, 1.0);
        _230 = _290;
    }
    float _292 = _230;
    float _294 = fma(_286, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_268)
    {
        float _296 = _274 * _292;
        _276 = _296;
    }
    float _298 = _276;
    float _300 = _258 * _294;
    float _302 = _256 * _294;
    float _304 = _260 * _294;
    float _306 = 0.0 + _298;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    out.m_46.x = _300;
    out.m_46.y = _302;
    out.m_46.z = _304;
    out.m_46.w = _308;
    return out;
}

