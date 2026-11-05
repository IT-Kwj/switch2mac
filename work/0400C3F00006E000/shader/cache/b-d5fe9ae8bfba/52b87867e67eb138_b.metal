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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
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
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2), flat]];
    float4 m_54 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_37 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
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
    float _75 = in.m_39.y;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.x;
    float _85 = in.m_39.z;
    float _87 = 1.0 / _61;
    float _89 = _87 * _67;
    float _91 = _87 * _73;
    float _93 = _87 * _81;
    float _95 = -_75;
    float _97 = _89 + _95;
    float _99 = -_83;
    float _101 = _91 + _99;
    float _103 = -_85;
    float _105 = _93 + _103;
    float _107 = _97 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _109 = _97 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _111 = fma(_101, (*spvDescriptorSet0.fp_c10)._m0[8].z, _107);
    float _113 = fma(_101, (*spvDescriptorSet0.fp_c10)._m0[8].x, _109);
    float _115 = (*spvDescriptorSet0.fp_c9)._m0[191].x * 2.0;
    float _117 = fma(_105, (*spvDescriptorSet0.fp_c10)._m0[10].z, _111);
    float _119 = fma(_105, (*spvDescriptorSet0.fp_c10)._m0[10].x, _113);
    float _121 = _117 * _115;
    float _123 = _115 * _119;
    float _125 = _117 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _127 = _119 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _129 = floor(_121);
    float _131 = floor(_123);
    float _133 = _129 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _135 = _131 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float2 _618 = float2(_133, _135);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_618, float2(0.0), isnan(_618))).w;
    float2 _629 = float2(_125, _127);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_629, float2(0.0), isnan(_629))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float _150 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _152 = in.m_41.x;
    float _154 = in.m_43.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _131 * _150;
    float _162 = _129 * _150;
    float _164 = _160 * _160;
    float _166 = fma(_162, _162, _164);
    float _168 = sqrt(_166);
    float _170 = _152 * 0.449999988079071044921875;
    float _172 = _152 * 0.819999992847442626953125;
    float _174 = -_170;
    float _176 = _174 + _172;
    float _178 = 1.0 / _176;
    float _180 = precise::max(_170, _168);
    float _182 = in.m_45.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = precise::min(_172, _180);
    float _190 = -_170;
    float _192 = _190 + _188;
    float _194 = _192 * _178;
    float _196 = fma(_194, 2.0, -1.0);
    float _198 = _87 * _158;
    float _200 = -_89;
    float _202 = _200 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _204 = -_91;
    float _206 = _204 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _208 = -_93;
    float _210 = _208 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _212 = in.m_47.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_43.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_43.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_43.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = fma(_137, -0.699999988079071044921875, 1.0);
    float _238 = _236 * _148;
    float _240 = -_196;
    float _242 = fma(_240, _196, 1.0);
    float _244 = _238 * _242;
    float _246 = _198 * _244;
    float _248 = precise::max(_246, 0.100000001490116119384765625);
    float _250 = precise::min(_248, 0.20000000298023223876953125);
    float _252 = fma(_250, 10.0, -1.0);
    float _254 = _87 * _186;
    float _256 = 0.0 + _252;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _258 * _254;
    bool _264 = _260 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _266 = isnan(_260);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _272 = _268 || _270;
    float _274 = _202 * _202;
    float _276 = fma(_206, _206, _274);
    if (!_272)
    {
        discard_fragment();
    }
    float _278 = fma(_210, _210, _276);
    float _280 = in.m_47.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_47.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = precise::max(_246, 0.1500000059604644775390625);
    float _294 = _142 * _142;
    float _296 = sqrt(_278);
    float _298 = precise::min(_292, 0.25);
    float _300 = _144 * _144;
    float _302 = _146 * _146;
    float _304 = fma(_298, 10.00000095367431640625, -1.5000002384185791015625);
    float _306 = _302 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _308 = precise::max(_296, 4.0);
    float _310 = precise::min(_308, 6.0);
    float _312 = fma(_310, -0.5, 3.0);
    float _314 = _87 * _216;
    float _316 = _87 * _222;
    float _318 = _87 * _290;
    float _320 = _304 * _312;
    float _322 = _87 * _228;
    float _324 = _87 * _284;
    float _326 = _87 * _234;
    float _328 = _316 + _322;
    float _330 = _314 + _324;
    float _332 = -_314;
    float _334 = _332 + _316;
    float _336 = -_324;
    float _338 = _336 + _322;
    float _340 = _326 + _328;
    float _342 = _318 + _330;
    float _344 = -_318;
    float _346 = _344 + _326;
    float _348 = fma(_320, _334, _314);
    float _350 = fma(_320, _338, _324);
    float _352 = -_342;
    float _354 = _352 + _340;
    float _356 = fma(_320, _346, _318);
    float _358 = _294 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _360 = _300 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _362 = fma(_320, _354, _342);
    float _364 = -_348;
    float _366 = fma(_362, 0.5, _364);
    float _368 = -_350;
    float _370 = fma(_362, 0.5, _368);
    float _372 = -_356;
    float _374 = fma(_362, 0.5, _372);
    float _376 = fma(_358, _366, _348);
    float _378 = fma(_360, _370, _350);
    float _380 = fma(_306, _374, _356);
    if (!_272)
    {
        out.m_50.x = _376;
        out.m_50.y = _378;
        out.m_50.z = _380;
        out.m_50.w = _252;
        return out;
    }
    float _382 = _378 * 0.715200006961822509765625;
    float _384 = in.m_52.w;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_52.x;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_52.y;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = fma(_376, 0.2125999927520751953125, _382);
    float _404 = in.m_52.z;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = fma(_380, 0.072200000286102294921875, _402);
    bool _412 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _414 = 1.0 / _410;
    float _416 = _414 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = 0.0 + _260;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _87 * _388;
    float _426 = fma(_418, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _428 = _426 * _424;
    float _430 = _87 * _394;
    float _432 = _87 * _400;
    float _434 = _87 * _408;
    float _436 = fma(_376, _428, _430);
    float _438 = fma(_378, _428, _432);
    float _440 = fma(_380, _428, _434);
    bool _442 = !_412;
    float _444 = _422;
    if (!_442)
    {
        float _446 = in.m_54.w;
        float _448 = gl_FragCoord.w;
        float _450 = _446 * _448;
        float _452 = in.m_54.z;
        float _454 = gl_FragCoord.w;
        float _456 = _452 * _454;
        float _458 = _87 * _450;
        float _460 = _87 * _456;
        float _462 = 1.0 / _458;
        float _464 = _460 * _462;
        float _466 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _468 = fma(_464, (*spvDescriptorSet0.fp_c8)._m0[30].w, _466);
        float _470 = 1.0 / _468;
        float _472 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _474 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _476 = fma(_470, _472, _474);
        float _478 = _476 * 8.0;
        float _480 = precise::clamp(_478, 0.0, 1.0);
        float _482 = _422 * _480;
        _444 = _482;
    }
    float _484 = _444;
    float _486 = 0.0 + _484;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    out.m_50.x = _436;
    out.m_50.y = _438;
    out.m_50.z = _440;
    out.m_50.w = _488;
    return out;
}

