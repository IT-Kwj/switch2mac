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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _69 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _71 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _69;
    float _73 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _67);
    float _75 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _77 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _75;
    float _79 = _71 * _71;
    float _81 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _73);
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _91 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _89;
    float _93 = fma(_77, _77, _79);
    float _95 = in.m_37.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = rsqrt(_81);
    float _103 = fma(_91, _91, _93);
    float _105 = rsqrt(_103);
    float _107 = 1.0 / _59;
    float _109 = _101 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _111 = _77 * _105;
    float _113 = _101 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _115 = _91 * _105;
    float _117 = _101 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _119 = _71 * _105;
    float _121 = _109 * _111;
    float _123 = _117 * _115;
    float _125 = _113 * _119;
    float _127 = -_121;
    float _129 = fma(_117, _119, _127);
    float _131 = _107 * _65;
    float _133 = -_123;
    float _135 = fma(_113, _111, _133);
    float _137 = -_125;
    float _139 = fma(_109, _115, _137);
    float _141 = _111 * _129;
    float _143 = _107 * _87;
    float _145 = _115 * _135;
    float _147 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _149 = _131 + _147;
    float _151 = -_141;
    float _153 = fma(_115, _139, _151);
    float _155 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _157 = _143 + _155;
    float _159 = -_145;
    float _161 = fma(_119, _129, _159);
    float _163 = _119 * _139;
    float _165 = _107 * _99;
    float _167 = _149 * _153;
    float _169 = _135 * _149;
    float _171 = -_163;
    float _173 = fma(_111, _135, _171);
    float _175 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _177 = _165 + _175;
    float _179 = fma(_157, _161, _167);
    float _181 = fma(_139, _157, _169);
    float _183 = fma(_177, _173, _179);
    float _185 = fma(_129, _177, _181);
    float _187 = fma(_183, -0.5, 0.25);
    float _189 = fma(_185, 0.5, 0.25);
    float2 _687 = float2(_189, _187);
    float2 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_687, float2(0.0), isnan(_687))).xy;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = in.m_39.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_39.y;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.015384615398943424224853515625;
    float _213 = _211 * _211;
    float _215 = _211 * _213;
    float _217 = _107 * _203;
    float _219 = _215 * 0.100000001490116119384765625;
    float _221 = _107 * _209;
    float _223 = fma(_195, _219, _217);
    float _225 = fma(_197, _219, _221);
    float2 _743 = float2(_223, _225);
    float4 _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_743, float2(0.0), isnan(_743))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_743, float2(0.0), isnan(_743))).xyzw;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = _228.z;
    float _236 = _228.w;
    float _238 = in.m_41.w;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_43.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_45.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = _107 * _242;
    float _258 = in.m_45.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_41.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_41.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_41.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _107 * _254;
    float _284 = _236 * _256;
    float _286 = _107 * _248;
    float _288 = 0.0 + _284;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _290 * _286;
    bool _296 = _292 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _298 = isnan(_292);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _304 = _300 || _302;
    float _306 = in.m_45.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    if (!_304)
    {
        discard_fragment();
    }
    float _312 = _230 * _230;
    float _314 = _232 * _232;
    float _316 = _234 * _234;
    float _318 = _107 * _262;
    float _320 = -_312;
    float _322 = _320 + 1.0;
    float _324 = -_314;
    float _326 = _324 + 1.0;
    float _328 = -_316;
    float _330 = _328 + 1.0;
    float _332 = _282 * _326;
    float _334 = _318 * _330;
    float _336 = _107 * _274;
    float _338 = _107 * _280;
    float _340 = _107 * _310;
    float _342 = fma(_314, _336, _332);
    float _344 = fma(_316, _338, _334);
    float _346 = _340 * _322;
    float _348 = _107 * _268;
    float _350 = fma(_312, _348, _346);
    if (!_304)
    {
        out.m_48.x = _350;
        out.m_48.y = _342;
        out.m_48.z = _344;
        out.m_48.w = _284;
        return out;
    }
    float _352 = _342 * 0.715200006961822509765625;
    float _354 = in.m_50.w;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_50.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_50.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = fma(_350, 0.2125999927520751953125, _352);
    float _374 = in.m_50.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = fma(_344, 0.072200000286102294921875, _372);
    bool _382 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _384 = 1.0 / _380;
    float _386 = _384 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _107 * _358;
    float _392 = fma(_388, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _394 = _107 * _364;
    float _396 = _392 * _390;
    float _398 = 0.0 + _292;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _107 * _370;
    float _404 = _107 * _378;
    float _406 = fma(_344, _396, _394);
    float _408 = fma(_350, _396, _402);
    float _410 = fma(_342, _396, _404);
    float _412 = _394;
    if (!_382)
    {
        _412 = _400;
    }
    float _414 = _412;
    bool _416 = !_382;
    float _418 = _414;
    if (!_416)
    {
        float _420 = in.m_52.w;
        float _422 = gl_FragCoord.w;
        float _424 = _420 * _422;
        float _426 = in.m_52.z;
        float _428 = gl_FragCoord.w;
        float _430 = _426 * _428;
        float _432 = _107 * _424;
        float _434 = _107 * _430;
        float _436 = 1.0 / _432;
        float _438 = _434 * _436;
        float _440 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _442 = fma(_438, (*spvDescriptorSet0.fp_c8)._m0[30].w, _440);
        float _444 = 1.0 / _442;
        float _446 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _448 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _450 = fma(_444, _446, _448);
        float _452 = _450 * 8.0;
        float _454 = precise::clamp(_452, 0.0, 1.0);
        float _456 = _400 * _454;
        _418 = _456;
    }
    float _458 = _418;
    float _460 = 0.0 + _458;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    out.m_48.x = _408;
    out.m_48.y = _410;
    out.m_48.z = _406;
    out.m_48.w = _462;
    return out;
}

