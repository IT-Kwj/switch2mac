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
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.x;
    float _91 = 1.0 / _57;
    float _93 = _91 * _63;
    float _95 = _91 * _69;
    float _97 = _91 * _75;
    float _99 = _91 * _81;
    float _101 = 1.0 / _93;
    float _103 = _91 * _87;
    float _105 = fma(_89, 0.119999997317790985107421875, 1.0);
    float _107 = _95 + (-0.5);
    float _109 = _97 + (-0.5);
    float _111 = fma(_107, _105, 0.5);
    float _113 = fma(_109, _105, 0.5);
    float _115 = _99 * _101;
    float _117 = _103 * _101;
    float2 _508 = float2(_115, _117);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_508, float2(0.0), isnan(_508))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_508, float2(0.0), isnan(_508))).x;
    float2 _519 = float2(_95, _97);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_519, float2(0.0), isnan(_519))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float2 _535 = float2(_111, _113);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_535, float2(0.0), isnan(_535))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float _142 = in.m_35.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_41.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_43.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _162 = _91 * _146;
    float _164 = _91 * _152;
    float _166 = _162 * _101;
    float _168 = in.m_45.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _176 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[30].w, _174);
    float _178 = 1.0 / _176;
    float _180 = _91 * _158;
    float _182 = _164 * _180;
    float _184 = in.m_41.y;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_43.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_41.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = _130 * _182;
    float _208 = _140 * _140;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _212 = _178 * _210;
    float _214 = _91 * _172;
    float _216 = 1.0 / _204;
    float _218 = fma(_208, _182, _206);
    float _220 = 0.0 + _218;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _226 = -_212;
    float _228 = fma(_216, _224, _226);
    float _230 = _228 * _160;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = _222 * _232;
    float _236 = _234 * _214;
    bool _240 = _236 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _242 = isnan(_236);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _248 = _244 || _246;
    float _250 = in.m_43.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_43.y;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_41.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = _212;
    if (!_248)
    {
        discard_fragment();
    }
    float _270 = -_134;
    float _272 = _270 + 1.0;
    float _274 = -_136;
    float _276 = _274 + 1.0;
    float _278 = -_124;
    float _280 = _278 + 1.0;
    float _282 = -_126;
    float _284 = _282 + 1.0;
    float _286 = _91 * _254;
    float _288 = _91 * _260;
    float _290 = _91 * _266;
    float _292 = _91 * _188;
    float _294 = _286 * _272;
    float _296 = _288 * _276;
    float _298 = _91 * _194;
    float _300 = _288 * _284;
    float _302 = fma(_134, _290, _294);
    float _304 = -_138;
    float _306 = _304 + 1.0;
    float _308 = _91 * _200;
    float _310 = -_128;
    float _312 = _310 + 1.0;
    float _314 = fma(_136, _292, _296);
    float _316 = _298 * _306;
    float _318 = _286 * _280;
    float _320 = _298 * _312;
    float _322 = fma(_138, _308, _316);
    float _324 = fma(_290, _124, _318);
    float _326 = fma(_292, _126, _300);
    float _328 = fma(_308, _128, _320);
    float _330 = _302 + _324;
    float _332 = _314 + _326;
    float _334 = _322 + _328;
    if (!_248)
    {
        out.m_48.x = _330;
        out.m_48.y = _332;
        out.m_48.z = _334;
        out.m_48.w = _218;
        return out;
    }
    float _336 = _332 * 0.715200006961822509765625;
    float _338 = in.m_50.w;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_50.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_50.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = fma(_330, 0.2125999927520751953125, _336);
    float _358 = in.m_50.z;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = fma(_334, 0.072200000286102294921875, _356);
    bool _366 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _368 = 1.0 / _364;
    float _370 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_366)
    {
        float _372 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _374 = _212 + _372;
        _268 = _374;
    }
    float _376 = _268;
    float _378 = _368 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = fma(_380, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _384 = _91 * _342;
    if (_366)
    {
        float _386 = _376 * 8.0;
        float _388 = precise::clamp(_386, 0.0, 1.0);
        _370 = _388;
    }
    float _390 = _370;
    float _392 = _91 * _348;
    float _394 = _382 * _384;
    float _396 = 0.0 + _236;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = _91 * _354;
    float _402 = _91 * _362;
    float _404 = fma(_330, _394, _392);
    float _406 = _398;
    if (_366)
    {
        float _408 = _398 * _390;
        _406 = _408;
    }
    float _410 = _406;
    float _412 = fma(_332, _394, _400);
    float _414 = fma(_334, _394, _402);
    float _416 = 0.0 + _410;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    out.m_48.x = _404;
    out.m_48.y = _412;
    out.m_48.z = _414;
    out.m_48.w = _418;
    return out;
}

