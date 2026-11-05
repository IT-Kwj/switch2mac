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
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
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
    float2 _531 = float2(_121, _123);
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
    float _178 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _180 = _103 * _152;
    float _182 = _180 * _113;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _186 = fma(_182, (*spvDescriptorSet0.fp_c8)._m0[30].w, _184);
    float _188 = 1.0 / _186;
    float _190 = in.m_45.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_43.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_43.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _210 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _208);
    float _212 = _103 * _158;
    float _214 = 1.0 / _210;
    float _216 = _136 * _146;
    float _218 = _103 * _164;
    float _220 = _103 * _176;
    float _222 = -_212;
    float _224 = fma(_216, _218, _222);
    float _226 = _103 * _170;
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _230 = _188 * _228;
    float _232 = _226 * _224;
    float _234 = 0.0 + _232;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _240 = -_230;
    float _242 = fma(_214, _238, _240);
    float _244 = _242 * _178;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _236 * _246;
    float _250 = _248 * _220;
    bool _254 = _250 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _256 = isnan(_250);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _262 = _258 || _260;
    float _264 = in.m_41.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_41.z;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_41.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_45.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_45.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = _230;
    if (!_262)
    {
        discard_fragment();
    }
    float _296 = in.m_43.z;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = _130 * _130;
    float _304 = _132 * _132;
    float _306 = _302 * _140;
    float _308 = _134 * _134;
    float _310 = _304 * _142;
    float _312 = _308 * _144;
    float _314 = _103 * _268;
    float _316 = _103 * _274;
    float _318 = _103 * _194;
    float _320 = _103 * _280;
    float _322 = _103 * _286;
    float _324 = _103 * _292;
    float _326 = -_318;
    float _328 = _316 + _326;
    float _330 = -_322;
    float _332 = _320 + _330;
    float _334 = -_324;
    float _336 = _314 + _334;
    float _338 = fma(_312, _328, _318);
    float _340 = _103 * _200;
    float _342 = fma(_306, _332, _322);
    float _344 = fma(_310, _336, _324);
    float _346 = _103 * _206;
    float _348 = _103 * _300;
    float _350 = _342 * _340;
    float _352 = _344 * _346;
    float _354 = _338 * _348;
    if (!_262)
    {
        out.m_50.x = _350;
        out.m_50.y = _352;
        out.m_50.z = _354;
        out.m_50.w = _232;
        return out;
    }
    float _356 = _352 * 0.715200006961822509765625;
    float _358 = in.m_52.w;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_52.x;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_52.y;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = fma(_350, 0.2125999927520751953125, _356);
    float _378 = in.m_52.z;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = fma(_354, 0.072200000286102294921875, _376);
    bool _386 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _388 = 1.0 / _384;
    float _390 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_386)
    {
        float _392 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _394 = _230 + _392;
        _294 = _394;
    }
    float _396 = _294;
    float _398 = _388 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = fma(_400, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _404 = _103 * _362;
    if (_386)
    {
        float _406 = _396 * 8.0;
        float _408 = precise::clamp(_406, 0.0, 1.0);
        _390 = _408;
    }
    float _410 = _390;
    float _412 = _103 * _368;
    float _414 = _103 * _374;
    float _416 = _402 * _404;
    float _418 = 0.0 + _250;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _103 * _382;
    float _424 = fma(_350, _416, _412);
    float _426 = _420;
    if (_386)
    {
        float _428 = _420 * _410;
        _426 = _428;
    }
    float _430 = _426;
    float _432 = fma(_352, _416, _414);
    float _434 = fma(_354, _416, _422);
    float _436 = 0.0 + _430;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    out.m_50.x = _424;
    out.m_50.y = _432;
    out.m_50.z = _434;
    out.m_50.w = _438;
    return out;
}

