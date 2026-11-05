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
    float2 _398 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_398, float2(0.0), isnan(_398))).x;
    float2 _409 = float2(_93, _97);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).xyzw;
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
    float _154 = in.m_39.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_41.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_41.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _174 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[30].w, _172);
    float _176 = -_150;
    float _178 = _114 + _176;
    float _180 = _85 * _132;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _184 = _152 * _182;
    float _186 = 1.0 / _174;
    float _188 = _180 * _178;
    float _190 = 0.0 + _188;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _196 = -_184;
    float _198 = fma(_186, _194, _196);
    float _200 = _198 * _140;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _85 * _138;
    float _206 = _192 * _202;
    float _208 = _206 * _204;
    bool _212 = _208 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _214 = isnan(_208);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _220 = _216 || _218;
    float _222 = in.m_39.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_39.z;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_41.x;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = _184;
    float _242 = _112;
    if (!_220)
    {
        discard_fragment();
    }
    float _244 = _85 * _164;
    float _246 = _85 * _226;
    float _248 = _85 * _158;
    float _250 = _85 * _232;
    float _252 = _85 * _238;
    float _254 = _85 * _170;
    float _256 = -_244;
    float _258 = _248 + _256;
    float _260 = _110 * _110;
    float _262 = -_252;
    float _264 = _246 + _262;
    float _266 = -_254;
    float _268 = _250 + _266;
    float _270 = _108 * _108;
    float _272 = _112 * _112;
    float _274 = fma(_260, _258, _244);
    float _276 = fma(_270, _264, _252);
    float _278 = fma(_272, _268, _254);
    if (!_220)
    {
        out.m_46.x = _276;
        out.m_46.y = _274;
        out.m_46.z = _278;
        out.m_46.w = _188;
        return out;
    }
    float _280 = _274 * 0.715200006961822509765625;
    float _282 = fma(_276, 0.2125999927520751953125, _280);
    float _284 = fma(_278, 0.072200000286102294921875, _282);
    bool _286 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _288 = 1.0 / _284;
    float _290 = 0.0 + _208;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = _292;
    if (_286)
    {
        float _296 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _298 = _184 + _296;
        _240 = _298;
    }
    float _300 = _240;
    float _302 = _288 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    if (_286)
    {
        float _306 = _300 * 8.0;
        float _308 = precise::clamp(_306, 0.0, 1.0);
        _242 = _308;
    }
    float _310 = _242;
    float _312 = fma(_304, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_286)
    {
        float _314 = _292 * _310;
        _294 = _314;
    }
    float _316 = _294;
    float _318 = _276 * _312;
    float _320 = _274 * _312;
    float _322 = _278 * _312;
    float _324 = 0.0 + _316;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    out.m_46.x = _318;
    out.m_46.y = _320;
    out.m_46.z = _322;
    out.m_46.w = _326;
    return out;
}

