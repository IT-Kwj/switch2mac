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
    float4 m_48 [[user(locn6)]];
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
    float2 _416 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_416, float2(0.0), isnan(_416))).x;
    float2 _427 = float2(_95, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).xyzw;
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
    float _130 = in.m_41.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _138 = _87 * _122;
    float _140 = _138 * _97;
    float _142 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c8)._m0[30].w, _142);
    float _146 = _87 * _128;
    float _148 = 1.0 / _144;
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
    float _172 = in.m_39.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_43.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = _87 * _164;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _188 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _186);
    float _190 = 1.0 / _188;
    float _192 = _116 * _146;
    float _194 = 0.0 + _192;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _200 = -_152;
    float _202 = fma(_190, _198, _200);
    float _204 = _202 * _136;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = _87 * _134;
    float _210 = _196 * _206;
    float _212 = _210 * _208;
    bool _216 = _212 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _218 = isnan(_212);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _224 = _220 || _222;
    float _226 = in.m_39.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _152;
    if (!_224)
    {
        discard_fragment();
    }
    float _234 = _87 * _158;
    float _236 = _87 * _170;
    float _238 = _87 * _176;
    float _240 = -_184;
    float _242 = _234 + _240;
    float _244 = fma(_110, _242, _184);
    float _246 = _87 * _230;
    float _248 = _87 * _182;
    float _250 = -_236;
    float _252 = _246 + _250;
    float _254 = -_248;
    float _256 = _238 + _254;
    float _258 = fma(_112, _252, _236);
    float _260 = fma(_114, _256, _248);
    float _262 = _236;
    if (!_224)
    {
        out.m_46.x = _244;
        out.m_46.y = _258;
        out.m_46.z = _260;
        out.m_46.w = _192;
        return out;
    }
    float _264 = _258 * 0.715200006961822509765625;
    float _266 = in.m_48.w;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_48.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_48.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = fma(_244, 0.2125999927520751953125, _264);
    float _286 = in.m_48.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_260, 0.072200000286102294921875, _284);
    bool _294 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _296 = 1.0 / _292;
    if (_294)
    {
        float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _300 = _152 + _298;
        _232 = _300;
    }
    float _302 = _232;
    if (_294)
    {
        float _304 = _302 * 8.0;
        float _306 = precise::clamp(_304, 0.0, 1.0);
        _262 = _306;
    }
    float _308 = _262;
    float _310 = _296 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = fma(_312, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _316 = _87 * _270;
    float _318 = _87 * _276;
    float _320 = _87 * _282;
    float _322 = _314 * _316;
    float _324 = 0.0 + _212;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _87 * _290;
    float _330 = fma(_244, _322, _318);
    float _332 = _326;
    if (_294)
    {
        float _334 = _326 * _308;
        _332 = _334;
    }
    float _336 = _332;
    float _338 = fma(_258, _322, _320);
    float _340 = fma(_260, _322, _328);
    float _342 = 0.0 + _336;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    out.m_46.x = _330;
    out.m_46.y = _338;
    out.m_46.z = _340;
    out.m_46.w = _344;
    return out;
}

