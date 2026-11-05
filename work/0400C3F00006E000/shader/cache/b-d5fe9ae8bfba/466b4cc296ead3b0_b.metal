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
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _87 * _85;
    float _101 = _91 * _97;
    float _103 = _93 * _97;
    float2 _422 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_422, float2(0.0), isnan(_422))).x;
    float2 _433 = float2(_95, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_433, float2(0.0), isnan(_433))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_43.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _144 = _87 * _122;
    float _146 = _144 * _97;
    float _148 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _148);
    float _152 = _87 * _128;
    float _154 = 1.0 / _150;
    float _156 = in.m_41.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_45.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_45.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_39.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_39.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_39.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _87 * _184;
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _196 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _194);
    float _198 = _116 * _152;
    float _200 = _87 * _134;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _204 = _154 * _202;
    float _206 = 1.0 / _196;
    float _208 = _200 * _198;
    float _210 = 0.0 + _208;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _216 = -_204;
    float _218 = fma(_206, _214, _216);
    float _220 = _218 * _142;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _87 * _140;
    float _226 = _212 * _222;
    float _228 = _226 * _224;
    bool _232 = _228 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _234 = isnan(_228);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _240 = _236 || _238;
    float _242 = in.m_41.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_45.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_41.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _204;
    float _262 = _114;
    if (!_240)
    {
        discard_fragment();
    }
    float _264 = _87 * _166;
    float _266 = _87 * _190;
    float _268 = _87 * _246;
    float _270 = _87 * _160;
    float _272 = _87 * _252;
    float _274 = _87 * _258;
    float _276 = _87 * _172;
    float _278 = -_264;
    float _280 = _270 + _278;
    float _282 = -_272;
    float _284 = _268 + _282;
    float _286 = _87 * _178;
    float _288 = -_276;
    float _290 = _274 + _288;
    float _292 = fma(_112, _280, _264);
    float _294 = fma(_110, _284, _272);
    float _296 = fma(_114, _290, _276);
    float _298 = _292 * _192;
    float _300 = _294 * _286;
    float _302 = _296 * _266;
    if (!_240)
    {
        out.m_48.x = _300;
        out.m_48.y = _298;
        out.m_48.z = _302;
        out.m_48.w = _208;
        return out;
    }
    float _304 = _298 * 0.715200006961822509765625;
    float _306 = fma(_300, 0.2125999927520751953125, _304);
    float _308 = fma(_302, 0.072200000286102294921875, _306);
    bool _310 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _312 = 1.0 / _308;
    float _314 = 0.0 + _228;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _316;
    if (_310)
    {
        float _320 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _322 = _204 + _320;
        _260 = _322;
    }
    float _324 = _260;
    float _326 = _312 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    if (_310)
    {
        float _330 = _324 * 8.0;
        float _332 = precise::clamp(_330, 0.0, 1.0);
        _262 = _332;
    }
    float _334 = _262;
    float _336 = fma(_328, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_310)
    {
        float _338 = _316 * _334;
        _318 = _338;
    }
    float _340 = _318;
    float _342 = _300 * _336;
    float _344 = _298 * _336;
    float _346 = _302 * _336;
    float _348 = 0.0 + _340;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    out.m_48.x = _342;
    out.m_48.y = _344;
    out.m_48.z = _346;
    out.m_48.w = _350;
    return out;
}

