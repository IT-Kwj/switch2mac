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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
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
    float2 _440 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_440, float2(0.0), isnan(_440))).x;
    float2 _451 = float2(_95, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _126 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _124);
    float _128 = in.m_39.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _126);
    float _136 = in.m_41.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = rsqrt(_134);
    float _144 = _87 * _122;
    float _146 = _142 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _148 = _144 * _97;
    float _150 = precise::max(_146, 0.4000000059604644775390625);
    float _152 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _154 = fma(_148, (*spvDescriptorSet0.fp_c8)._m0[30].w, _152);
    float _156 = precise::min(_150, 0.699999988079071044921875);
    float _158 = 1.0 / _154;
    float _160 = fma(_156, -3.333333492279052734375, 2.333333492279052734375);
    float _162 = _87 * _132;
    float _164 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _166 = _158 * _164;
    float _168 = _87 * _140;
    float _170 = in.m_43.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_43.z;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_39.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_39.y;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_39.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _202 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _200);
    float _204 = 1.0 / _202;
    float _206 = _116 * _162;
    float _208 = _206 * _160;
    float _210 = 0.0 + _208;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _216 = -_166;
    float _218 = fma(_204, _214, _216);
    float _220 = abs(_218);
    bool _224 = _220 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _226 = float(_224);
    float _228 = _212 * _226;
    float _230 = _228 * _168;
    bool _232 = _230 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _234 = isnan(_230);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _240 = _236 || _238;
    float _242 = in.m_43.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = _166;
    if (!_240)
    {
        discard_fragment();
    }
    float _250 = _87 * _180;
    float _252 = -_112;
    float _254 = _252 + 1.0;
    float _256 = -_114;
    float _258 = _256 + 1.0;
    float _260 = _250 * _258;
    float _262 = _87 * _192;
    float _264 = _87 * _246;
    float _266 = _87 * _174;
    float _268 = -_110;
    float _270 = _268 + 1.0;
    float _272 = _266 * _254;
    float _274 = _264 * _270;
    float _276 = _87 * _186;
    float _278 = _87 * _198;
    float _280 = fma(_110, _276, _274);
    float _282 = fma(_112, _262, _272);
    float _284 = fma(_114, _278, _260);
    float _286 = _272;
    if (!_240)
    {
        out.m_46.x = _280;
        out.m_46.y = _282;
        out.m_46.z = _284;
        out.m_46.w = _208;
        return out;
    }
    float _288 = _282 * 0.715200006961822509765625;
    float _290 = in.m_48.w;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_48.x;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_48.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_280, 0.2125999927520751953125, _288);
    float _310 = in.m_48.z;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = fma(_284, 0.072200000286102294921875, _308);
    bool _318 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _320 = 1.0 / _316;
    if (_318)
    {
        float _322 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _324 = _166 + _322;
        _248 = _324;
    }
    float _326 = _248;
    if (_318)
    {
        float _328 = _326 * 8.0;
        float _330 = precise::clamp(_328, 0.0, 1.0);
        _286 = _330;
    }
    float _332 = _286;
    float _334 = _320 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = fma(_336, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _340 = _87 * _294;
    float _342 = _87 * _300;
    float _344 = _87 * _306;
    float _346 = _338 * _340;
    float _348 = 0.0 + _230;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = _87 * _314;
    float _354 = fma(_280, _346, _342);
    float _356 = _350;
    if (_318)
    {
        float _358 = _350 * _332;
        _356 = _358;
    }
    float _360 = _356;
    float _362 = fma(_282, _346, _344);
    float _364 = fma(_284, _346, _352);
    float _366 = 0.0 + _360;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    out.m_46.x = _354;
    out.m_46.y = _362;
    out.m_46.z = _364;
    out.m_46.w = _368;
    return out;
}

