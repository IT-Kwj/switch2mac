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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture2d<float> vp_t_tcb_10 [[id(5)]];
    sampler vp_t_tcb_10Smplr [[id(6)]];
    sampler vp_t_tcb_10Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(2)]];
    float4 m_40 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_47 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_35.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_38.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2353 = as_type<float>(_90);
        out.gl_Position.z = _2353;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _94 = in.m_40.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    if (_104)
    {
        float _112 = float(_74);
        _110 = _112;
    }
    float _114 = _110;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    if (_120)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _84;
    if (_120)
    {
        out.m_38.x = 0.0;
    }
    if (_120)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2421 = as_type<float>(_126);
        out.gl_Position.z = _2421;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_42.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = as_type<float>(int(gl_VertexIndex));
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_40.x;
    float _148 = in.m_40.y;
    float _150 = in.m_40.z;
    float _152 = _132 * _130;
    float _154 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    int _160 = as_type<int>(_134) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_134) & 2;
    bool _166 = _164 != 0;
    float _168 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _156 * 0.15915493667125701904296875;
    float _172 = 0.0;
    float _174 = _168;
    float _176 = 0.5;
    if (!_144)
    {
        float _178 = _168 * _168;
        float _180 = _178 * 0.5;
        _172 = _180;
    }
    float _182 = _172;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _170 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_166;
    int _194 = _192 ? (-1090519040) : 1056964608;
    float _196 = _182;
    if (!_144)
    {
        float _198 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = -_158;
    float _204 = _154 + _202;
    bool _206 = !_162;
    int _208 = _206 ? (-1090519040) : 1056964608;
    bool _210 = !_144;
    float _212 = _200;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _168 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _168);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_144;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _168 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = fma(_190, 0.5, 0.5);
    bool _272 = _204 < 0.5;
    float _274 = float(_272);
    float _276 = in.m_47.w;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = -_204;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = in.m_35.x;
    float _294 = in.m_35.y;
    float _296 = in.m_35.z;
    float _298 = -_274;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _302 = -_270;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_186;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_268, _146, _290);
    bool _312 = !_280;
    int _314 = _312 ? 0 : 1;
    out.m_49.x = as_type<float>(_208);
    out.m_49.y = as_type<float>(_194);
    int _316 = abs(_308);
    float _318 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_284;
    int _322 = _320 ? 0 : 1;
    float _324 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _326 = abs(_314);
    float _328 = fma(_268, _148, _318);
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _332 = fma(_268, _150, _324);
    int _334 = abs(_322);
    float _336 = float(_326);
    float _338 = float(_316);
    float _340 = abs(_288);
    float _342 = _336 * _340;
    float _344 = fma(_310, _276, _292);
    float _346 = float(_334);
    float _348 = fma(_338, _304, _342);
    float _350 = fma(_332, _276, _296);
    float _352 = fma(_328, _276, _294);
    float _354 = abs(_300);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_330;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_74);
        float _380 = 1.0 / _378;
        float _382 = _108 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _400 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _402 = isnan(_384);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _414 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _416 = 1.0 / _392;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    bool _422 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _424 = isnan(_384);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _436 = -_410;
    float _438 = _436 + 1.0;
    bool _440 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_384);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _454 = -_432;
    float _456 = _454 + 1.0;
    float _458 = 1.0 / _398;
    float _460 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
    float _462 = _432 * _438;
    float _464 = _450 * _456;
    float _466 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    float _468 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _470 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _472 = -_450;
    float _474 = _472 + 1.0;
    float _476 = _420 * _416;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _384 + _478;
    float _482 = _466 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _484 = fma(_476, _480, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _492 = _482 + _490;
    float _494 = _484 * _464;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _498 = _468 + _496;
    float _500 = _488 * _458;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _504 = _384 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _508 = _470 + _506;
    float _510 = _498 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _512 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _494);
    float _514 = fma(_500, _504, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _516 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[28].x, _510);
    float _518 = _498 * _498;
    float _520 = fma(_514, _462, _512);
    float _522 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[28].z, _516);
    float _524 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[117].x, _520);
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _528 = _522 >= 0.0;
    float _530 = fma(_508, _508, _518);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = fma(_492, _492, _530);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _546 = rsqrt(_536);
    float _548 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _550 = _530;
    if (_528)
    {
        _550 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _552 = _550;
    float _554 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _524 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _566 = as_type<int>(_552);
    if (_528)
    {
        float _568 = _552 * 5.0;
        _566 = as_type<int>(_568);
    }
    int _570 = _566;
    float _572 = as_type<float>(_570);
    if (_528)
    {
        out.m_38.x = 0.0;
    }
    out.m_51.x = _558;
    out.m_51.y = _560;
    out.m_51.z = _562;
    out.m_51.w = _544;
    float _574 = _498 * _546;
    float _576 = _508 * _546;
    out.m_53.x = _548;
    out.m_53.y = _554;
    out.m_53.z = _556;
    out.m_53.w = _564;
    if (_528)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3165 = as_type<float>(_570);
        out.gl_Position.z = _3165;
    }
    if (_528)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _578 = -_574;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _582 = _492 * _546;
    float _584 = -_576;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _470);
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _590 = _580 + _588;
    float _592 = -_582;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _598 = _586 + _596;
    float _600 = _590 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _604 = _594 + _602;
    float _606 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[28].x, _600);
    float _608 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[28].z, _606);
    bool _610 = _608 >= 0.0;
    if (_610)
    {
        _572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _612 = _572;
    int _614 = as_type<int>(_612);
    if (_610)
    {
        out.m_38.x = 0.0;
    }
    if (_610)
    {
        float _616 = _612 * 5.0;
        _614 = as_type<int>(_616);
    }
    int _618 = _614;
    if (_610)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3255 = as_type<float>(_618);
        out.gl_Position.z = _3255;
    }
    if (_610)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _620 = _580 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _622 = _580 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _624 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _620);
    float _626 = _580 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _628 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[9].x, _622);
    float _630 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[11].z, _624);
    float _632 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[9].z, _628);
    float _634 = _630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _636 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[8].x, _626);
    float _638 = _632 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _640 = 1.0 / _634;
    float _642 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[8].z, _636);
    float _644 = _634 * 0.5;
    float _646 = _642 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _648 = fma(_638, -0.5, _644);
    float _650 = _646 + _634;
    float _652 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _648);
    float _654 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _648);
    float _656 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _648);
    float _658 = _650 * 0.5;
    float _660 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _648);
    float _662 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _648);
    float _664 = _652 * _640;
    float _666 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _658);
    float _668 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _658);
    float _670 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _658);
    float _672 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _658);
    float _674 = _666 * _640;
    float _676 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _648);
    float _678 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _648);
    float _680 = _654 * _640;
    float _682 = _668 * _640;
    float _684 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _658);
    float _686 = _670 * _640;
    float _688 = _656 * _640;
    float _690 = _672 * _640;
    float _692 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _648);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _696 = _648 + _694;
    float _698 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _658);
    float _700 = _660 * _640;
    float _702 = _662 * _640;
    float _704 = _648 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _706 = _676 * _640;
    float _708 = _678 * _640;
    float2 _3443 = float2(_674, _680);
    float _710 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3443, float2(0.0), isnan(_3443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3443, float2(0.0), isnan(_3443)), level(0.0)).x;
    float2 _3453 = float2(_682, _664);
    float _712 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3453, float2(0.0), isnan(_3453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3453, float2(0.0), isnan(_3453)), level(0.0)).x;
    float2 _3461 = float2(_682, _688);
    float _714 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3461, float2(0.0), isnan(_3461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3461, float2(0.0), isnan(_3461)), level(0.0)).x;
    float2 _3469 = float2(_686, _700);
    float _716 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3469, float2(0.0), isnan(_3469)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3469, float2(0.0), isnan(_3469)), level(0.0)).x;
    float2 _3477 = float2(_690, _706);
    float _718 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3477, float2(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3477, float2(0.0), isnan(_3477)), level(0.0)).x;
    float _720 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _658);
    float _722 = _684 * _640;
    float _724 = _648 * _640;
    float _726 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _648);
    float _728 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _648);
    float _730 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _648);
    float _732 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _648);
    float _734 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _648);
    float _736 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _648);
    float _738 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _648);
    float _740 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _648);
    float _742 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _648);
    float _744 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _648);
    float _746 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _648);
    float _748 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _648);
    float _750 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _648);
    float _752 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _648);
    float _754 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _658);
    float _756 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _658);
    float _758 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _658);
    float _760 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _658);
    float _762 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _658);
    float _764 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _658);
    float _766 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _658);
    float _768 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _658);
    float _770 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _658);
    float _772 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _658);
    float _774 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _658);
    float _776 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _658);
    float _778 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _658);
    float _780 = _698 * _640;
    float _782 = _692 * _640;
    float _784 = _696 * _640;
    float _786 = _658 * _640;
    float _788 = _704 * _640;
    float _790 = _720 * _640;
    float2 _3633 = float2(_722, _702);
    float _792 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3633, float2(0.0), isnan(_3633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3633, float2(0.0), isnan(_3633)), level(0.0)).x;
    float2 _3641 = float2(_722, _708);
    float _794 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3641, float2(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3641, float2(0.0), isnan(_3641)), level(0.0)).x;
    float2 _3649 = float2(_780, _782);
    float _796 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3649, float2(0.0), isnan(_3649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3649, float2(0.0), isnan(_3649)), level(0.0)).x;
    float2 _3657 = float2(_786, _782);
    float _798 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3657, float2(0.0), isnan(_3657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3657, float2(0.0), isnan(_3657)), level(0.0)).x;
    float2 _3665 = float2(_786, _784);
    float _800 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3665, float2(0.0), isnan(_3665)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3665, float2(0.0), isnan(_3665)), level(0.0)).x;
    float2 _3673 = float2(_786, _788);
    float _802 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3673, float2(0.0), isnan(_3673)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3673, float2(0.0), isnan(_3673)), level(0.0)).x;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _806 = _658 + _804;
    float _808 = _730 * _640;
    float _810 = _732 * _640;
    float _812 = _734 * _640;
    float _814 = _658 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _816 = _806 * _640;
    float _818 = _726 * _640;
    float2 _3706 = float2(_790, _808);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3706, float2(0.0), isnan(_3706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3706, float2(0.0), isnan(_3706)), level(0.0)).x;
    float2 _3714 = float2(_786, _808);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3714, float2(0.0), isnan(_3714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3714, float2(0.0), isnan(_3714)), level(0.0)).x;
    float2 _3722 = float2(_786, _810);
    float _824 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3722, float2(0.0), isnan(_3722)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3722, float2(0.0), isnan(_3722)), level(0.0)).x;
    float2 _3730 = float2(_786, _812);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3730, float2(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3730, float2(0.0), isnan(_3730)), level(0.0)).x;
    float2 _3738 = float2(_786, _724);
    float _828 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3738, float2(0.0), isnan(_3738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3738, float2(0.0), isnan(_3738)), level(0.0)).x;
    float2 _3746 = float2(_816, _724);
    float _830 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3746, float2(0.0), isnan(_3746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3746, float2(0.0), isnan(_3746)), level(0.0)).x;
    float _832 = _754 * _640;
    float _834 = _728 * _640;
    float _836 = _814 * _640;
    float _838 = _758 * _640;
    float _840 = _756 * _640;
    float _842 = _760 * _640;
    float2 _3772 = float2(_832, _818);
    float _844 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3772, float2(0.0), isnan(_3772)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3772, float2(0.0), isnan(_3772)), level(0.0)).x;
    float2 _3780 = float2(_832, _834);
    float _846 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3780, float2(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3780, float2(0.0), isnan(_3780)), level(0.0)).x;
    float2 _3788 = float2(_832, _724);
    float _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3788, float2(0.0), isnan(_3788)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3788, float2(0.0), isnan(_3788)), level(0.0)).x;
    float2 _3796 = float2(_836, _724);
    float _850 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3796, float2(0.0), isnan(_3796)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3796, float2(0.0), isnan(_3796)), level(0.0)).x;
    float2 _3804 = float2(_840, _724);
    float _852 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3804, float2(0.0), isnan(_3804)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3804, float2(0.0), isnan(_3804)), level(0.0)).x;
    float2 _3812 = float2(_838, _724);
    float _854 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).x;
    float2 _3820 = float2(_842, _724);
    float _856 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3820, float2(0.0), isnan(_3820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3820, float2(0.0), isnan(_3820)), level(0.0)).x;
    float _858 = _762 * _640;
    float _860 = _764 * _640;
    float _862 = _736 * _640;
    float _864 = _766 * _640;
    float _866 = _738 * _640;
    float _868 = _768 * _640;
    float _870 = _740 * _640;
    float _872 = _770 * _640;
    float _874 = _742 * _640;
    float _876 = _772 * _640;
    float _878 = _744 * _640;
    float _880 = _774 * _640;
    float2 _3864 = float2(_858, _862);
    float _882 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3864, float2(0.0), isnan(_3864)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3864, float2(0.0), isnan(_3864)), level(0.0)).x;
    float2 _3872 = float2(_860, _866);
    float _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3872, float2(0.0), isnan(_3872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3872, float2(0.0), isnan(_3872)), level(0.0)).x;
    float2 _3880 = float2(_864, _870);
    float _886 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3880, float2(0.0), isnan(_3880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3880, float2(0.0), isnan(_3880)), level(0.0)).x;
    float2 _3888 = float2(_868, _874);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3888, float2(0.0), isnan(_3888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3888, float2(0.0), isnan(_3888)), level(0.0)).x;
    float2 _3896 = float2(_872, _878);
    float _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3896, float2(0.0), isnan(_3896)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3896, float2(0.0), isnan(_3896)), level(0.0)).x;
    float _892 = _746 * _640;
    float _894 = _776 * _640;
    float _896 = _748 * _640;
    float _898 = _750 * _640;
    float2 _3916 = float2(_876, _892);
    float _900 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3916, float2(0.0), isnan(_3916)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3916, float2(0.0), isnan(_3916)), level(0.0)).x;
    float _902 = _778 * _640;
    float2 _3927 = float2(_880, _896);
    float _904 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3927, float2(0.0), isnan(_3927)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3927, float2(0.0), isnan(_3927)), level(0.0)).x;
    float2 _3935 = float2(_894, _898);
    float _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3935, float2(0.0), isnan(_3935)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3935, float2(0.0), isnan(_3935)), level(0.0)).x;
    float _908 = _752 * _640;
    float2 _3946 = float2(_902, _908);
    float _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3946, float2(0.0), isnan(_3946)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3946, float2(0.0), isnan(_3946)), level(0.0)).x;
    float _912 = -_574;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _916 = -_576;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _920 = -_582;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _924 = in.m_47.x;
    float _926 = in.m_47.y;
    float _928 = _914 * _914;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_194));
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_208));
    float _934 = fma(_918, _918, _928);
    bool _936 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _944 = _940 || _942;
    float _946 = fma(_922, _922, _934);
    float _948 = sqrt(_946);
    float _950 = _926 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _952 = _924 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _954 = _356 * _950;
    float _956 = _546 * _948;
    float _958 = _356 * _952;
    float _960 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _962 = _580 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _964 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _966 = _956 * _960;
    float _968 = _956 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _970 = _968 * 0.5;
    float _972 = _956 * _964;
    float _974 = _930 * _966;
    float _976 = _932 * _972;
    float _978 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _980 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _984 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _980);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _982);
    float _990 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _992 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[25].z, _988);
    float _996 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _998 = _992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1000 = _994 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1002 = _482 + _996;
    float _1004 = _470 + _998;
    float _1006 = _468 + _1000;
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1010 = _1002 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1004 + _1012;
    float _1016 = _1010 * _1010;
    float _1018 = fma(_1014, _1014, _1016);
    float _1020 = sqrt(_1018);
    float _1022 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _962);
    bool _1024 = _1020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _1000;
    float _1028 = _970;
    float _1030 = _1006;
    if (!_1024)
    {
        _1026 = _1004;
    }
    float _1032 = _1026;
    float _1034 = _1032;
    if (!_1024)
    {
        _1028 = _1002;
    }
    float _1036 = _1028;
    bool _1038 = !_1024;
    float _1040 = _1036;
    if (!_1038)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1046 = _1020 + _1044;
        float _1048 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = rsqrt(_1018);
        float _1052 = _1046 * _1042;
        float _1054 = _1052 * 0.15915493667125701904296875;
        float _1056 = _1054 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        float _1064 = _1058 + (-1.0);
        float _1066 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = fma(_1062, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1070 = fma(_1006, _1058, _1066);
        float _1072 = _1050 * _1068;
        float _1074 = fma(_1014, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1076 = fma(_1010, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1034 = _1074;
        _1030 = _1070;
        _1040 = _1076;
    }
    float _1078 = _1034;
    float _1080 = _1030;
    float _1082 = _1040;
    float _1084 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1022);
    float _1086 = -_576;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1090 = -_574;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1094 = -_582;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1100 = _1092;
    float _1102 = _1088;
    float _1104 = _1096;
    if (!_944)
    {
        float _1106 = _590 * _590;
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1110 = -_482;
        float _1112 = _1110 + _1082;
        float _1114 = -_470;
        float _1116 = _1114 + _1078;
        float _1118 = fma(_598, _598, _1106);
        float _1120 = -_468;
        float _1122 = _1120 + _1080;
        float _1124 = fma(_604, _604, _1118);
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1128 = sqrt(_1124);
        float _1130 = 1.0 / _956;
        float _1132 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1134 = precise::min(_1128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1136 = _1134 * _1108;
        float _1138 = _1136 * _1130;
        float _1140 = _1132 * _1138;
        float _1142 = _1112 * _1138;
        float _1144 = fma(_1116, _1140, _586);
        float _1146 = fma(_1122, _1140, _580);
        float _1148 = fma(_1132, _1142, _594);
        _1100 = _1146;
        _1102 = _1144;
        _1104 = _1148;
    }
    float _1150 = _1100;
    float _1152 = _1102;
    float _1154 = _1104;
    float _1156 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1160 = _1098 + _634;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1156);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1158);
    float _1168 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1170 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1166);
    float _1176 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1168);
    float _1178 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1184 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1190 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1192 = _1160 * _640;
    float _1194 = _1192 * 0.5;
    float _1196 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1188);
    float _1200 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1190);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1198);
    float _1208 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1214 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1218 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1216);
    float _1220 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1224 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1222);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1214);
    float _1232 = 1.0 / _1218;
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1238 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1236);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1246 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1244);
    float _1248 = _1226 + _1228;
    out.gl_Position.x = _1230;
    out.gl_Position.y = _1234;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1228;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1252 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1250);
    float _1254 = 1.0 / _1224;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1262 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1260);
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1266 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1264);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1270 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1268);
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1274 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1272);
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1278 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1276);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1282 = _1232 * _1280;
    float _1284 = 1.0 / _1252;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1292 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1290);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1296 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1294);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1300 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1304 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1302);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1308 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1306);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1312 = -_1282;
    float _1314 = fma(_1254, _1310, _1312);
    float _1316 = 1.0 / _1238;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1320 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1324 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1322);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1328 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1326);
    bool _1330 = _1314 >= 0.0;
    bool _1332 = isnan(_1314);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.0);
    bool _1338 = _1334 || _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1342 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1340);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1346 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1344);
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1350 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1348);
    float _1352 = 1.0 / _1242;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1356 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1354);
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1360 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1358);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1364 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1362);
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1368 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1366);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1372 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1370);
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1376 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1374);
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    float _1382 = 1.0 / _1246;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = -_1282;
    float _1388 = fma(_1316, _1384, _1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1392 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1390);
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1396 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1394);
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1400 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1398);
    float _1402 = _1248 * 0.5;
    bool _1404 = _1388 >= 0.0;
    bool _1406 = isnan(_1388);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan(0.0);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1418 = -_1282;
    float _1420 = fma(_1352, _1416, _1418);
    bool _1422 = !_1338;
    float _1424 = _1422 ? 0.0 : 2.0;
    float _1426 = 1.0 / _1262;
    out.m_55.z = _1402;
    out.m_55.w = _1228;
    bool _1428 = _1420 >= 0.0;
    bool _1430 = isnan(_1420);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = _1424 + _1414;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1442 = -_1282;
    float _1444 = fma(_1382, _1440, _1442);
    bool _1446 = !_1436;
    float _1448 = _1446 ? 0.0 : 2.0;
    float _1450 = 1.0 / _1270;
    bool _1452 = _1444 >= 0.0;
    bool _1454 = isnan(_1444);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan(0.0);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1438 + _1448;
    float _1466 = 1.0 / _1258;
    float _1468 = _1464 + _1462;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1472 = -_1282;
    float _1474 = fma(_1284, _1470, _1472);
    bool _1476 = _1474 >= 0.0;
    bool _1478 = isnan(_1474);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = 1.0 / _1278;
    float _1490 = _1468 + _1486;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1494 = -_1282;
    float _1496 = fma(_1426, _1492, _1494);
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1500 = -_1282;
    float _1502 = fma(_1466, _1498, _1500);
    float _1504 = 1.0 / _1296;
    bool _1506 = _1496 >= 0.0;
    bool _1508 = isnan(_1496);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    bool _1516 = _1502 >= 0.0;
    bool _1518 = isnan(_1502);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = float(_1524);
    bool _1528 = !_1514;
    float _1530 = _1528 ? 0.0 : 2.0;
    float _1532 = 1.0 / _1266;
    float _1534 = _1490 + _1530;
    float _1536 = _1534 + _1526;
    float _1538 = 1.0 / _1300;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1542 = -_1282;
    float _1544 = fma(_1532, _1540, _1542);
    float _1546 = 1.0 / _1308;
    bool _1548 = _1544 >= 0.0;
    bool _1550 = isnan(_1544);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1560 = -_1282;
    float _1562 = fma(_1450, _1558, _1560);
    float _1564 = 1.0 / _1274;
    bool _1566 = _1562 >= 0.0;
    bool _1568 = isnan(_1562);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    bool _1576 = !_1556;
    float _1578 = _1576 ? 0.0 : 2.0;
    bool _1580 = !_1574;
    float _1582 = _1580 ? 0.0 : 2.0;
    float _1584 = 1.0 / _1342;
    float _1586 = _1536 + _1578;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1590 = -_1282;
    float _1592 = fma(_1504, _1588, _1590);
    float _1594 = _1586 + _1582;
    bool _1596 = _1592 >= 0.0;
    bool _1598 = isnan(_1592);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1610 = -_1282;
    float _1612 = fma(_1564, _1608, _1610);
    float _1614 = 1.0 / _1350;
    bool _1616 = _1612 >= 0.0;
    bool _1618 = isnan(_1612);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = 1.0 / _1288;
    float _1630 = _1594 + _1626;
    float _1632 = 1.0 / _1396;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = -_1282;
    float _1638 = fma(_1628, _1634, _1636);
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1642 = -_1282;
    float _1644 = fma(_1488, _1640, _1642);
    float _1646 = 1.0 / _1400;
    bool _1648 = _1638 >= 0.0;
    bool _1650 = isnan(_1638);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan(0.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = _1644 >= 0.0;
    bool _1660 = isnan(_1644);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan(0.0);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    bool _1670 = !_1656;
    float _1672 = _1670 ? 0.0 : 2.0;
    float _1674 = 1.0 / _1292;
    float _1676 = _1630 + _1672;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1680 = -_1282;
    float _1682 = fma(_1538, _1678, _1680);
    float _1684 = _1676 + _1668;
    bool _1686 = _1682 >= 0.0;
    bool _1688 = isnan(_1682);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan(0.0);
    bool _1694 = _1690 || _1692;
    float _1696 = _1684 + _1606;
    bool _1698 = !_1694;
    float _1700 = _1698 ? 0.0 : 2.0;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1704 = -_1282;
    float _1706 = fma(_1674, _1702, _1704);
    float _1708 = _1696 + _1700;
    bool _1710 = _1706 >= 0.0;
    bool _1712 = isnan(_1706);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan(0.0);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = 1.0 / _1304;
    float _1724 = _1708 + _1720;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1728 = -_1282;
    float _1730 = fma(_1722, _1726, _1728);
    float _1732 = 1.0 / _1320;
    bool _1734 = _1730 >= 0.0;
    bool _1736 = isnan(_1730);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1746 = -_1282;
    float _1748 = fma(_1546, _1744, _1746);
    bool _1750 = _1748 >= 0.0;
    bool _1752 = isnan(_1748);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan(0.0);
    bool _1758 = _1754 || _1756;
    bool _1760 = !_1742;
    float _1762 = _1760 ? 0.0 : 2.0;
    bool _1764 = !_1758;
    float _1766 = _1764 ? 0.0 : 2.0;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1770 = -_1282;
    float _1772 = fma(_1732, _1768, _1770);
    float _1774 = _1724 + _1762;
    bool _1776 = _1772 >= 0.0;
    bool _1778 = isnan(_1772);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1774 + _1766;
    float _1790 = 1.0 / _1324;
    float _1792 = _1788 + _1786;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1796 = -_1282;
    float _1798 = fma(_1790, _1794, _1796);
    float _1800 = 1.0 / _1328;
    bool _1802 = _1798 >= 0.0;
    bool _1804 = isnan(_1798);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = !_1810;
    float _1814 = _1812 ? 0.0 : 2.0;
    float _1816 = _1792 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1820 = -_1282;
    float _1822 = fma(_1584, _1818, _1820);
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1826 = -_1282;
    float _1828 = fma(_1800, _1824, _1826);
    bool _1830 = _1822 >= 0.0;
    bool _1832 = isnan(_1822);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(0.0);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    bool _1842 = _1828 >= 0.0;
    bool _1844 = isnan(_1828);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    float _1852 = float(_1850);
    float _1854 = 1.0 / _1346;
    float _1856 = _1816 + _1852;
    float _1858 = _1856 + _1840;
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1862 = -_1282;
    float _1864 = fma(_1614, _1860, _1862);
    bool _1866 = _1864 >= 0.0;
    bool _1868 = isnan(_1864);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan(0.0);
    bool _1874 = _1870 || _1872;
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1878 = -_1282;
    float _1880 = fma(_1854, _1876, _1878);
    bool _1882 = !_1874;
    float _1884 = _1882 ? 0.0 : 2.0;
    bool _1886 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1888 = isnan(0.5);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1894 = _1890 || _1892;
    bool _1896 = _1880 >= 0.0;
    bool _1898 = isnan(_1880);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = _1858 + _1884;
    float _1910 = 1.0 / _1356;
    float _1912 = _1908 + _1906;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1916 = -_1282;
    float _1918 = fma(_1910, _1914, _1916);
    float _1920 = 1.0 / _1360;
    bool _1922 = _1918 >= 0.0;
    bool _1924 = isnan(_1918);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1934 = -_1282;
    float _1936 = fma(_1920, _1932, _1934);
    float _1938 = 1.0 / _1364;
    bool _1940 = _1936 >= 0.0;
    bool _1942 = isnan(_1936);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1952 = -_1282;
    float _1954 = fma(_1938, _1950, _1952);
    float _1956 = 1.0 / _1368;
    bool _1958 = _1954 >= 0.0;
    bool _1960 = isnan(_1954);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan(0.0);
    bool _1966 = _1962 || _1964;
    float _1968 = _1954;
    float _1970 = _1426;
    float _1972 = _1292;
    float _1974 = _1606;
    if (!_1894)
    {
        float _1976 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _1968 = _1976;
    }
    float _1978 = _1968;
    if (!_1894)
    {
        float _1980 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _176 = _1980;
    }
    float _1982 = _176;
    float _1984 = _1982;
    if (!_1894)
    {
        float _1986 = _1978 * 0.15915493667125701904296875;
        _1970 = _1986;
    }
    float _1988 = _1970;
    if (!_1894)
    {
        float _1990 = _1982 * 0.15915493667125701904296875;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (!_1894)
    {
        float _1994 = _1988 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        _1972 = _1996;
    }
    float _1998 = _1972;
    float _2000 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2002 = -_1282;
    float _2004 = fma(_1956, _2000, _2002);
    float _2006 = 1.0 / _1372;
    bool _2008 = _2004 >= 0.0;
    bool _2010 = isnan(_2004);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan(0.0);
    bool _2016 = _2012 || _2014;
    bool _2018 = !_1948;
    float _2020 = _2018 ? 0.0 : 3.0;
    if (!_1894)
    {
        float _2022 = _1988 * 6.283185482025146484375;
        float _2024 = sin(_2022);
        _1974 = _2024;
    }
    float _2026 = _1974;
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2030 = -_1282;
    float _2032 = fma(_2006, _2028, _2030);
    float _2034 = _1258;
    float _2036 = _2026;
    if (!_1894)
    {
        float _2038 = 1.0 / _1998;
        _2034 = _2038;
    }
    float _2040 = _2034;
    bool _2042 = !_1966;
    float _2044 = _2042 ? 0.0 : 3.0;
    bool _2046 = _2032 >= 0.0;
    bool _2048 = isnan(_2032);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    float _2056 = _2020 + _2044;
    bool _2058 = !_1930;
    float _2060 = _2058 ? 0.0 : 2.0;
    float _2062 = _1320;
    if (!_1894)
    {
        float _2064 = _1992 * 6.283185482025146484375;
        float _2066 = cos(_2064);
        _2062 = _2066;
    }
    float _2068 = _2062;
    bool _2070 = !_2016;
    float _2072 = _2070 ? 0.0 : 3.0;
    float _2074 = _1912 + _2060;
    float _2076 = _2056 + _2072;
    float _2078 = 1.0 / _1376;
    float _2080 = _2040;
    if (!_1894)
    {
        float _2082 = _2026 * _2040;
        _2036 = _2082;
    }
    float _2084 = _2036;
    float _2086 = _2074 * 0.02857142873108386993408203125;
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    if (!_1894)
    {
        float _2090 = _1992 * 6.283185482025146484375;
        float _2092 = sin(_2090);
        _2080 = _2092;
    }
    float _2094 = _2080;
    float _2096 = _2068;
    float _2098 = _2094;
    if (!_1894)
    {
        float _2100 = _2068 * _2084;
        _2096 = _2100;
    }
    float _2102 = _2096;
    bool _2104 = !_2054;
    float _2106 = _2104 ? 0.0 : 3.0;
    float _2108 = _2076 + _2106;
    float _2110 = 1.0 / _1380;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2114 = -_1282;
    float _2116 = fma(_2078, _2112, _2114);
    bool _2118 = _2116 >= 0.0;
    bool _2120 = isnan(_2116);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(0.0);
    bool _2126 = _2122 || _2124;
    float _2128 = 1.0 / _1392;
    bool _2130 = !_2126;
    float _2132 = _2130 ? 0.0 : 3.0;
    float _2134 = _2108 + _2132;
    float _2136 = _1998;
    if (!_1894)
    {
        float _2138 = 1.0 / _2102;
        _2136 = _2138;
    }
    float _2140 = _2136;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2144 = -_1282;
    float _2146 = fma(_2110, _2142, _2144);
    bool _2148 = _2146 >= 0.0;
    bool _2150 = isnan(_2146);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan(0.0);
    bool _2156 = _2152 || _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2160 = -_1282;
    float _2162 = fma(_1632, _2158, _2160);
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2166 = -_1282;
    float _2168 = fma(_2128, _2164, _2166);
    bool _2170 = !_2156;
    float _2172 = _2170 ? 0.0 : 3.0;
    bool _2174 = _2162 >= 0.0;
    bool _2176 = isnan(_2162);
    bool _2178 = _2174 || _2176;
    bool _2180 = isnan(0.0);
    bool _2182 = _2178 || _2180;
    bool _2184 = _2168 >= 0.0;
    bool _2186 = isnan(_2168);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = _2134 + _2172;
    float _2196 = _2168;
    float _2198 = _2162;
    if (!_1894)
    {
        float _2200 = _2094 * _2140;
        _2098 = _2200;
    }
    float _2202 = _2098;
    float _2204 = _2202;
    if (!_1894)
    {
        _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2206 = _2196;
    bool _2208 = !_2192;
    float _2210 = _2208 ? 0.0 : 3.0;
    float _2212 = _2206;
    if (!_1894)
    {
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2216 = fma(_1282, _2202, _2214);
        _2204 = _2216;
    }
    float _2218 = _2204;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2222 = -_1282;
    float _2224 = fma(_1646, _2220, _2222);
    if (!_1894)
    {
        float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2228 = _2206 + _2226;
        _2212 = _2228;
    }
    float _2230 = _2212;
    bool _2232 = !_2182;
    float _2234 = _2232 ? 0.0 : 3.0;
    float _2236 = _2194 + _2210;
    if (_1894)
    {
        _2198 = 1.0;
    }
    float _2238 = _2198;
    float _2240 = _2140;
    float _2242 = _2238;
    if (!_1894)
    {
        float _2244 = 1.0 / _2230;
        _2240 = _2244;
    }
    float _2246 = _2240;
    bool _2248 = _2224 >= 0.0;
    bool _2250 = isnan(_2224);
    bool _2252 = _2248 || _2250;
    bool _2254 = isnan(0.0);
    bool _2256 = _2252 || _2254;
    float _2258 = _2236 + _2234;
    bool _2260 = !_2256;
    float _2262 = _2260 ? 0.0 : 5.0;
    float _2264 = _2258 + _2262;
    float _2266 = _2264 * 0.14285714924335479736328125;
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    if (!_1894)
    {
        float _2270 = _2218 * _2246;
        float _2272 = precise::clamp(_2270, 0.0, 1.0);
        _2242 = _2272;
    }
    float _2274 = _2242;
    float _2276 = _2088 * _2268;
    bool _2278 = _2274 > 0.0;
    bool _2280 = isnan(_2274);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan(0.0);
    bool _2286 = _2282 || _2284;
    float _2288 = _2276 * _2274;
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2292 = _356 * _2290;
    float _2294 = _2292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2294;
    if (_2286)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2296 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2296;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_35.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_38.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2353 = as_type<float>(_90);
        out.gl_Position.z = _2353;
    }
    if (!_78)
    {
        return out;
    }
    float _94 = in.m_40.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    if (_104)
    {
        float _112 = float(_74);
        _110 = _112;
    }
    float _114 = _110;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    if (_120)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _84;
    if (_120)
    {
        out.m_38.x = 0.0;
    }
    if (_120)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2421 = as_type<float>(_126);
        out.gl_Position.z = _2421;
    }
    if (_120)
    {
        return out;
    }
    float _128 = in.m_42.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = as_type<float>(int(gl_VertexIndex));
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_40.x;
    float _148 = in.m_40.y;
    float _150 = in.m_40.z;
    float _152 = _132 * _130;
    float _154 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    int _160 = as_type<int>(_134) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_134) & 2;
    bool _166 = _164 != 0;
    float _168 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _156 * 0.15915493667125701904296875;
    float _172 = 0.0;
    float _174 = _168;
    float _176 = 0.5;
    if (!_144)
    {
        float _178 = _168 * _168;
        float _180 = _178 * 0.5;
        _172 = _180;
    }
    float _182 = _172;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _170 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_166;
    int _194 = _192 ? (-1090519040) : 1056964608;
    float _196 = _182;
    if (!_144)
    {
        float _198 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = -_158;
    float _204 = _154 + _202;
    bool _206 = !_162;
    int _208 = _206 ? (-1090519040) : 1056964608;
    bool _210 = !_144;
    float _212 = _200;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _168 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _168);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_144;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _168 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = fma(_190, 0.5, 0.5);
    bool _272 = _204 < 0.5;
    float _274 = float(_272);
    float _276 = in.m_47.w;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = -_204;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = in.m_35.x;
    float _294 = in.m_35.y;
    float _296 = in.m_35.z;
    float _298 = -_274;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _302 = -_270;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_186;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_268, _146, _290);
    bool _312 = !_280;
    int _314 = _312 ? 0 : 1;
    out.m_49.x = as_type<float>(_208);
    out.m_49.y = as_type<float>(_194);
    int _316 = abs(_308);
    float _318 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_284;
    int _322 = _320 ? 0 : 1;
    float _324 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _326 = abs(_314);
    float _328 = fma(_268, _148, _318);
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _332 = fma(_268, _150, _324);
    int _334 = abs(_322);
    float _336 = float(_326);
    float _338 = float(_316);
    float _340 = abs(_288);
    float _342 = _336 * _340;
    float _344 = fma(_310, _276, _292);
    float _346 = float(_334);
    float _348 = fma(_338, _304, _342);
    float _350 = fma(_332, _276, _296);
    float _352 = fma(_328, _276, _294);
    float _354 = abs(_300);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_330;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_74);
        float _380 = 1.0 / _378;
        float _382 = _108 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _400 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _402 = isnan(_384);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _414 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _416 = 1.0 / _392;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    bool _422 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _424 = isnan(_384);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _436 = -_410;
    float _438 = _436 + 1.0;
    bool _440 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_384);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _454 = -_432;
    float _456 = _454 + 1.0;
    float _458 = 1.0 / _398;
    float _460 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
    float _462 = _432 * _438;
    float _464 = _450 * _456;
    float _466 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    float _468 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _470 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _472 = -_450;
    float _474 = _472 + 1.0;
    float _476 = _420 * _416;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _384 + _478;
    float _482 = _466 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _484 = fma(_476, _480, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _492 = _482 + _490;
    float _494 = _484 * _464;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _498 = _468 + _496;
    float _500 = _488 * _458;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _504 = _384 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _508 = _470 + _506;
    float _510 = _498 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _512 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _494);
    float _514 = fma(_500, _504, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _516 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[28].x, _510);
    float _518 = _498 * _498;
    float _520 = fma(_514, _462, _512);
    float _522 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[28].z, _516);
    float _524 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[117].x, _520);
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _528 = _522 >= 0.0;
    float _530 = fma(_508, _508, _518);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = fma(_492, _492, _530);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _546 = rsqrt(_536);
    float _548 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _550 = _530;
    if (_528)
    {
        _550 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _552 = _550;
    float _554 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _524 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _566 = as_type<int>(_552);
    if (_528)
    {
        float _568 = _552 * 5.0;
        _566 = as_type<int>(_568);
    }
    int _570 = _566;
    float _572 = as_type<float>(_570);
    if (_528)
    {
        out.m_38.x = 0.0;
    }
    out.m_51.x = _558;
    out.m_51.y = _560;
    out.m_51.z = _562;
    out.m_51.w = _544;
    float _574 = _498 * _546;
    float _576 = _508 * _546;
    out.m_53.x = _548;
    out.m_53.y = _554;
    out.m_53.z = _556;
    out.m_53.w = _564;
    if (_528)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3165 = as_type<float>(_570);
        out.gl_Position.z = _3165;
    }
    if (_528)
    {
        return out;
    }
    float _578 = -_574;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _582 = _492 * _546;
    float _584 = -_576;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _470);
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _590 = _580 + _588;
    float _592 = -_582;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _598 = _586 + _596;
    float _600 = _590 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _604 = _594 + _602;
    float _606 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[28].x, _600);
    float _608 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[28].z, _606);
    bool _610 = _608 >= 0.0;
    if (_610)
    {
        _572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _612 = _572;
    int _614 = as_type<int>(_612);
    if (_610)
    {
        out.m_38.x = 0.0;
    }
    if (_610)
    {
        float _616 = _612 * 5.0;
        _614 = as_type<int>(_616);
    }
    int _618 = _614;
    if (_610)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3255 = as_type<float>(_618);
        out.gl_Position.z = _3255;
    }
    if (_610)
    {
        return out;
    }
    float _620 = _580 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _622 = _580 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _624 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _620);
    float _626 = _580 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _628 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[9].x, _622);
    float _630 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[11].z, _624);
    float _632 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[9].z, _628);
    float _634 = _630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _636 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[8].x, _626);
    float _638 = _632 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _640 = 1.0 / _634;
    float _642 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[8].z, _636);
    float _644 = _634 * 0.5;
    float _646 = _642 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _648 = fma(_638, -0.5, _644);
    float _650 = _646 + _634;
    float _652 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _648);
    float _654 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _648);
    float _656 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _648);
    float _658 = _650 * 0.5;
    float _660 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _648);
    float _662 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _648);
    float _664 = _652 * _640;
    float _666 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _658);
    float _668 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _658);
    float _670 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _658);
    float _672 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _658);
    float _674 = _666 * _640;
    float _676 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _648);
    float _678 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _648);
    float _680 = _654 * _640;
    float _682 = _668 * _640;
    float _684 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _658);
    float _686 = _670 * _640;
    float _688 = _656 * _640;
    float _690 = _672 * _640;
    float _692 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _648);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _696 = _648 + _694;
    float _698 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _658);
    float _700 = _660 * _640;
    float _702 = _662 * _640;
    float _704 = _648 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _706 = _676 * _640;
    float _708 = _678 * _640;
    float2 _3443 = float2(_674, _680);
    float _710 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3443, float2(0.0), isnan(_3443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3443, float2(0.0), isnan(_3443)), level(0.0)).x;
    float2 _3453 = float2(_682, _664);
    float _712 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3453, float2(0.0), isnan(_3453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3453, float2(0.0), isnan(_3453)), level(0.0)).x;
    float2 _3461 = float2(_682, _688);
    float _714 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3461, float2(0.0), isnan(_3461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3461, float2(0.0), isnan(_3461)), level(0.0)).x;
    float2 _3469 = float2(_686, _700);
    float _716 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3469, float2(0.0), isnan(_3469)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3469, float2(0.0), isnan(_3469)), level(0.0)).x;
    float2 _3477 = float2(_690, _706);
    float _718 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3477, float2(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3477, float2(0.0), isnan(_3477)), level(0.0)).x;
    float _720 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _658);
    float _722 = _684 * _640;
    float _724 = _648 * _640;
    float _726 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _648);
    float _728 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _648);
    float _730 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _648);
    float _732 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _648);
    float _734 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _648);
    float _736 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _648);
    float _738 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _648);
    float _740 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _648);
    float _742 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _648);
    float _744 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _648);
    float _746 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _648);
    float _748 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _648);
    float _750 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _648);
    float _752 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _648);
    float _754 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _658);
    float _756 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _658);
    float _758 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _658);
    float _760 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _658);
    float _762 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _658);
    float _764 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _658);
    float _766 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _658);
    float _768 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _658);
    float _770 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _658);
    float _772 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _658);
    float _774 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _658);
    float _776 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _658);
    float _778 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _658);
    float _780 = _698 * _640;
    float _782 = _692 * _640;
    float _784 = _696 * _640;
    float _786 = _658 * _640;
    float _788 = _704 * _640;
    float _790 = _720 * _640;
    float2 _3633 = float2(_722, _702);
    float _792 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3633, float2(0.0), isnan(_3633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3633, float2(0.0), isnan(_3633)), level(0.0)).x;
    float2 _3641 = float2(_722, _708);
    float _794 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3641, float2(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3641, float2(0.0), isnan(_3641)), level(0.0)).x;
    float2 _3649 = float2(_780, _782);
    float _796 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3649, float2(0.0), isnan(_3649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3649, float2(0.0), isnan(_3649)), level(0.0)).x;
    float2 _3657 = float2(_786, _782);
    float _798 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3657, float2(0.0), isnan(_3657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3657, float2(0.0), isnan(_3657)), level(0.0)).x;
    float2 _3665 = float2(_786, _784);
    float _800 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3665, float2(0.0), isnan(_3665)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3665, float2(0.0), isnan(_3665)), level(0.0)).x;
    float2 _3673 = float2(_786, _788);
    float _802 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3673, float2(0.0), isnan(_3673)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3673, float2(0.0), isnan(_3673)), level(0.0)).x;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _806 = _658 + _804;
    float _808 = _730 * _640;
    float _810 = _732 * _640;
    float _812 = _734 * _640;
    float _814 = _658 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _816 = _806 * _640;
    float _818 = _726 * _640;
    float2 _3706 = float2(_790, _808);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3706, float2(0.0), isnan(_3706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3706, float2(0.0), isnan(_3706)), level(0.0)).x;
    float2 _3714 = float2(_786, _808);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3714, float2(0.0), isnan(_3714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3714, float2(0.0), isnan(_3714)), level(0.0)).x;
    float2 _3722 = float2(_786, _810);
    float _824 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3722, float2(0.0), isnan(_3722)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3722, float2(0.0), isnan(_3722)), level(0.0)).x;
    float2 _3730 = float2(_786, _812);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3730, float2(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3730, float2(0.0), isnan(_3730)), level(0.0)).x;
    float2 _3738 = float2(_786, _724);
    float _828 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3738, float2(0.0), isnan(_3738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3738, float2(0.0), isnan(_3738)), level(0.0)).x;
    float2 _3746 = float2(_816, _724);
    float _830 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3746, float2(0.0), isnan(_3746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3746, float2(0.0), isnan(_3746)), level(0.0)).x;
    float _832 = _754 * _640;
    float _834 = _728 * _640;
    float _836 = _814 * _640;
    float _838 = _758 * _640;
    float _840 = _756 * _640;
    float _842 = _760 * _640;
    float2 _3772 = float2(_832, _818);
    float _844 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3772, float2(0.0), isnan(_3772)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3772, float2(0.0), isnan(_3772)), level(0.0)).x;
    float2 _3780 = float2(_832, _834);
    float _846 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3780, float2(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3780, float2(0.0), isnan(_3780)), level(0.0)).x;
    float2 _3788 = float2(_832, _724);
    float _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3788, float2(0.0), isnan(_3788)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3788, float2(0.0), isnan(_3788)), level(0.0)).x;
    float2 _3796 = float2(_836, _724);
    float _850 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3796, float2(0.0), isnan(_3796)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3796, float2(0.0), isnan(_3796)), level(0.0)).x;
    float2 _3804 = float2(_840, _724);
    float _852 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3804, float2(0.0), isnan(_3804)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3804, float2(0.0), isnan(_3804)), level(0.0)).x;
    float2 _3812 = float2(_838, _724);
    float _854 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).x;
    float2 _3820 = float2(_842, _724);
    float _856 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3820, float2(0.0), isnan(_3820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3820, float2(0.0), isnan(_3820)), level(0.0)).x;
    float _858 = _762 * _640;
    float _860 = _764 * _640;
    float _862 = _736 * _640;
    float _864 = _766 * _640;
    float _866 = _738 * _640;
    float _868 = _768 * _640;
    float _870 = _740 * _640;
    float _872 = _770 * _640;
    float _874 = _742 * _640;
    float _876 = _772 * _640;
    float _878 = _744 * _640;
    float _880 = _774 * _640;
    float2 _3864 = float2(_858, _862);
    float _882 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3864, float2(0.0), isnan(_3864)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3864, float2(0.0), isnan(_3864)), level(0.0)).x;
    float2 _3872 = float2(_860, _866);
    float _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3872, float2(0.0), isnan(_3872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3872, float2(0.0), isnan(_3872)), level(0.0)).x;
    float2 _3880 = float2(_864, _870);
    float _886 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3880, float2(0.0), isnan(_3880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3880, float2(0.0), isnan(_3880)), level(0.0)).x;
    float2 _3888 = float2(_868, _874);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3888, float2(0.0), isnan(_3888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3888, float2(0.0), isnan(_3888)), level(0.0)).x;
    float2 _3896 = float2(_872, _878);
    float _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3896, float2(0.0), isnan(_3896)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3896, float2(0.0), isnan(_3896)), level(0.0)).x;
    float _892 = _746 * _640;
    float _894 = _776 * _640;
    float _896 = _748 * _640;
    float _898 = _750 * _640;
    float2 _3916 = float2(_876, _892);
    float _900 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3916, float2(0.0), isnan(_3916)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3916, float2(0.0), isnan(_3916)), level(0.0)).x;
    float _902 = _778 * _640;
    float2 _3927 = float2(_880, _896);
    float _904 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3927, float2(0.0), isnan(_3927)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3927, float2(0.0), isnan(_3927)), level(0.0)).x;
    float2 _3935 = float2(_894, _898);
    float _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3935, float2(0.0), isnan(_3935)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3935, float2(0.0), isnan(_3935)), level(0.0)).x;
    float _908 = _752 * _640;
    float2 _3946 = float2(_902, _908);
    float _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3946, float2(0.0), isnan(_3946)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3946, float2(0.0), isnan(_3946)), level(0.0)).x;
    float _912 = -_574;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _916 = -_576;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _920 = -_582;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _924 = in.m_47.x;
    float _926 = in.m_47.y;
    float _928 = _914 * _914;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_194));
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_208));
    float _934 = fma(_918, _918, _928);
    bool _936 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _944 = _940 || _942;
    float _946 = fma(_922, _922, _934);
    float _948 = sqrt(_946);
    float _950 = _926 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _952 = _924 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _954 = _356 * _950;
    float _956 = _546 * _948;
    float _958 = _356 * _952;
    float _960 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _962 = _580 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _964 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _966 = _956 * _960;
    float _968 = _956 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _970 = _968 * 0.5;
    float _972 = _956 * _964;
    float _974 = _930 * _966;
    float _976 = _932 * _972;
    float _978 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _980 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _984 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _980);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _982);
    float _990 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _992 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[25].z, _988);
    float _996 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _998 = _992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1000 = _994 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1002 = _482 + _996;
    float _1004 = _470 + _998;
    float _1006 = _468 + _1000;
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1010 = _1002 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1004 + _1012;
    float _1016 = _1010 * _1010;
    float _1018 = fma(_1014, _1014, _1016);
    float _1020 = sqrt(_1018);
    float _1022 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _962);
    bool _1024 = _1020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _1000;
    float _1028 = _970;
    float _1030 = _1006;
    if (!_1024)
    {
        _1026 = _1004;
    }
    float _1032 = _1026;
    float _1034 = _1032;
    if (!_1024)
    {
        _1028 = _1002;
    }
    float _1036 = _1028;
    bool _1038 = !_1024;
    float _1040 = _1036;
    if (!_1038)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1046 = _1020 + _1044;
        float _1048 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = rsqrt(_1018);
        float _1052 = _1046 * _1042;
        float _1054 = _1052 * 0.15915493667125701904296875;
        float _1056 = _1054 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        float _1064 = _1058 + (-1.0);
        float _1066 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = fma(_1062, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1070 = fma(_1006, _1058, _1066);
        float _1072 = _1050 * _1068;
        float _1074 = fma(_1014, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1076 = fma(_1010, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1034 = _1074;
        _1030 = _1070;
        _1040 = _1076;
    }
    float _1078 = _1034;
    float _1080 = _1030;
    float _1082 = _1040;
    float _1084 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1022);
    float _1086 = -_576;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1090 = -_574;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1094 = -_582;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1100 = _1092;
    float _1102 = _1088;
    float _1104 = _1096;
    if (!_944)
    {
        float _1106 = _590 * _590;
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1110 = -_482;
        float _1112 = _1110 + _1082;
        float _1114 = -_470;
        float _1116 = _1114 + _1078;
        float _1118 = fma(_598, _598, _1106);
        float _1120 = -_468;
        float _1122 = _1120 + _1080;
        float _1124 = fma(_604, _604, _1118);
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1128 = sqrt(_1124);
        float _1130 = 1.0 / _956;
        float _1132 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1134 = precise::min(_1128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1136 = _1134 * _1108;
        float _1138 = _1136 * _1130;
        float _1140 = _1132 * _1138;
        float _1142 = _1112 * _1138;
        float _1144 = fma(_1116, _1140, _586);
        float _1146 = fma(_1122, _1140, _580);
        float _1148 = fma(_1132, _1142, _594);
        _1100 = _1146;
        _1102 = _1144;
        _1104 = _1148;
    }
    float _1150 = _1100;
    float _1152 = _1102;
    float _1154 = _1104;
    float _1156 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1160 = _1098 + _634;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1156);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1158);
    float _1168 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1170 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1166);
    float _1176 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1168);
    float _1178 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1184 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1190 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1192 = _1160 * _640;
    float _1194 = _1192 * 0.5;
    float _1196 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1188);
    float _1200 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1190);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1198);
    float _1208 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1214 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1218 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1216);
    float _1220 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1224 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1222);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1214);
    float _1232 = 1.0 / _1218;
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1238 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1236);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1246 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1244);
    float _1248 = _1226 + _1228;
    out.gl_Position.x = _1230;
    out.gl_Position.y = _1234;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1228;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1252 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1250);
    float _1254 = 1.0 / _1224;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1262 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1260);
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1266 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1264);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1270 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1268);
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1274 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1272);
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1278 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1276);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1282 = _1232 * _1280;
    float _1284 = 1.0 / _1252;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1292 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1290);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1296 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1294);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1300 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1304 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1302);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1308 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1306);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1312 = -_1282;
    float _1314 = fma(_1254, _1310, _1312);
    float _1316 = 1.0 / _1238;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1320 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1324 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1322);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1328 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1326);
    bool _1330 = _1314 >= 0.0;
    bool _1332 = isnan(_1314);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.0);
    bool _1338 = _1334 || _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1342 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1340);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1346 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1344);
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1350 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1348);
    float _1352 = 1.0 / _1242;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1356 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1354);
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1360 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1358);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1364 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1362);
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1368 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1366);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1372 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1370);
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1376 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1374);
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    float _1382 = 1.0 / _1246;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = -_1282;
    float _1388 = fma(_1316, _1384, _1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1392 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1390);
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1396 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1394);
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1400 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1398);
    float _1402 = _1248 * 0.5;
    bool _1404 = _1388 >= 0.0;
    bool _1406 = isnan(_1388);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan(0.0);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1418 = -_1282;
    float _1420 = fma(_1352, _1416, _1418);
    bool _1422 = !_1338;
    float _1424 = _1422 ? 0.0 : 2.0;
    float _1426 = 1.0 / _1262;
    out.m_55.z = _1402;
    out.m_55.w = _1228;
    bool _1428 = _1420 >= 0.0;
    bool _1430 = isnan(_1420);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = _1424 + _1414;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1442 = -_1282;
    float _1444 = fma(_1382, _1440, _1442);
    bool _1446 = !_1436;
    float _1448 = _1446 ? 0.0 : 2.0;
    float _1450 = 1.0 / _1270;
    bool _1452 = _1444 >= 0.0;
    bool _1454 = isnan(_1444);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan(0.0);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1438 + _1448;
    float _1466 = 1.0 / _1258;
    float _1468 = _1464 + _1462;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1472 = -_1282;
    float _1474 = fma(_1284, _1470, _1472);
    bool _1476 = _1474 >= 0.0;
    bool _1478 = isnan(_1474);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = 1.0 / _1278;
    float _1490 = _1468 + _1486;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1494 = -_1282;
    float _1496 = fma(_1426, _1492, _1494);
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1500 = -_1282;
    float _1502 = fma(_1466, _1498, _1500);
    float _1504 = 1.0 / _1296;
    bool _1506 = _1496 >= 0.0;
    bool _1508 = isnan(_1496);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    bool _1516 = _1502 >= 0.0;
    bool _1518 = isnan(_1502);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = float(_1524);
    bool _1528 = !_1514;
    float _1530 = _1528 ? 0.0 : 2.0;
    float _1532 = 1.0 / _1266;
    float _1534 = _1490 + _1530;
    float _1536 = _1534 + _1526;
    float _1538 = 1.0 / _1300;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1542 = -_1282;
    float _1544 = fma(_1532, _1540, _1542);
    float _1546 = 1.0 / _1308;
    bool _1548 = _1544 >= 0.0;
    bool _1550 = isnan(_1544);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1560 = -_1282;
    float _1562 = fma(_1450, _1558, _1560);
    float _1564 = 1.0 / _1274;
    bool _1566 = _1562 >= 0.0;
    bool _1568 = isnan(_1562);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    bool _1576 = !_1556;
    float _1578 = _1576 ? 0.0 : 2.0;
    bool _1580 = !_1574;
    float _1582 = _1580 ? 0.0 : 2.0;
    float _1584 = 1.0 / _1342;
    float _1586 = _1536 + _1578;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1590 = -_1282;
    float _1592 = fma(_1504, _1588, _1590);
    float _1594 = _1586 + _1582;
    bool _1596 = _1592 >= 0.0;
    bool _1598 = isnan(_1592);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1610 = -_1282;
    float _1612 = fma(_1564, _1608, _1610);
    float _1614 = 1.0 / _1350;
    bool _1616 = _1612 >= 0.0;
    bool _1618 = isnan(_1612);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = 1.0 / _1288;
    float _1630 = _1594 + _1626;
    float _1632 = 1.0 / _1396;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = -_1282;
    float _1638 = fma(_1628, _1634, _1636);
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1642 = -_1282;
    float _1644 = fma(_1488, _1640, _1642);
    float _1646 = 1.0 / _1400;
    bool _1648 = _1638 >= 0.0;
    bool _1650 = isnan(_1638);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan(0.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = _1644 >= 0.0;
    bool _1660 = isnan(_1644);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan(0.0);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    bool _1670 = !_1656;
    float _1672 = _1670 ? 0.0 : 2.0;
    float _1674 = 1.0 / _1292;
    float _1676 = _1630 + _1672;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1680 = -_1282;
    float _1682 = fma(_1538, _1678, _1680);
    float _1684 = _1676 + _1668;
    bool _1686 = _1682 >= 0.0;
    bool _1688 = isnan(_1682);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan(0.0);
    bool _1694 = _1690 || _1692;
    float _1696 = _1684 + _1606;
    bool _1698 = !_1694;
    float _1700 = _1698 ? 0.0 : 2.0;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1704 = -_1282;
    float _1706 = fma(_1674, _1702, _1704);
    float _1708 = _1696 + _1700;
    bool _1710 = _1706 >= 0.0;
    bool _1712 = isnan(_1706);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan(0.0);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = 1.0 / _1304;
    float _1724 = _1708 + _1720;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1728 = -_1282;
    float _1730 = fma(_1722, _1726, _1728);
    float _1732 = 1.0 / _1320;
    bool _1734 = _1730 >= 0.0;
    bool _1736 = isnan(_1730);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1746 = -_1282;
    float _1748 = fma(_1546, _1744, _1746);
    bool _1750 = _1748 >= 0.0;
    bool _1752 = isnan(_1748);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan(0.0);
    bool _1758 = _1754 || _1756;
    bool _1760 = !_1742;
    float _1762 = _1760 ? 0.0 : 2.0;
    bool _1764 = !_1758;
    float _1766 = _1764 ? 0.0 : 2.0;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1770 = -_1282;
    float _1772 = fma(_1732, _1768, _1770);
    float _1774 = _1724 + _1762;
    bool _1776 = _1772 >= 0.0;
    bool _1778 = isnan(_1772);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1774 + _1766;
    float _1790 = 1.0 / _1324;
    float _1792 = _1788 + _1786;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1796 = -_1282;
    float _1798 = fma(_1790, _1794, _1796);
    float _1800 = 1.0 / _1328;
    bool _1802 = _1798 >= 0.0;
    bool _1804 = isnan(_1798);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = !_1810;
    float _1814 = _1812 ? 0.0 : 2.0;
    float _1816 = _1792 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1820 = -_1282;
    float _1822 = fma(_1584, _1818, _1820);
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1826 = -_1282;
    float _1828 = fma(_1800, _1824, _1826);
    bool _1830 = _1822 >= 0.0;
    bool _1832 = isnan(_1822);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(0.0);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    bool _1842 = _1828 >= 0.0;
    bool _1844 = isnan(_1828);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    float _1852 = float(_1850);
    float _1854 = 1.0 / _1346;
    float _1856 = _1816 + _1852;
    float _1858 = _1856 + _1840;
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1862 = -_1282;
    float _1864 = fma(_1614, _1860, _1862);
    bool _1866 = _1864 >= 0.0;
    bool _1868 = isnan(_1864);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan(0.0);
    bool _1874 = _1870 || _1872;
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1878 = -_1282;
    float _1880 = fma(_1854, _1876, _1878);
    bool _1882 = !_1874;
    float _1884 = _1882 ? 0.0 : 2.0;
    bool _1886 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1888 = isnan(0.5);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1894 = _1890 || _1892;
    bool _1896 = _1880 >= 0.0;
    bool _1898 = isnan(_1880);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = _1858 + _1884;
    float _1910 = 1.0 / _1356;
    float _1912 = _1908 + _1906;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1916 = -_1282;
    float _1918 = fma(_1910, _1914, _1916);
    float _1920 = 1.0 / _1360;
    bool _1922 = _1918 >= 0.0;
    bool _1924 = isnan(_1918);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1934 = -_1282;
    float _1936 = fma(_1920, _1932, _1934);
    float _1938 = 1.0 / _1364;
    bool _1940 = _1936 >= 0.0;
    bool _1942 = isnan(_1936);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1952 = -_1282;
    float _1954 = fma(_1938, _1950, _1952);
    float _1956 = 1.0 / _1368;
    bool _1958 = _1954 >= 0.0;
    bool _1960 = isnan(_1954);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan(0.0);
    bool _1966 = _1962 || _1964;
    float _1968 = _1954;
    float _1970 = _1426;
    float _1972 = _1292;
    float _1974 = _1606;
    if (!_1894)
    {
        float _1976 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _1968 = _1976;
    }
    float _1978 = _1968;
    if (!_1894)
    {
        float _1980 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _176 = _1980;
    }
    float _1982 = _176;
    float _1984 = _1982;
    if (!_1894)
    {
        float _1986 = _1978 * 0.15915493667125701904296875;
        _1970 = _1986;
    }
    float _1988 = _1970;
    if (!_1894)
    {
        float _1990 = _1982 * 0.15915493667125701904296875;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (!_1894)
    {
        float _1994 = _1988 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        _1972 = _1996;
    }
    float _1998 = _1972;
    float _2000 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2002 = -_1282;
    float _2004 = fma(_1956, _2000, _2002);
    float _2006 = 1.0 / _1372;
    bool _2008 = _2004 >= 0.0;
    bool _2010 = isnan(_2004);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan(0.0);
    bool _2016 = _2012 || _2014;
    bool _2018 = !_1948;
    float _2020 = _2018 ? 0.0 : 3.0;
    if (!_1894)
    {
        float _2022 = _1988 * 6.283185482025146484375;
        float _2024 = sin(_2022);
        _1974 = _2024;
    }
    float _2026 = _1974;
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2030 = -_1282;
    float _2032 = fma(_2006, _2028, _2030);
    float _2034 = _1258;
    float _2036 = _2026;
    if (!_1894)
    {
        float _2038 = 1.0 / _1998;
        _2034 = _2038;
    }
    float _2040 = _2034;
    bool _2042 = !_1966;
    float _2044 = _2042 ? 0.0 : 3.0;
    bool _2046 = _2032 >= 0.0;
    bool _2048 = isnan(_2032);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    float _2056 = _2020 + _2044;
    bool _2058 = !_1930;
    float _2060 = _2058 ? 0.0 : 2.0;
    float _2062 = _1320;
    if (!_1894)
    {
        float _2064 = _1992 * 6.283185482025146484375;
        float _2066 = cos(_2064);
        _2062 = _2066;
    }
    float _2068 = _2062;
    bool _2070 = !_2016;
    float _2072 = _2070 ? 0.0 : 3.0;
    float _2074 = _1912 + _2060;
    float _2076 = _2056 + _2072;
    float _2078 = 1.0 / _1376;
    float _2080 = _2040;
    if (!_1894)
    {
        float _2082 = _2026 * _2040;
        _2036 = _2082;
    }
    float _2084 = _2036;
    float _2086 = _2074 * 0.02857142873108386993408203125;
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    if (!_1894)
    {
        float _2090 = _1992 * 6.283185482025146484375;
        float _2092 = sin(_2090);
        _2080 = _2092;
    }
    float _2094 = _2080;
    float _2096 = _2068;
    float _2098 = _2094;
    if (!_1894)
    {
        float _2100 = _2068 * _2084;
        _2096 = _2100;
    }
    float _2102 = _2096;
    bool _2104 = !_2054;
    float _2106 = _2104 ? 0.0 : 3.0;
    float _2108 = _2076 + _2106;
    float _2110 = 1.0 / _1380;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2114 = -_1282;
    float _2116 = fma(_2078, _2112, _2114);
    bool _2118 = _2116 >= 0.0;
    bool _2120 = isnan(_2116);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(0.0);
    bool _2126 = _2122 || _2124;
    float _2128 = 1.0 / _1392;
    bool _2130 = !_2126;
    float _2132 = _2130 ? 0.0 : 3.0;
    float _2134 = _2108 + _2132;
    float _2136 = _1998;
    if (!_1894)
    {
        float _2138 = 1.0 / _2102;
        _2136 = _2138;
    }
    float _2140 = _2136;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2144 = -_1282;
    float _2146 = fma(_2110, _2142, _2144);
    bool _2148 = _2146 >= 0.0;
    bool _2150 = isnan(_2146);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan(0.0);
    bool _2156 = _2152 || _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2160 = -_1282;
    float _2162 = fma(_1632, _2158, _2160);
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2166 = -_1282;
    float _2168 = fma(_2128, _2164, _2166);
    bool _2170 = !_2156;
    float _2172 = _2170 ? 0.0 : 3.0;
    bool _2174 = _2162 >= 0.0;
    bool _2176 = isnan(_2162);
    bool _2178 = _2174 || _2176;
    bool _2180 = isnan(0.0);
    bool _2182 = _2178 || _2180;
    bool _2184 = _2168 >= 0.0;
    bool _2186 = isnan(_2168);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = _2134 + _2172;
    float _2196 = _2168;
    float _2198 = _2162;
    if (!_1894)
    {
        float _2200 = _2094 * _2140;
        _2098 = _2200;
    }
    float _2202 = _2098;
    float _2204 = _2202;
    if (!_1894)
    {
        _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2206 = _2196;
    bool _2208 = !_2192;
    float _2210 = _2208 ? 0.0 : 3.0;
    float _2212 = _2206;
    if (!_1894)
    {
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2216 = fma(_1282, _2202, _2214);
        _2204 = _2216;
    }
    float _2218 = _2204;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2222 = -_1282;
    float _2224 = fma(_1646, _2220, _2222);
    if (!_1894)
    {
        float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2228 = _2206 + _2226;
        _2212 = _2228;
    }
    float _2230 = _2212;
    bool _2232 = !_2182;
    float _2234 = _2232 ? 0.0 : 3.0;
    float _2236 = _2194 + _2210;
    if (_1894)
    {
        _2198 = 1.0;
    }
    float _2238 = _2198;
    float _2240 = _2140;
    float _2242 = _2238;
    if (!_1894)
    {
        float _2244 = 1.0 / _2230;
        _2240 = _2244;
    }
    float _2246 = _2240;
    bool _2248 = _2224 >= 0.0;
    bool _2250 = isnan(_2224);
    bool _2252 = _2248 || _2250;
    bool _2254 = isnan(0.0);
    bool _2256 = _2252 || _2254;
    float _2258 = _2236 + _2234;
    bool _2260 = !_2256;
    float _2262 = _2260 ? 0.0 : 5.0;
    float _2264 = _2258 + _2262;
    float _2266 = _2264 * 0.14285714924335479736328125;
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    if (!_1894)
    {
        float _2270 = _2218 * _2246;
        float _2272 = precise::clamp(_2270, 0.0, 1.0);
        _2242 = _2272;
    }
    float _2274 = _2242;
    float _2276 = _2088 * _2268;
    bool _2278 = _2274 > 0.0;
    bool _2280 = isnan(_2274);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan(0.0);
    bool _2286 = _2282 || _2284;
    float _2288 = _2276 * _2274;
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2292 = _356 * _2290;
    float _2294 = _2292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2294;
    if (_2286)
    {
        return out;
    }
    float _2296 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2296;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_35.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_38.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2353 = as_type<float>(_90);
        out.gl_Position.z = _2353;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_40.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    if (_104)
    {
        float _112 = float(_74);
        _110 = _112;
    }
    float _114 = _110;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    if (_120)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _84;
    if (_120)
    {
        out.m_38.x = 0.0;
    }
    if (_120)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2421 = as_type<float>(_126);
        out.gl_Position.z = _2421;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_42.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = as_type<float>(int(gl_VertexIndex));
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_40.x;
    float _148 = in.m_40.y;
    float _150 = in.m_40.z;
    float _152 = _132 * _130;
    float _154 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    int _160 = as_type<int>(_134) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_134) & 2;
    bool _166 = _164 != 0;
    float _168 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _156 * 0.15915493667125701904296875;
    float _172 = 0.0;
    float _174 = _168;
    float _176 = 0.5;
    if (!_144)
    {
        float _178 = _168 * _168;
        float _180 = _178 * 0.5;
        _172 = _180;
    }
    float _182 = _172;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _170 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_166;
    int _194 = _192 ? (-1090519040) : 1056964608;
    float _196 = _182;
    if (!_144)
    {
        float _198 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = -_158;
    float _204 = _154 + _202;
    bool _206 = !_162;
    int _208 = _206 ? (-1090519040) : 1056964608;
    bool _210 = !_144;
    float _212 = _200;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _168 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _168);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_144;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _168 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = fma(_190, 0.5, 0.5);
    bool _272 = _204 < 0.5;
    float _274 = float(_272);
    float _276 = in.m_47.w;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = -_204;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = in.m_35.x;
    float _294 = in.m_35.y;
    float _296 = in.m_35.z;
    float _298 = -_274;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _302 = -_270;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_186;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_268, _146, _290);
    bool _312 = !_280;
    int _314 = _312 ? 0 : 1;
    out.m_49.x = as_type<float>(_208);
    out.m_49.y = as_type<float>(_194);
    int _316 = abs(_308);
    float _318 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_284;
    int _322 = _320 ? 0 : 1;
    float _324 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _326 = abs(_314);
    float _328 = fma(_268, _148, _318);
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _332 = fma(_268, _150, _324);
    int _334 = abs(_322);
    float _336 = float(_326);
    float _338 = float(_316);
    float _340 = abs(_288);
    float _342 = _336 * _340;
    float _344 = fma(_310, _276, _292);
    float _346 = float(_334);
    float _348 = fma(_338, _304, _342);
    float _350 = fma(_332, _276, _296);
    float _352 = fma(_328, _276, _294);
    float _354 = abs(_300);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_330;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_74);
        float _380 = 1.0 / _378;
        float _382 = _108 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _400 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _402 = isnan(_384);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _414 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _416 = 1.0 / _392;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _418;
    bool _422 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _424 = isnan(_384);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _436 = -_410;
    float _438 = _436 + 1.0;
    bool _440 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_384);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _454 = -_432;
    float _456 = _454 + 1.0;
    float _458 = 1.0 / _398;
    float _460 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
    float _462 = _432 * _438;
    float _464 = _450 * _456;
    float _466 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    float _468 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _470 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _472 = -_450;
    float _474 = _472 + 1.0;
    float _476 = _420 * _416;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _384 + _478;
    float _482 = _466 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _484 = fma(_476, _480, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _492 = _482 + _490;
    float _494 = _484 * _464;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _498 = _468 + _496;
    float _500 = _488 * _458;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _504 = _384 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _508 = _470 + _506;
    float _510 = _498 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _512 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _494);
    float _514 = fma(_500, _504, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _516 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[28].x, _510);
    float _518 = _498 * _498;
    float _520 = fma(_514, _462, _512);
    float _522 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[28].z, _516);
    float _524 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[117].x, _520);
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _528 = _522 >= 0.0;
    float _530 = fma(_508, _508, _518);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = fma(_492, _492, _530);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _546 = rsqrt(_536);
    float _548 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _550 = _530;
    if (_528)
    {
        _550 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _552 = _550;
    float _554 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _524 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _566 = as_type<int>(_552);
    if (_528)
    {
        float _568 = _552 * 5.0;
        _566 = as_type<int>(_568);
    }
    int _570 = _566;
    float _572 = as_type<float>(_570);
    if (_528)
    {
        out.m_38.x = 0.0;
    }
    out.m_51.x = _558;
    out.m_51.y = _560;
    out.m_51.z = _562;
    out.m_51.w = _544;
    float _574 = _498 * _546;
    float _576 = _508 * _546;
    out.m_53.x = _548;
    out.m_53.y = _554;
    out.m_53.z = _556;
    out.m_53.w = _564;
    if (_528)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3165 = as_type<float>(_570);
        out.gl_Position.z = _3165;
    }
    if (_528)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _578 = -_574;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _582 = _492 * _546;
    float _584 = -_576;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _470);
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _590 = _580 + _588;
    float _592 = -_582;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _598 = _586 + _596;
    float _600 = _590 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _604 = _594 + _602;
    float _606 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[28].x, _600);
    float _608 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[28].z, _606);
    bool _610 = _608 >= 0.0;
    if (_610)
    {
        _572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _612 = _572;
    int _614 = as_type<int>(_612);
    if (_610)
    {
        out.m_38.x = 0.0;
    }
    if (_610)
    {
        float _616 = _612 * 5.0;
        _614 = as_type<int>(_616);
    }
    int _618 = _614;
    if (_610)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3255 = as_type<float>(_618);
        out.gl_Position.z = _3255;
    }
    if (_610)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _620 = _580 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _622 = _580 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _624 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _620);
    float _626 = _580 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _628 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[9].x, _622);
    float _630 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[11].z, _624);
    float _632 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[9].z, _628);
    float _634 = _630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _636 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[8].x, _626);
    float _638 = _632 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _640 = 1.0 / _634;
    float _642 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[8].z, _636);
    float _644 = _634 * 0.5;
    float _646 = _642 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _648 = fma(_638, -0.5, _644);
    float _650 = _646 + _634;
    float _652 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _648);
    float _654 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _648);
    float _656 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _648);
    float _658 = _650 * 0.5;
    float _660 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _648);
    float _662 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _648);
    float _664 = _652 * _640;
    float _666 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _658);
    float _668 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _658);
    float _670 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _658);
    float _672 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _658);
    float _674 = _666 * _640;
    float _676 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _648);
    float _678 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _648);
    float _680 = _654 * _640;
    float _682 = _668 * _640;
    float _684 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _658);
    float _686 = _670 * _640;
    float _688 = _656 * _640;
    float _690 = _672 * _640;
    float _692 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _648);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _696 = _648 + _694;
    float _698 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _658);
    float _700 = _660 * _640;
    float _702 = _662 * _640;
    float _704 = _648 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _706 = _676 * _640;
    float _708 = _678 * _640;
    float2 _3443 = float2(_674, _680);
    float _710 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3443, float2(0.0), isnan(_3443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3443, float2(0.0), isnan(_3443)), level(0.0)).x;
    float2 _3453 = float2(_682, _664);
    float _712 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3453, float2(0.0), isnan(_3453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3453, float2(0.0), isnan(_3453)), level(0.0)).x;
    float2 _3461 = float2(_682, _688);
    float _714 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3461, float2(0.0), isnan(_3461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3461, float2(0.0), isnan(_3461)), level(0.0)).x;
    float2 _3469 = float2(_686, _700);
    float _716 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3469, float2(0.0), isnan(_3469)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3469, float2(0.0), isnan(_3469)), level(0.0)).x;
    float2 _3477 = float2(_690, _706);
    float _718 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3477, float2(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3477, float2(0.0), isnan(_3477)), level(0.0)).x;
    float _720 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _658);
    float _722 = _684 * _640;
    float _724 = _648 * _640;
    float _726 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _648);
    float _728 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _648);
    float _730 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _648);
    float _732 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _648);
    float _734 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _648);
    float _736 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _648);
    float _738 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _648);
    float _740 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _648);
    float _742 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _648);
    float _744 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _648);
    float _746 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _648);
    float _748 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _648);
    float _750 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _648);
    float _752 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _648);
    float _754 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _658);
    float _756 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _658);
    float _758 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _658);
    float _760 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _658);
    float _762 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _658);
    float _764 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _658);
    float _766 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _658);
    float _768 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _658);
    float _770 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _658);
    float _772 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _658);
    float _774 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _658);
    float _776 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _658);
    float _778 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _658);
    float _780 = _698 * _640;
    float _782 = _692 * _640;
    float _784 = _696 * _640;
    float _786 = _658 * _640;
    float _788 = _704 * _640;
    float _790 = _720 * _640;
    float2 _3633 = float2(_722, _702);
    float _792 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3633, float2(0.0), isnan(_3633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3633, float2(0.0), isnan(_3633)), level(0.0)).x;
    float2 _3641 = float2(_722, _708);
    float _794 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3641, float2(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3641, float2(0.0), isnan(_3641)), level(0.0)).x;
    float2 _3649 = float2(_780, _782);
    float _796 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3649, float2(0.0), isnan(_3649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3649, float2(0.0), isnan(_3649)), level(0.0)).x;
    float2 _3657 = float2(_786, _782);
    float _798 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3657, float2(0.0), isnan(_3657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3657, float2(0.0), isnan(_3657)), level(0.0)).x;
    float2 _3665 = float2(_786, _784);
    float _800 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3665, float2(0.0), isnan(_3665)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3665, float2(0.0), isnan(_3665)), level(0.0)).x;
    float2 _3673 = float2(_786, _788);
    float _802 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3673, float2(0.0), isnan(_3673)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3673, float2(0.0), isnan(_3673)), level(0.0)).x;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _806 = _658 + _804;
    float _808 = _730 * _640;
    float _810 = _732 * _640;
    float _812 = _734 * _640;
    float _814 = _658 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _816 = _806 * _640;
    float _818 = _726 * _640;
    float2 _3706 = float2(_790, _808);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3706, float2(0.0), isnan(_3706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3706, float2(0.0), isnan(_3706)), level(0.0)).x;
    float2 _3714 = float2(_786, _808);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3714, float2(0.0), isnan(_3714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3714, float2(0.0), isnan(_3714)), level(0.0)).x;
    float2 _3722 = float2(_786, _810);
    float _824 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3722, float2(0.0), isnan(_3722)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3722, float2(0.0), isnan(_3722)), level(0.0)).x;
    float2 _3730 = float2(_786, _812);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3730, float2(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3730, float2(0.0), isnan(_3730)), level(0.0)).x;
    float2 _3738 = float2(_786, _724);
    float _828 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3738, float2(0.0), isnan(_3738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3738, float2(0.0), isnan(_3738)), level(0.0)).x;
    float2 _3746 = float2(_816, _724);
    float _830 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3746, float2(0.0), isnan(_3746)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3746, float2(0.0), isnan(_3746)), level(0.0)).x;
    float _832 = _754 * _640;
    float _834 = _728 * _640;
    float _836 = _814 * _640;
    float _838 = _758 * _640;
    float _840 = _756 * _640;
    float _842 = _760 * _640;
    float2 _3772 = float2(_832, _818);
    float _844 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3772, float2(0.0), isnan(_3772)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3772, float2(0.0), isnan(_3772)), level(0.0)).x;
    float2 _3780 = float2(_832, _834);
    float _846 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3780, float2(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3780, float2(0.0), isnan(_3780)), level(0.0)).x;
    float2 _3788 = float2(_832, _724);
    float _848 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3788, float2(0.0), isnan(_3788)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3788, float2(0.0), isnan(_3788)), level(0.0)).x;
    float2 _3796 = float2(_836, _724);
    float _850 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3796, float2(0.0), isnan(_3796)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3796, float2(0.0), isnan(_3796)), level(0.0)).x;
    float2 _3804 = float2(_840, _724);
    float _852 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3804, float2(0.0), isnan(_3804)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3804, float2(0.0), isnan(_3804)), level(0.0)).x;
    float2 _3812 = float2(_838, _724);
    float _854 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).x;
    float2 _3820 = float2(_842, _724);
    float _856 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3820, float2(0.0), isnan(_3820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3820, float2(0.0), isnan(_3820)), level(0.0)).x;
    float _858 = _762 * _640;
    float _860 = _764 * _640;
    float _862 = _736 * _640;
    float _864 = _766 * _640;
    float _866 = _738 * _640;
    float _868 = _768 * _640;
    float _870 = _740 * _640;
    float _872 = _770 * _640;
    float _874 = _742 * _640;
    float _876 = _772 * _640;
    float _878 = _744 * _640;
    float _880 = _774 * _640;
    float2 _3864 = float2(_858, _862);
    float _882 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3864, float2(0.0), isnan(_3864)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3864, float2(0.0), isnan(_3864)), level(0.0)).x;
    float2 _3872 = float2(_860, _866);
    float _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3872, float2(0.0), isnan(_3872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3872, float2(0.0), isnan(_3872)), level(0.0)).x;
    float2 _3880 = float2(_864, _870);
    float _886 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3880, float2(0.0), isnan(_3880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3880, float2(0.0), isnan(_3880)), level(0.0)).x;
    float2 _3888 = float2(_868, _874);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3888, float2(0.0), isnan(_3888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3888, float2(0.0), isnan(_3888)), level(0.0)).x;
    float2 _3896 = float2(_872, _878);
    float _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3896, float2(0.0), isnan(_3896)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3896, float2(0.0), isnan(_3896)), level(0.0)).x;
    float _892 = _746 * _640;
    float _894 = _776 * _640;
    float _896 = _748 * _640;
    float _898 = _750 * _640;
    float2 _3916 = float2(_876, _892);
    float _900 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3916, float2(0.0), isnan(_3916)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3916, float2(0.0), isnan(_3916)), level(0.0)).x;
    float _902 = _778 * _640;
    float2 _3927 = float2(_880, _896);
    float _904 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3927, float2(0.0), isnan(_3927)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3927, float2(0.0), isnan(_3927)), level(0.0)).x;
    float2 _3935 = float2(_894, _898);
    float _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3935, float2(0.0), isnan(_3935)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3935, float2(0.0), isnan(_3935)), level(0.0)).x;
    float _908 = _752 * _640;
    float2 _3946 = float2(_902, _908);
    float _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3946, float2(0.0), isnan(_3946)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3946, float2(0.0), isnan(_3946)), level(0.0)).x;
    float _912 = -_574;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _916 = -_576;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _920 = -_582;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _924 = in.m_47.x;
    float _926 = in.m_47.y;
    float _928 = _914 * _914;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_194));
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_208));
    float _934 = fma(_918, _918, _928);
    bool _936 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _944 = _940 || _942;
    float _946 = fma(_922, _922, _934);
    float _948 = sqrt(_946);
    float _950 = _926 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _952 = _924 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _954 = _356 * _950;
    float _956 = _546 * _948;
    float _958 = _356 * _952;
    float _960 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _962 = _580 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _964 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _966 = _956 * _960;
    float _968 = _956 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _970 = _968 * 0.5;
    float _972 = _956 * _964;
    float _974 = _930 * _966;
    float _976 = _932 * _972;
    float _978 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _980 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _984 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _980);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _982);
    float _990 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _992 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[25].z, _988);
    float _996 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _998 = _992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1000 = _994 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1002 = _482 + _996;
    float _1004 = _470 + _998;
    float _1006 = _468 + _1000;
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1010 = _1002 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1014 = _1004 + _1012;
    float _1016 = _1010 * _1010;
    float _1018 = fma(_1014, _1014, _1016);
    float _1020 = sqrt(_1018);
    float _1022 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _962);
    bool _1024 = _1020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _1000;
    float _1028 = _970;
    float _1030 = _1006;
    if (!_1024)
    {
        _1026 = _1004;
    }
    float _1032 = _1026;
    float _1034 = _1032;
    if (!_1024)
    {
        _1028 = _1002;
    }
    float _1036 = _1028;
    bool _1038 = !_1024;
    float _1040 = _1036;
    if (!_1038)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1046 = _1020 + _1044;
        float _1048 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = rsqrt(_1018);
        float _1052 = _1046 * _1042;
        float _1054 = _1052 * 0.15915493667125701904296875;
        float _1056 = _1054 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        float _1064 = _1058 + (-1.0);
        float _1066 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = fma(_1062, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1070 = fma(_1006, _1058, _1066);
        float _1072 = _1050 * _1068;
        float _1074 = fma(_1014, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1076 = fma(_1010, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1034 = _1074;
        _1030 = _1070;
        _1040 = _1076;
    }
    float _1078 = _1034;
    float _1080 = _1030;
    float _1082 = _1040;
    float _1084 = fma(_594, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1022);
    float _1086 = -_576;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1090 = -_574;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1094 = -_582;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1100 = _1092;
    float _1102 = _1088;
    float _1104 = _1096;
    if (!_944)
    {
        float _1106 = _590 * _590;
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1110 = -_482;
        float _1112 = _1110 + _1082;
        float _1114 = -_470;
        float _1116 = _1114 + _1078;
        float _1118 = fma(_598, _598, _1106);
        float _1120 = -_468;
        float _1122 = _1120 + _1080;
        float _1124 = fma(_604, _604, _1118);
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1128 = sqrt(_1124);
        float _1130 = 1.0 / _956;
        float _1132 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1134 = precise::min(_1128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1136 = _1134 * _1108;
        float _1138 = _1136 * _1130;
        float _1140 = _1132 * _1138;
        float _1142 = _1112 * _1138;
        float _1144 = fma(_1116, _1140, _586);
        float _1146 = fma(_1122, _1140, _580);
        float _1148 = fma(_1132, _1142, _594);
        _1100 = _1146;
        _1102 = _1144;
        _1104 = _1148;
    }
    float _1150 = _1100;
    float _1152 = _1102;
    float _1154 = _1104;
    float _1156 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1160 = _1098 + _634;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1156);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1158);
    float _1168 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1170 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1166);
    float _1176 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1168);
    float _1178 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1184 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1190 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1192 = _1160 * _640;
    float _1194 = _1192 * 0.5;
    float _1196 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1188);
    float _1200 = _1180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1190);
    float _1204 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1198);
    float _1208 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1214 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1218 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1216);
    float _1220 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1224 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1222);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1214);
    float _1232 = 1.0 / _1218;
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1238 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1236);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1246 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1244);
    float _1248 = _1226 + _1228;
    out.gl_Position.x = _1230;
    out.gl_Position.y = _1234;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1228;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1252 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1250);
    float _1254 = 1.0 / _1224;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1262 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1260);
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1266 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1264);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1270 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1268);
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1274 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1272);
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1278 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1276);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1282 = _1232 * _1280;
    float _1284 = 1.0 / _1252;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1292 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1290);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1296 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1294);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1300 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1304 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1302);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1308 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1306);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1312 = -_1282;
    float _1314 = fma(_1254, _1310, _1312);
    float _1316 = 1.0 / _1238;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1320 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1324 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1322);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1328 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1326);
    bool _1330 = _1314 >= 0.0;
    bool _1332 = isnan(_1314);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan(0.0);
    bool _1338 = _1334 || _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1342 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1340);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1346 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1344);
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1350 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1348);
    float _1352 = 1.0 / _1242;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1356 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1354);
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1360 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1358);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1364 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1362);
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1368 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1366);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1372 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1370);
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1376 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1374);
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1380 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1378);
    float _1382 = 1.0 / _1246;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1386 = -_1282;
    float _1388 = fma(_1316, _1384, _1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1392 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1390);
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1396 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1394);
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1400 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1398);
    float _1402 = _1248 * 0.5;
    bool _1404 = _1388 >= 0.0;
    bool _1406 = isnan(_1388);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan(0.0);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1418 = -_1282;
    float _1420 = fma(_1352, _1416, _1418);
    bool _1422 = !_1338;
    float _1424 = _1422 ? 0.0 : 2.0;
    float _1426 = 1.0 / _1262;
    out.m_55.z = _1402;
    out.m_55.w = _1228;
    bool _1428 = _1420 >= 0.0;
    bool _1430 = isnan(_1420);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = _1424 + _1414;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1442 = -_1282;
    float _1444 = fma(_1382, _1440, _1442);
    bool _1446 = !_1436;
    float _1448 = _1446 ? 0.0 : 2.0;
    float _1450 = 1.0 / _1270;
    bool _1452 = _1444 >= 0.0;
    bool _1454 = isnan(_1444);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan(0.0);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1438 + _1448;
    float _1466 = 1.0 / _1258;
    float _1468 = _1464 + _1462;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1472 = -_1282;
    float _1474 = fma(_1284, _1470, _1472);
    bool _1476 = _1474 >= 0.0;
    bool _1478 = isnan(_1474);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = 1.0 / _1278;
    float _1490 = _1468 + _1486;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1494 = -_1282;
    float _1496 = fma(_1426, _1492, _1494);
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1500 = -_1282;
    float _1502 = fma(_1466, _1498, _1500);
    float _1504 = 1.0 / _1296;
    bool _1506 = _1496 >= 0.0;
    bool _1508 = isnan(_1496);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    bool _1516 = _1502 >= 0.0;
    bool _1518 = isnan(_1502);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = float(_1524);
    bool _1528 = !_1514;
    float _1530 = _1528 ? 0.0 : 2.0;
    float _1532 = 1.0 / _1266;
    float _1534 = _1490 + _1530;
    float _1536 = _1534 + _1526;
    float _1538 = 1.0 / _1300;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1542 = -_1282;
    float _1544 = fma(_1532, _1540, _1542);
    float _1546 = 1.0 / _1308;
    bool _1548 = _1544 >= 0.0;
    bool _1550 = isnan(_1544);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1560 = -_1282;
    float _1562 = fma(_1450, _1558, _1560);
    float _1564 = 1.0 / _1274;
    bool _1566 = _1562 >= 0.0;
    bool _1568 = isnan(_1562);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    bool _1576 = !_1556;
    float _1578 = _1576 ? 0.0 : 2.0;
    bool _1580 = !_1574;
    float _1582 = _1580 ? 0.0 : 2.0;
    float _1584 = 1.0 / _1342;
    float _1586 = _1536 + _1578;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1590 = -_1282;
    float _1592 = fma(_1504, _1588, _1590);
    float _1594 = _1586 + _1582;
    bool _1596 = _1592 >= 0.0;
    bool _1598 = isnan(_1592);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.0);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1610 = -_1282;
    float _1612 = fma(_1564, _1608, _1610);
    float _1614 = 1.0 / _1350;
    bool _1616 = _1612 >= 0.0;
    bool _1618 = isnan(_1612);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = 1.0 / _1288;
    float _1630 = _1594 + _1626;
    float _1632 = 1.0 / _1396;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = -_1282;
    float _1638 = fma(_1628, _1634, _1636);
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1642 = -_1282;
    float _1644 = fma(_1488, _1640, _1642);
    float _1646 = 1.0 / _1400;
    bool _1648 = _1638 >= 0.0;
    bool _1650 = isnan(_1638);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan(0.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = _1644 >= 0.0;
    bool _1660 = isnan(_1644);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan(0.0);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    bool _1670 = !_1656;
    float _1672 = _1670 ? 0.0 : 2.0;
    float _1674 = 1.0 / _1292;
    float _1676 = _1630 + _1672;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1680 = -_1282;
    float _1682 = fma(_1538, _1678, _1680);
    float _1684 = _1676 + _1668;
    bool _1686 = _1682 >= 0.0;
    bool _1688 = isnan(_1682);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan(0.0);
    bool _1694 = _1690 || _1692;
    float _1696 = _1684 + _1606;
    bool _1698 = !_1694;
    float _1700 = _1698 ? 0.0 : 2.0;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1704 = -_1282;
    float _1706 = fma(_1674, _1702, _1704);
    float _1708 = _1696 + _1700;
    bool _1710 = _1706 >= 0.0;
    bool _1712 = isnan(_1706);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan(0.0);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = 1.0 / _1304;
    float _1724 = _1708 + _1720;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1728 = -_1282;
    float _1730 = fma(_1722, _1726, _1728);
    float _1732 = 1.0 / _1320;
    bool _1734 = _1730 >= 0.0;
    bool _1736 = isnan(_1730);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1746 = -_1282;
    float _1748 = fma(_1546, _1744, _1746);
    bool _1750 = _1748 >= 0.0;
    bool _1752 = isnan(_1748);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan(0.0);
    bool _1758 = _1754 || _1756;
    bool _1760 = !_1742;
    float _1762 = _1760 ? 0.0 : 2.0;
    bool _1764 = !_1758;
    float _1766 = _1764 ? 0.0 : 2.0;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1770 = -_1282;
    float _1772 = fma(_1732, _1768, _1770);
    float _1774 = _1724 + _1762;
    bool _1776 = _1772 >= 0.0;
    bool _1778 = isnan(_1772);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1774 + _1766;
    float _1790 = 1.0 / _1324;
    float _1792 = _1788 + _1786;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1796 = -_1282;
    float _1798 = fma(_1790, _1794, _1796);
    float _1800 = 1.0 / _1328;
    bool _1802 = _1798 >= 0.0;
    bool _1804 = isnan(_1798);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = !_1810;
    float _1814 = _1812 ? 0.0 : 2.0;
    float _1816 = _1792 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1820 = -_1282;
    float _1822 = fma(_1584, _1818, _1820);
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1826 = -_1282;
    float _1828 = fma(_1800, _1824, _1826);
    bool _1830 = _1822 >= 0.0;
    bool _1832 = isnan(_1822);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(0.0);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    bool _1842 = _1828 >= 0.0;
    bool _1844 = isnan(_1828);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    float _1852 = float(_1850);
    float _1854 = 1.0 / _1346;
    float _1856 = _1816 + _1852;
    float _1858 = _1856 + _1840;
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1862 = -_1282;
    float _1864 = fma(_1614, _1860, _1862);
    bool _1866 = _1864 >= 0.0;
    bool _1868 = isnan(_1864);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan(0.0);
    bool _1874 = _1870 || _1872;
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1878 = -_1282;
    float _1880 = fma(_1854, _1876, _1878);
    bool _1882 = !_1874;
    float _1884 = _1882 ? 0.0 : 2.0;
    bool _1886 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1888 = isnan(0.5);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1894 = _1890 || _1892;
    bool _1896 = _1880 >= 0.0;
    bool _1898 = isnan(_1880);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan(0.0);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = _1858 + _1884;
    float _1910 = 1.0 / _1356;
    float _1912 = _1908 + _1906;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1916 = -_1282;
    float _1918 = fma(_1910, _1914, _1916);
    float _1920 = 1.0 / _1360;
    bool _1922 = _1918 >= 0.0;
    bool _1924 = isnan(_1918);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1934 = -_1282;
    float _1936 = fma(_1920, _1932, _1934);
    float _1938 = 1.0 / _1364;
    bool _1940 = _1936 >= 0.0;
    bool _1942 = isnan(_1936);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1952 = -_1282;
    float _1954 = fma(_1938, _1950, _1952);
    float _1956 = 1.0 / _1368;
    bool _1958 = _1954 >= 0.0;
    bool _1960 = isnan(_1954);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan(0.0);
    bool _1966 = _1962 || _1964;
    float _1968 = _1954;
    float _1970 = _1426;
    float _1972 = _1292;
    float _1974 = _1606;
    if (!_1894)
    {
        float _1976 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _1968 = _1976;
    }
    float _1978 = _1968;
    if (!_1894)
    {
        float _1980 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _176 = _1980;
    }
    float _1982 = _176;
    float _1984 = _1982;
    if (!_1894)
    {
        float _1986 = _1978 * 0.15915493667125701904296875;
        _1970 = _1986;
    }
    float _1988 = _1970;
    if (!_1894)
    {
        float _1990 = _1982 * 0.15915493667125701904296875;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (!_1894)
    {
        float _1994 = _1988 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        _1972 = _1996;
    }
    float _1998 = _1972;
    float _2000 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2002 = -_1282;
    float _2004 = fma(_1956, _2000, _2002);
    float _2006 = 1.0 / _1372;
    bool _2008 = _2004 >= 0.0;
    bool _2010 = isnan(_2004);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan(0.0);
    bool _2016 = _2012 || _2014;
    bool _2018 = !_1948;
    float _2020 = _2018 ? 0.0 : 3.0;
    if (!_1894)
    {
        float _2022 = _1988 * 6.283185482025146484375;
        float _2024 = sin(_2022);
        _1974 = _2024;
    }
    float _2026 = _1974;
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2030 = -_1282;
    float _2032 = fma(_2006, _2028, _2030);
    float _2034 = _1258;
    float _2036 = _2026;
    if (!_1894)
    {
        float _2038 = 1.0 / _1998;
        _2034 = _2038;
    }
    float _2040 = _2034;
    bool _2042 = !_1966;
    float _2044 = _2042 ? 0.0 : 3.0;
    bool _2046 = _2032 >= 0.0;
    bool _2048 = isnan(_2032);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    float _2056 = _2020 + _2044;
    bool _2058 = !_1930;
    float _2060 = _2058 ? 0.0 : 2.0;
    float _2062 = _1320;
    if (!_1894)
    {
        float _2064 = _1992 * 6.283185482025146484375;
        float _2066 = cos(_2064);
        _2062 = _2066;
    }
    float _2068 = _2062;
    bool _2070 = !_2016;
    float _2072 = _2070 ? 0.0 : 3.0;
    float _2074 = _1912 + _2060;
    float _2076 = _2056 + _2072;
    float _2078 = 1.0 / _1376;
    float _2080 = _2040;
    if (!_1894)
    {
        float _2082 = _2026 * _2040;
        _2036 = _2082;
    }
    float _2084 = _2036;
    float _2086 = _2074 * 0.02857142873108386993408203125;
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    if (!_1894)
    {
        float _2090 = _1992 * 6.283185482025146484375;
        float _2092 = sin(_2090);
        _2080 = _2092;
    }
    float _2094 = _2080;
    float _2096 = _2068;
    float _2098 = _2094;
    if (!_1894)
    {
        float _2100 = _2068 * _2084;
        _2096 = _2100;
    }
    float _2102 = _2096;
    bool _2104 = !_2054;
    float _2106 = _2104 ? 0.0 : 3.0;
    float _2108 = _2076 + _2106;
    float _2110 = 1.0 / _1380;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2114 = -_1282;
    float _2116 = fma(_2078, _2112, _2114);
    bool _2118 = _2116 >= 0.0;
    bool _2120 = isnan(_2116);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(0.0);
    bool _2126 = _2122 || _2124;
    float _2128 = 1.0 / _1392;
    bool _2130 = !_2126;
    float _2132 = _2130 ? 0.0 : 3.0;
    float _2134 = _2108 + _2132;
    float _2136 = _1998;
    if (!_1894)
    {
        float _2138 = 1.0 / _2102;
        _2136 = _2138;
    }
    float _2140 = _2136;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2144 = -_1282;
    float _2146 = fma(_2110, _2142, _2144);
    bool _2148 = _2146 >= 0.0;
    bool _2150 = isnan(_2146);
    bool _2152 = _2148 || _2150;
    bool _2154 = isnan(0.0);
    bool _2156 = _2152 || _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2160 = -_1282;
    float _2162 = fma(_1632, _2158, _2160);
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2166 = -_1282;
    float _2168 = fma(_2128, _2164, _2166);
    bool _2170 = !_2156;
    float _2172 = _2170 ? 0.0 : 3.0;
    bool _2174 = _2162 >= 0.0;
    bool _2176 = isnan(_2162);
    bool _2178 = _2174 || _2176;
    bool _2180 = isnan(0.0);
    bool _2182 = _2178 || _2180;
    bool _2184 = _2168 >= 0.0;
    bool _2186 = isnan(_2168);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = _2134 + _2172;
    float _2196 = _2168;
    float _2198 = _2162;
    if (!_1894)
    {
        float _2200 = _2094 * _2140;
        _2098 = _2200;
    }
    float _2202 = _2098;
    float _2204 = _2202;
    if (!_1894)
    {
        _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2206 = _2196;
    bool _2208 = !_2192;
    float _2210 = _2208 ? 0.0 : 3.0;
    float _2212 = _2206;
    if (!_1894)
    {
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2216 = fma(_1282, _2202, _2214);
        _2204 = _2216;
    }
    float _2218 = _2204;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2222 = -_1282;
    float _2224 = fma(_1646, _2220, _2222);
    if (!_1894)
    {
        float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2228 = _2206 + _2226;
        _2212 = _2228;
    }
    float _2230 = _2212;
    bool _2232 = !_2182;
    float _2234 = _2232 ? 0.0 : 3.0;
    float _2236 = _2194 + _2210;
    if (_1894)
    {
        _2198 = 1.0;
    }
    float _2238 = _2198;
    float _2240 = _2140;
    float _2242 = _2238;
    if (!_1894)
    {
        float _2244 = 1.0 / _2230;
        _2240 = _2244;
    }
    float _2246 = _2240;
    bool _2248 = _2224 >= 0.0;
    bool _2250 = isnan(_2224);
    bool _2252 = _2248 || _2250;
    bool _2254 = isnan(0.0);
    bool _2256 = _2252 || _2254;
    float _2258 = _2236 + _2234;
    bool _2260 = !_2256;
    float _2262 = _2260 ? 0.0 : 5.0;
    float _2264 = _2258 + _2262;
    float _2266 = _2264 * 0.14285714924335479736328125;
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    if (!_1894)
    {
        float _2270 = _2218 * _2246;
        float _2272 = precise::clamp(_2270, 0.0, 1.0);
        _2242 = _2272;
    }
    float _2274 = _2242;
    float _2276 = _2088 * _2268;
    bool _2278 = _2274 > 0.0;
    bool _2280 = isnan(_2274);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan(0.0);
    bool _2286 = _2282 || _2284;
    float _2288 = _2276 * _2274;
    float _2290 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2292 = _356 * _2290;
    float _2294 = _2292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2294;
    if (_2286)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2296 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2296;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

