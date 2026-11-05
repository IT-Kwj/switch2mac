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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
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
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.x;
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
    float2 _539 = float2(_123, _121);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_539, float2(0.0), isnan(_539))).x;
    float2 _550 = float2(_115, _117);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_550, float2(0.0), isnan(_550))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_550, float2(0.0), isnan(_550))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float2 _566 = float2(_119, _111);
    float4 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_566, float2(0.0), isnan(_566))).xyzw;
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
    float _182 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _186 = fma(_180, (*spvDescriptorSet0.fp_c8)._m0[30].w, _184);
    float _188 = 1.0 / _186;
    float _190 = in.m_45.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_45.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_45.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _210 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _208);
    float _212 = _136 + (-1.0);
    float _214 = _103 * _158;
    float _216 = 1.0 / _210;
    float _218 = _146 + _212;
    float _220 = _103 * _164;
    float _222 = -_214;
    float _224 = fma(_218, _220, _222);
    float _226 = _103 * _170;
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _230 = _188 * _228;
    float _232 = _226 * _224;
    float _234 = 0.0 + _232;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _240 = -_230;
    float _242 = fma(_216, _238, _240);
    float _244 = _242 * _182;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _103 * _176;
    float _250 = _236 * _246;
    float _252 = _250 * _248;
    bool _256 = _252 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _264 = _260 || _262;
    float _266 = in.m_41.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_41.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_41.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _230;
    if (!_264)
    {
        discard_fragment();
    }
    float _286 = in.m_43.x;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_43.y;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_43.z;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = _130 * _130;
    float _306 = _140 * _140;
    float _308 = _132 * _132;
    float _310 = _142 * _142;
    float _312 = _144 * _144;
    float _314 = _306 * _304;
    float _316 = _134 * _134;
    float _318 = _310 * _308;
    float _320 = _103 * _200;
    float _322 = _312 * _316;
    float _324 = _103 * _270;
    float _326 = _103 * _276;
    float _328 = _103 * _282;
    float _330 = _103 * _194;
    float _332 = _103 * _206;
    float _334 = -_320;
    float _336 = _326 + _334;
    float _338 = -_330;
    float _340 = _328 + _338;
    float _342 = -_332;
    float _344 = _324 + _342;
    float _346 = fma(_314, _336, _320);
    float _348 = fma(_322, _340, _330);
    float _350 = fma(_318, _344, _332);
    float _352 = _103 * _290;
    float _354 = _103 * _296;
    float _356 = _103 * _302;
    float _358 = _346 * _352;
    float _360 = _350 * _354;
    float _362 = _348 * _356;
    if (!_264)
    {
        out.m_50.x = _358;
        out.m_50.y = _360;
        out.m_50.z = _362;
        out.m_50.w = _232;
        return out;
    }
    float _364 = _360 * 0.715200006961822509765625;
    float _366 = in.m_52.w;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_52.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_52.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = fma(_358, 0.2125999927520751953125, _364);
    float _386 = in.m_52.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = fma(_362, 0.072200000286102294921875, _384);
    bool _394 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _396 = 1.0 / _392;
    float _398 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_394)
    {
        float _400 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _402 = _230 + _400;
        _284 = _402;
    }
    float _404 = _284;
    float _406 = _396 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = fma(_408, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _412 = _103 * _370;
    if (_394)
    {
        float _414 = _404 * 8.0;
        float _416 = precise::clamp(_414, 0.0, 1.0);
        _398 = _416;
    }
    float _418 = _398;
    float _420 = _103 * _376;
    float _422 = _103 * _382;
    float _424 = _410 * _412;
    float _426 = 0.0 + _252;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _103 * _390;
    float _432 = fma(_358, _424, _420);
    float _434 = _428;
    if (_394)
    {
        float _436 = _428 * _418;
        _434 = _436;
    }
    float _438 = _434;
    float _440 = fma(_360, _424, _422);
    float _442 = fma(_362, _424, _430);
    float _444 = 0.0 + _438;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    out.m_50.x = _432;
    out.m_50.y = _440;
    out.m_50.z = _442;
    out.m_50.w = _446;
    return out;
}

