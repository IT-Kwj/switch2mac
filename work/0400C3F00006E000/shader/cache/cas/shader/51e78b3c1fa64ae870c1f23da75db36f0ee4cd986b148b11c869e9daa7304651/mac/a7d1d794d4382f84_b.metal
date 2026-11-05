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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_39 [[user(locn7)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _469 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_469, float2(0.0), isnan(_469))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_39.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = _77 * _95;
    float _105 = _77 * _101;
    float _107 = fma(_87, 2.0, -1.0);
    float _109 = fma(_89, 2.0, -1.0);
    float _111 = fma(_107, (*spvDescriptorSet0.fp_c9)._m0[194].w, _103);
    float _113 = fma(_109, (*spvDescriptorSet0.fp_c9)._m0[194].w, _105);
    float2 _523 = float2(_111, _113);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_523, float2(0.0), isnan(_523))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float _126 = in.m_37.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_37.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_41.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_41.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = _77 * _130;
    float _152 = _77 * _136;
    float _154 = _77 * _142;
    float _156 = fma(_107, (*spvDescriptorSet0.fp_c9)._m0[194].w, _150);
    float _158 = _77 * _148;
    float _160 = fma(_109, (*spvDescriptorSet0.fp_c9)._m0[194].w, _152);
    float _162 = _154 + (-0.5);
    float _164 = _158 + (-0.5);
    float _166 = _124 * (-0.0500000007450580596923828125);
    float _168 = fma(_162, _166, _156);
    float _170 = fma(_164, _166, _160);
    float2 _606 = float2(_168, _170);
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_606, float2(0.0), isnan(_606))).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    float _182 = in.m_43.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_45.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _77 * _186;
    float _196 = -_194;
    float _198 = _196 + 1.0;
    float _200 = in.m_47.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_47.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_47.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_49.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_49.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_49.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = -_198;
    float _238 = fma(_236, _198, _180);
    float _240 = precise::max(_238, 0.0599999986588954925537109375);
    float _242 = precise::min(_240, 1.0);
    float _244 = fma(_242, 1.06382977962493896484375, -0.063829787075519561767578125);
    float _246 = _77 * _192;
    float _248 = 0.0 + _244;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _250 * _246;
    bool _256 = _252 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _264 = _260 || _262;
    if (!_264)
    {
        discard_fragment();
    }
    float _266 = _118 * _238;
    float _268 = _266 * 2.0;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _120 * _238;
    float _274 = _272 * 2.0;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _122 * _238;
    float _280 = _278 * 2.0;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _77 * _210;
    float _286 = fma(_174, _174, _270);
    float _288 = fma(_176, _176, _276);
    float _290 = fma(_178, _178, _282);
    float _292 = _77 * _204;
    float _294 = -_286;
    float _296 = _294 + 1.0;
    float _298 = _77 * _216;
    float _300 = -_288;
    float _302 = _300 + 1.0;
    float _304 = -_290;
    float _306 = _304 + 1.0;
    float _308 = _292 * _296;
    float _310 = _77 * _222;
    float _312 = _284 * _302;
    float _314 = _298 * _306;
    float _316 = _77 * _228;
    float _318 = _77 * _234;
    float _320 = fma(_288, _310, _312);
    float _322 = fma(_286, _316, _308);
    float _324 = fma(_290, _318, _314);
    if (!_264)
    {
        out.m_52.x = _322;
        out.m_52.y = _320;
        out.m_52.z = _324;
        out.m_52.w = _244;
        return out;
    }
    float _326 = _320 * 0.715200006961822509765625;
    float _328 = in.m_54.w;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_54.z;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_54.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = fma(_322, 0.2125999927520751953125, _326);
    float _348 = in.m_54.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = 0.0 + _252;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = fma(_324, 0.072200000286102294921875, _346);
    bool _360 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _362 = 1.0 / _358;
    float _364 = _362 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _77 * _332;
    float _370 = fma(_366, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _372 = _77 * _338;
    float _374 = _370 * _368;
    float _376 = _77 * _344;
    float _378 = _77 * _352;
    float _380 = fma(_324, _374, _372);
    float _382 = fma(_322, _374, _376);
    float _384 = fma(_320, _374, _378);
    float _386 = _372;
    if (!_360)
    {
        _386 = _356;
    }
    float _388 = _386;
    bool _390 = !_360;
    float _392 = _388;
    if (!_390)
    {
        float _394 = in.m_56.w;
        float _396 = gl_FragCoord.w;
        float _398 = _394 * _396;
        float _400 = in.m_56.z;
        float _402 = gl_FragCoord.w;
        float _404 = _400 * _402;
        float _406 = _77 * _398;
        float _408 = _77 * _404;
        float _410 = 1.0 / _406;
        float _412 = _408 * _410;
        float _414 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _416 = fma(_412, (*spvDescriptorSet0.fp_c8)._m0[30].w, _414);
        float _418 = 1.0 / _416;
        float _420 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _424 = fma(_418, _420, _422);
        float _426 = _424 * 8.0;
        float _428 = precise::clamp(_426, 0.0, 1.0);
        float _430 = _356 * _428;
        _392 = _430;
    }
    float _432 = _392;
    float _434 = 0.0 + _432;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    out.m_52.x = _382;
    out.m_52.y = _384;
    out.m_52.z = _380;
    out.m_52.w = _436;
    return out;
}

