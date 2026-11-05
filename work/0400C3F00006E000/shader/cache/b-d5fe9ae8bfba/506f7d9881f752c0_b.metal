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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / _59;
    float _105 = _103 * _65;
    float _107 = _103 * _71;
    float _109 = _103 * _77;
    float _111 = _103 * _83;
    float _113 = 1.0 / _105;
    float _115 = _103 * _89;
    float _117 = _103 * _95;
    float _119 = _103 * _101;
    float _121 = _107 * _113;
    float _123 = _109 * _113;
    float2 _531 = float2(_123, _121);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_531, float2(0.0), isnan(_531))).x;
    float2 _542 = float2(_111, _115);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_542, float2(0.0), isnan(_542))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float2 _558 = float2(_117, _119);
    float4 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_558, float2(0.0), isnan(_558))).xyzw;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _138.w;
    float _148 = in.m_37.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_43.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_45.w;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_47.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _103 * _152;
    float _180 = _178 * _113;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _184 = fma(_180, (*spvDescriptorSet0.fp_c8)._m0[30].w, _182);
    float _186 = 1.0 / _184;
    float _188 = _103 * _176;
    float _190 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _192 = _186 * _190;
    float _194 = in.m_41.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_45.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_43.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_43.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _220 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _218);
    float _222 = 1.0 / _220;
    float _224 = _136 * _146;
    float _226 = _103 * _158;
    float _228 = _103 * _164;
    float _230 = -_226;
    float _232 = fma(_224, _228, _230);
    float _234 = _103 * _170;
    float _236 = _234 * _232;
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _240 = -_192;
    float _242 = fma(_222, _238, _240);
    float _244 = 0.0 + _236;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = abs(_242);
    bool _252 = _248 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _254 = float(_252);
    float _256 = _246 * _254;
    float _258 = _256 * _188;
    bool _260 = _258 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _262 = isnan(_258);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _268 = _264 || _266;
    float _270 = in.m_41.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_41.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_45.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_45.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    if (!_268)
    {
        discard_fragment();
    }
    float _294 = in.m_43.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = _140 * _140;
    float _302 = _142 * _142;
    float _304 = _103 * _198;
    float _306 = _103 * _204;
    float _308 = _130 * _300;
    float _310 = _132 * _302;
    float _312 = _144 * _144;
    float _314 = _134 * _312;
    float _316 = _103 * _274;
    float _318 = _103 * _280;
    float _320 = _103 * _286;
    float _322 = _103 * _292;
    float _324 = -_306;
    float _326 = _318 + _324;
    float _328 = -_320;
    float _330 = _316 + _328;
    float _332 = -_322;
    float _334 = _304 + _332;
    float _336 = fma(_314, _326, _306);
    float _338 = fma(_308, _330, _320);
    float _340 = fma(_310, _334, _322);
    float _342 = _103 * _210;
    float _344 = _103 * _216;
    float _346 = _103 * _298;
    float _348 = _338 * _342;
    float _350 = _340 * _344;
    float _352 = _336 * _346;
    if (!_268)
    {
        out.m_50.x = _348;
        out.m_50.y = _350;
        out.m_50.z = _352;
        out.m_50.w = _236;
        return out;
    }
    float _354 = _350 * 0.715200006961822509765625;
    float _356 = in.m_52.w;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_52.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_52.y;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = fma(_348, 0.2125999927520751953125, _354);
    float _376 = in.m_52.z;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = fma(_352, 0.072200000286102294921875, _374);
    bool _384 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _386 = 1.0 / _382;
    float _388 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_384)
    {
        float _390 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _392 = _192 + _390;
        _388 = _392;
    }
    float _394 = _388;
    float _396 = _386 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = fma(_398, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _402 = _103 * _360;
    float _404 = _103 * _372;
    float _406 = _400 * _402;
    float _408 = 0.0 + _258;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _402;
    float _414 = _410;
    if (_384)
    {
        float _416 = _394 * 8.0;
        float _418 = precise::clamp(_416, 0.0, 1.0);
        _412 = _418;
    }
    float _420 = _412;
    float _422 = _103 * _366;
    float _424 = _103 * _380;
    float _426 = fma(_350, _406, _404);
    if (_384)
    {
        float _428 = _410 * _420;
        _414 = _428;
    }
    float _430 = _414;
    float _432 = fma(_348, _406, _422);
    float _434 = fma(_352, _406, _424);
    float _436 = 0.0 + _430;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    out.m_50.x = _432;
    out.m_50.y = _426;
    out.m_50.z = _434;
    out.m_50.w = _438;
    return out;
}

