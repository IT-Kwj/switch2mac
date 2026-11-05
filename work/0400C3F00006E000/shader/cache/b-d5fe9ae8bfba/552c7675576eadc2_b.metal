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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_41 [[user(locn4), flat]];
    float4 m_37 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _481 = float2(_79, _77);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_481, float2(0.0), isnan(_481))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = in.m_39.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_37.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_41.x;
    float _115 = in.m_37.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _75 * _93;
    float _123 = _75 * _99;
    float _125 = _75 * _105;
    float _127 = 1.0 / _121;
    float _129 = _113 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _131 = _113 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _133 = _123 * _127;
    float _135 = _125 * _127;
    float _137 = _85 * _85;
    float _139 = _75 * _111;
    float _141 = _87 * _87;
    float _143 = fma(_137, 2.0, -1.0);
    float _145 = fma(_141, 2.0, -1.0);
    float _147 = _75 * _119;
    float _149 = fma(_129, _143, _139);
    float2 _584 = float2(_133, _135);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_584, float2(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_584, float2(0.0), isnan(_584))).x;
    float _153 = fma(_131, _145, _147);
    float2 _596 = float2(_149, _153);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_596, float2(0.0), isnan(_596))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_596, float2(0.0), isnan(_596))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float _166 = in.m_39.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_43.w;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_45.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_47.w;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_49.x;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _198 = _75 * _170;
    float _200 = _198 * _127;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_200, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = _75 * _176;
    float _208 = 1.0 / _204;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _212 = _208 * _210;
    float _214 = in.m_43.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_45.y;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_45.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _234 = fma(_151, (*spvDescriptorSet0.fp_c8)._m0[30].w, _232);
    float _236 = _75 * _182;
    float _238 = 1.0 / _234;
    float _240 = -_206;
    float _242 = fma(_164, _236, _240);
    float _244 = _75 * _188;
    float _246 = _244 * _242;
    float _248 = _75 * _194;
    float _250 = 0.0 + _246;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _256 = -_212;
    float _258 = fma(_238, _254, _256);
    float _260 = _258 * _196;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _252 * _262;
    float _266 = _264 * _248;
    bool _270 = _266 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _272 = isnan(_266);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _278 = _274 || _276;
    float _280 = in.m_47.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_43.x;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_43.y;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_47.y;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_47.z;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    if (!_278)
    {
        discard_fragment();
    }
    float _310 = in.m_45.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = _158 * _158;
    float _318 = _160 * _160;
    float _320 = _162 * _162;
    float _322 = _75 * _284;
    float _324 = _75 * _290;
    float _326 = _75 * _296;
    float _328 = _75 * _302;
    float _330 = _75 * _218;
    float _332 = _75 * _308;
    float _334 = -_322;
    float _336 = _324 + _334;
    float _338 = -_328;
    float _340 = _326 + _338;
    float _342 = -_332;
    float _344 = _330 + _342;
    float _346 = fma(_316, _336, _322);
    float _348 = fma(_318, _340, _328);
    float _350 = _75 * _224;
    float _352 = fma(_320, _344, _332);
    float _354 = _75 * _230;
    float _356 = _348 * _350;
    float _358 = _75 * _314;
    float _360 = _352 * _354;
    float _362 = _346 * _358;
    if (!_278)
    {
        out.m_52.x = _362;
        out.m_52.y = _356;
        out.m_52.z = _360;
        out.m_52.w = _246;
        return out;
    }
    float _364 = _356 * 0.715200006961822509765625;
    float _366 = in.m_54.w;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_54.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_54.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = fma(_362, 0.2125999927520751953125, _364);
    float _386 = in.m_54.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = fma(_360, 0.072200000286102294921875, _384);
    bool _394 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _396 = 1.0 / _392;
    float _398 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_394)
    {
        float _400 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _402 = _212 + _400;
        _398 = _402;
    }
    float _404 = _398;
    float _406 = _396 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = fma(_408, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _412 = _75 * _370;
    float _414 = _75 * _382;
    float _416 = _410 * _412;
    float _418 = 0.0 + _266;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _412;
    float _424 = _420;
    if (_394)
    {
        float _426 = _404 * 8.0;
        float _428 = precise::clamp(_426, 0.0, 1.0);
        _422 = _428;
    }
    float _430 = _422;
    float _432 = _75 * _376;
    float _434 = _75 * _390;
    float _436 = fma(_356, _416, _414);
    if (_394)
    {
        float _438 = _420 * _430;
        _424 = _438;
    }
    float _440 = _424;
    float _442 = fma(_362, _416, _432);
    float _444 = fma(_360, _416, _434);
    float _446 = 0.0 + _440;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    out.m_52.x = _442;
    out.m_52.y = _436;
    out.m_52.z = _444;
    out.m_52.w = _448;
    return out;
}

