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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_67 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _608 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1079 = as_type<float>(_104);
        out.gl_Position.z = _1079;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1148 = as_type<float>(_140);
        out.gl_Position.z = _1148;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.x;
    float _144 = in.m_51.y;
    float _146 = in.m_51.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = in.m_53.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_51.w;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _182 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _150);
    float _188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _152);
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _154);
    float _194 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _196 = _154;
    float _198 = _188;
    if (!_164)
    {
        float _200 = _148 * _148;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _190 * _188;
    float _208 = _204;
    if (!_164)
    {
        _198 = _148;
    }
    float _210 = _198;
    float _212 = _194 * _186;
    float _214 = _210;
    float _216 = _212;
    if (!_164)
    {
        float _218 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _218;
    }
    float _220 = _208;
    bool _222 = !_164;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _148 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _148);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_164;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _148 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _214 = _278;
    }
    float _280 = _214;
    float _282 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _290 = fma(_280, _170, _282);
    float _292 = fma(_280, _168, _284);
    float _294 = fma(_280, _172, _286);
    float _296 = fma(_290, _166, _176);
    float _298 = fma(_292, _166, _174);
    float _300 = _206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _302 = _206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = fma(_294, _166, _178);
    float _310 = _288 * _192;
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _316 = _314 != 0;
    float _318 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _300);
    float _320 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _302);
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _318);
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _320);
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _326 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _340 = in.m_55.x;
    float _342 = _332 + _334;
    float _344 = _206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _346 = _338 + _336;
    float _348 = _332;
    float _350 = _342;
    float _352 = _346;
    if (_316)
    {
        float _354 = in.m_57.x;
        _348 = _354;
    }
    float _356 = _348;
    float _358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _360 = _342 + _358;
    float _362 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _344);
    float _364 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _366 = _346 + _364;
    float _368 = in.m_57.y;
    float _370 = _360 * _360;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    float _376 = _366 * _366;
    float _378 = in.m_55.y;
    float _380 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _362);
    float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _384 = _370 + _376;
    float _386 = _380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _388 = sqrt(_384);
    float _390 = _340;
    float _392 = _384;
    if (_316)
    {
        _216 = _340;
    }
    float _394 = _216;
    bool _396 = _356 > 0.5;
    bool _398 = _396 && _316;
    float _400 = _296 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _402 = _368 > 0.5;
    float _404 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _406 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    bool _408 = _388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = -_378;
    float _414 = _412 + 1.0;
    float _416 = _406 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = _394;
    float _420 = _378;
    float _422 = _416;
    float _424 = _414;
    if (_398)
    {
        float _426 = -_394;
        float _428 = _426 + 1.0;
        _418 = _428;
    }
    float _430 = _418;
    float _432 = _416 + _386;
    float _434 = _430;
    if (_374)
    {
        float _436 = _402 ? _414 : _378;
        _420 = _436;
    }
    float _438 = _420;
    if (_316)
    {
        _390 = _430;
    }
    float _440 = _390;
    if (!_408)
    {
        _422 = _376;
    }
    float _442 = _422;
    float _444 = _442;
    if (!_408)
    {
        _424 = _370;
    }
    float _446 = _424;
    float _448 = _446;
    if (!_408)
    {
        _434 = _432;
    }
    float _450 = _434;
    bool _452 = !_408;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _388 + _458;
        float _462 = rsqrt(_384);
        float _464 = _460 * _456;
        float _466 = _432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _468 = _464 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = cos(_474);
        float _478 = fma(_472, _466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _462 * _478;
        float _482 = _476 + (-1.0);
        float _484 = fma(_360, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_366, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _488 = _482 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _492 = _484 + _490;
        float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _496 = _486 + _494;
        float _498 = fma(_432, _476, _488);
        float _500 = _492 * _492;
        float _502 = _496 * _496;
        _454 = _498;
        _448 = _500;
        _444 = _502;
        _350 = _484;
        _352 = _486;
    }
    float _504 = _454;
    float _506 = _448;
    float _508 = _444;
    float _510 = _350;
    float _512 = _352;
    float _514 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _516 = _504 + _514;
    float _518 = _440 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _520 = _438 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _522 = fma(_516, _516, _506);
    float _524 = _518 * _382;
    float _526 = _520 * _410;
    float _528 = _522 + _508;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _534 = sqrt(_528);
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _544 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _550 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _524;
    out.m_59.y = _526;
    bool _558 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _560 = isnan(_534);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _566 = _562 || _564;
    out.m_61.x = _550;
    out.m_61.y = _552;
    out.m_61.z = _554;
    out.m_61.w = _548;
    out.m_63.x = _544;
    out.m_63.y = _546;
    out.m_63.z = _556;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _568 = _542;
    float _570 = _552;
    float _572 = _544;
    if (!_566)
    {
        _568 = 1.0;
    }
    float _574 = _568;
    bool _576 = !_566;
    float _578 = _574;
    if (!_576)
    {
        bool _580 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _582 = isnan(_534);
        bool _584 = _580 || _582;
        bool _586 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _588 = _584 || _586;
        if (!_588)
        {
            float _590 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _592 = _534 + _590;
            float _594 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _596 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _594;
            float _598 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _600 = _598 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _602 = 1.0 / _596;
            float _604 = _592 * _602;
            float _606 = fma(_604, _600, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _578 = _606;
            _608 = true;
        }
        else
        {
            bool _610 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _612 = isnan(_534);
            bool _614 = _610 || _612;
            bool _616 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _618 = _614 || _616;
            if (!_618)
            {
                float _620 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _622 = _534 + _620;
                float _624 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _626 = _624 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _628 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _630 = _628 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _632 = 1.0 / _626;
                float _634 = _622 * _632;
                float _636 = fma(_634, _630, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _578 = _636;
                _608 = true;
            }
            else
            {
                _578 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _608 = false;
    float _638 = _578;
    float _640 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _642 = _504 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _646 = _510 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _650 = _512 + _648;
    float _652 = fma(_642, _638, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _654 = fma(_646, _638, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _656 = fma(_650, _638, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _660 = _652 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _654 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _668 = _656 + _666;
    float _670 = _660 * _660;
    float _672 = fma(_664, _664, _670);
    float _674 = fma(_668, _668, _672);
    float _676 = rsqrt(_674);
    float _678 = sqrt(_674);
    float _680 = _676 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _682 = _664 * _680;
    float _684 = _668 * _680;
    float _686 = _682 * _682;
    float _688 = _684 * _684;
    float _690 = _686 + _688;
    float _692 = sqrt(_690);
    bool _694 = _692 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _698 = _692 + _696;
    float _700 = _668;
    float _702 = _698;
    float _704 = _660;
    float _706 = _682;
    if (_694)
    {
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _700 = _708;
    }
    float _710 = _700;
    if (_694)
    {
        float _712 = rsqrt(_690);
        _570 = _712;
    }
    float _714 = _570;
    float _716 = _714;
    if (_694)
    {
        float _718 = _698 * _710;
        _702 = _718;
    }
    float _720 = _702;
    if (_694)
    {
        float _722 = _720 * 0.15915493667125701904296875;
        _572 = _722;
    }
    float _724 = _572;
    float _726 = _676;
    if (_694)
    {
        float _728 = _724 * 6.283185482025146484375;
        float _730 = sin(_728);
        _726 = _730;
    }
    float _732 = _726;
    float _734 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _736 = precise::max(0.0, _734);
    float _738 = _710;
    float _740 = _736;
    if (_694)
    {
        float _742 = _724 * 6.283185482025146484375;
        float _744 = cos(_742);
        _738 = _744;
    }
    float _746 = _738;
    float _748 = -_680;
    float _750 = -_736;
    float _752 = fma(_660, _748, _750);
    float _754 = _752;
    if (_694)
    {
        float _756 = _752 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _704 = _756;
    }
    float _758 = _704;
    float _760 = _758;
    float _762 = _732;
    if (_694)
    {
        float _764 = fma(_732, _758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _760 = _764;
    }
    float _766 = _760;
    float _768 = _766;
    if (!_694)
    {
        _762 = _684;
    }
    float _770 = _762;
    float _772 = _770;
    if (_694)
    {
        float _774 = _746 + (-1.0);
        _740 = _774;
    }
    float _776 = _740;
    float _778 = _776;
    if (_694)
    {
        float _780 = _714 * _766;
        _392 = _780;
    }
    float _782 = _392;
    if (!_694)
    {
        _768 = _688;
    }
    float _784 = _768;
    float _786 = _784;
    if (_694)
    {
        float _788 = _776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _716 = _788;
    }
    float _790 = _716;
    if (_694)
    {
        float _792 = _682 * _782;
        _706 = _792;
    }
    float _794 = _706;
    if (!_694)
    {
        _778 = _686;
    }
    float _796 = _778;
    float _798 = _796;
    if (_694)
    {
        float _800 = _684 * _782;
        _772 = _800;
    }
    float _802 = _772;
    if (_694)
    {
        float _804 = fma(_752, _746, _790);
        _754 = _804;
    }
    float _806 = _754;
    if (_694)
    {
        float _808 = _794 * _794;
        _798 = _808;
    }
    float _810 = _798;
    if (_694)
    {
        float _812 = _802 * _802;
        _786 = _812;
    }
    float _814 = _786;
    float _816 = fma(_806, _806, _810);
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _820 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _818);
    float _822 = precise::clamp(_820, 0.0, 1.0);
    float _824 = _652 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _826 = _816 + _814;
    float _828 = _652 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _830 = -_822;
    float _832 = _830 + 1.0;
    float _834 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[0].x, _824);
    float _836 = rsqrt(_826);
    float _838 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[2].x, _828);
    float _840 = _652 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _842 = _652 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _844 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[0].z, _834);
    float _846 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[2].z, _838);
    float _848 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[1].x, _840);
    float _850 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[3].x, _842);
    float _852 = abs(_832);
    float _854 = log2(_852);
    float _856 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _858 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[1].z, _848);
    float _860 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _862 = _846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _864 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _866 = _858 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _868 = _860 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _870 = _836 * _794;
    float _872 = _836 * _806;
    float _874 = _866 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _876 = _862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _878 = _870 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _880 = _836 * _802;
    float _882 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[7].x, _874);
    float _884 = -_876;
    float _886 = fma(_884, _864, 1.0);
    float _888 = -_878;
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _888);
    float _892 = _854 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _894 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _882);
    float _896 = _866 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _898 = -_880;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _890);
    float _902 = log2(_886);
    float _904 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[7].w, _894);
    float _906 = _866 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _908 = fma(_900, -0.5, 0.5);
    float _910 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[4].x, _896);
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[5].x, _906);
    float _914 = 1.0 / _904;
    float _916 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _910);
    float _918 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _912);
    float _920 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[4].w, _916);
    float _922 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[5].w, _918);
    float _924 = exp2(_892);
    float _926 = _902 * 0.693147182464599609375;
    float _928 = _926 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _930 = sqrt(_908);
    float _932 = fma(_900, 0.5, 0.5);
    float _934 = _872 + 1.0;
    float _936 = _920 * _914;
    float _938 = _922 * _914;
    float _940 = fma(_932, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _942 = fma(_936, 0.5, 0.5);
    float _944 = -_872;
    float _946 = fma(_924, _934, _944);
    float _948 = fma(_932, _940, -0.212114393711090087890625);
    float _950 = fma(_938, -0.5, 0.5);
    float _952 = fma(_946, 0.5, 0.5);
    float _954 = fma(_932, _948, 1.570728778839111328125);
    float _956 = _930 * 0.636619746685028076171875;
    float3 _2529 = float3(_942, _950, _928);
    float _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2529, float3(0.0), isnan(_2529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2529, float3(0.0), isnan(_2529)), level(0.0)).x;
    float _960 = -_954;
    float _962 = fma(_956, _960, 1.0);
    float3 _2545 = float3(_942, _950, _928);
    float4 _965 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2545, float3(0.0), isnan(_2545)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2545, float3(0.0), isnan(_2545)), level(0.0)).xyzw;
    float _967 = _965.x;
    float _969 = _965.y;
    float _971 = _965.z;
    float _973 = _965.w;
    float2 _2562 = float2(_962, _952);
    float3 _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2562, float2(0.0), isnan(_2562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2562, float2(0.0), isnan(_2562)), level(0.0)).xyz;
    float _979 = _977.x;
    float _981 = _977.y;
    float _983 = _977.z;
    float _985 = _854 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _987 = _866 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _989 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[6].x, _987);
    float _991 = exp2(_985);
    float _993 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _989);
    float _995 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[6].w, _993);
    out.gl_Position.x = _920;
    out.gl_Position.y = _922;
    out.gl_Position.z = _995;
    out.gl_Position.w = _904;
    float _997 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _999 = -_991;
    float _1001 = _999 + 1.0;
    out.m_67.w = _997;
    float _1003 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1005 = -_1003;
    float _1007 = _1005 + 1.0;
    float _1009 = _1003 * _958;
    float _1011 = _973 * _1009;
    float _1013 = _973 * _1007;
    float _1015 = _983 * _1009;
    float _1017 = fma(_979, _1011, _967);
    float _1019 = fma(_981, _1011, _969);
    float _1021 = fma(_973, _1015, _971);
    out.m_69.x = _1017;
    out.m_69.y = _1019;
    out.m_69.z = _1021;
    out.m_69.w = _1013;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _608 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1079 = as_type<float>(_104);
        out.gl_Position.z = _1079;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1148 = as_type<float>(_140);
        out.gl_Position.z = _1148;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_51.x;
    float _144 = in.m_51.y;
    float _146 = in.m_51.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = in.m_53.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_51.w;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _182 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _150);
    float _188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _152);
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _154);
    float _194 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _196 = _154;
    float _198 = _188;
    if (!_164)
    {
        float _200 = _148 * _148;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _190 * _188;
    float _208 = _204;
    if (!_164)
    {
        _198 = _148;
    }
    float _210 = _198;
    float _212 = _194 * _186;
    float _214 = _210;
    float _216 = _212;
    if (!_164)
    {
        float _218 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _218;
    }
    float _220 = _208;
    bool _222 = !_164;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _148 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _148);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_164;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _148 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _214 = _278;
    }
    float _280 = _214;
    float _282 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _290 = fma(_280, _170, _282);
    float _292 = fma(_280, _168, _284);
    float _294 = fma(_280, _172, _286);
    float _296 = fma(_290, _166, _176);
    float _298 = fma(_292, _166, _174);
    float _300 = _206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _302 = _206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = fma(_294, _166, _178);
    float _310 = _288 * _192;
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _316 = _314 != 0;
    float _318 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _300);
    float _320 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _302);
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _318);
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _320);
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _326 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _340 = in.m_55.x;
    float _342 = _332 + _334;
    float _344 = _206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _346 = _338 + _336;
    float _348 = _332;
    float _350 = _342;
    float _352 = _346;
    if (_316)
    {
        float _354 = in.m_57.x;
        _348 = _354;
    }
    float _356 = _348;
    float _358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _360 = _342 + _358;
    float _362 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _344);
    float _364 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _366 = _346 + _364;
    float _368 = in.m_57.y;
    float _370 = _360 * _360;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    float _376 = _366 * _366;
    float _378 = in.m_55.y;
    float _380 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _362);
    float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _384 = _370 + _376;
    float _386 = _380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _388 = sqrt(_384);
    float _390 = _340;
    float _392 = _384;
    if (_316)
    {
        _216 = _340;
    }
    float _394 = _216;
    bool _396 = _356 > 0.5;
    bool _398 = _396 && _316;
    float _400 = _296 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _402 = _368 > 0.5;
    float _404 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _406 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    bool _408 = _388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = -_378;
    float _414 = _412 + 1.0;
    float _416 = _406 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = _394;
    float _420 = _378;
    float _422 = _416;
    float _424 = _414;
    if (_398)
    {
        float _426 = -_394;
        float _428 = _426 + 1.0;
        _418 = _428;
    }
    float _430 = _418;
    float _432 = _416 + _386;
    float _434 = _430;
    if (_374)
    {
        float _436 = _402 ? _414 : _378;
        _420 = _436;
    }
    float _438 = _420;
    if (_316)
    {
        _390 = _430;
    }
    float _440 = _390;
    if (!_408)
    {
        _422 = _376;
    }
    float _442 = _422;
    float _444 = _442;
    if (!_408)
    {
        _424 = _370;
    }
    float _446 = _424;
    float _448 = _446;
    if (!_408)
    {
        _434 = _432;
    }
    float _450 = _434;
    bool _452 = !_408;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _388 + _458;
        float _462 = rsqrt(_384);
        float _464 = _460 * _456;
        float _466 = _432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _468 = _464 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = cos(_474);
        float _478 = fma(_472, _466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _462 * _478;
        float _482 = _476 + (-1.0);
        float _484 = fma(_360, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_366, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _488 = _482 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _492 = _484 + _490;
        float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _496 = _486 + _494;
        float _498 = fma(_432, _476, _488);
        float _500 = _492 * _492;
        float _502 = _496 * _496;
        _454 = _498;
        _448 = _500;
        _444 = _502;
        _350 = _484;
        _352 = _486;
    }
    float _504 = _454;
    float _506 = _448;
    float _508 = _444;
    float _510 = _350;
    float _512 = _352;
    float _514 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _516 = _504 + _514;
    float _518 = _440 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _520 = _438 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _522 = fma(_516, _516, _506);
    float _524 = _518 * _382;
    float _526 = _520 * _410;
    float _528 = _522 + _508;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _534 = sqrt(_528);
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _544 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _550 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _524;
    out.m_59.y = _526;
    bool _558 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _560 = isnan(_534);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _566 = _562 || _564;
    out.m_61.x = _550;
    out.m_61.y = _552;
    out.m_61.z = _554;
    out.m_61.w = _548;
    out.m_63.x = _544;
    out.m_63.y = _546;
    out.m_63.z = _556;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _568 = _542;
    float _570 = _552;
    float _572 = _544;
    if (!_566)
    {
        _568 = 1.0;
    }
    float _574 = _568;
    bool _576 = !_566;
    float _578 = _574;
    if (!_576)
    {
        bool _580 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _582 = isnan(_534);
        bool _584 = _580 || _582;
        bool _586 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _588 = _584 || _586;
        if (!_588)
        {
            float _590 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _592 = _534 + _590;
            float _594 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _596 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _594;
            float _598 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _600 = _598 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _602 = 1.0 / _596;
            float _604 = _592 * _602;
            float _606 = fma(_604, _600, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _578 = _606;
            _608 = true;
        }
        else
        {
            bool _610 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _612 = isnan(_534);
            bool _614 = _610 || _612;
            bool _616 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _618 = _614 || _616;
            if (!_618)
            {
                float _620 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _622 = _534 + _620;
                float _624 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _626 = _624 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _628 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _630 = _628 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _632 = 1.0 / _626;
                float _634 = _622 * _632;
                float _636 = fma(_634, _630, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _578 = _636;
                _608 = true;
            }
            else
            {
                _578 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _608 = false;
    float _638 = _578;
    float _640 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _642 = _504 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _646 = _510 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _650 = _512 + _648;
    float _652 = fma(_642, _638, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _654 = fma(_646, _638, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _656 = fma(_650, _638, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _660 = _652 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _654 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _668 = _656 + _666;
    float _670 = _660 * _660;
    float _672 = fma(_664, _664, _670);
    float _674 = fma(_668, _668, _672);
    float _676 = rsqrt(_674);
    float _678 = sqrt(_674);
    float _680 = _676 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _682 = _664 * _680;
    float _684 = _668 * _680;
    float _686 = _682 * _682;
    float _688 = _684 * _684;
    float _690 = _686 + _688;
    float _692 = sqrt(_690);
    bool _694 = _692 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _698 = _692 + _696;
    float _700 = _668;
    float _702 = _698;
    float _704 = _660;
    float _706 = _682;
    if (_694)
    {
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _700 = _708;
    }
    float _710 = _700;
    if (_694)
    {
        float _712 = rsqrt(_690);
        _570 = _712;
    }
    float _714 = _570;
    float _716 = _714;
    if (_694)
    {
        float _718 = _698 * _710;
        _702 = _718;
    }
    float _720 = _702;
    if (_694)
    {
        float _722 = _720 * 0.15915493667125701904296875;
        _572 = _722;
    }
    float _724 = _572;
    float _726 = _676;
    if (_694)
    {
        float _728 = _724 * 6.283185482025146484375;
        float _730 = sin(_728);
        _726 = _730;
    }
    float _732 = _726;
    float _734 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _736 = precise::max(0.0, _734);
    float _738 = _710;
    float _740 = _736;
    if (_694)
    {
        float _742 = _724 * 6.283185482025146484375;
        float _744 = cos(_742);
        _738 = _744;
    }
    float _746 = _738;
    float _748 = -_680;
    float _750 = -_736;
    float _752 = fma(_660, _748, _750);
    float _754 = _752;
    if (_694)
    {
        float _756 = _752 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _704 = _756;
    }
    float _758 = _704;
    float _760 = _758;
    float _762 = _732;
    if (_694)
    {
        float _764 = fma(_732, _758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _760 = _764;
    }
    float _766 = _760;
    float _768 = _766;
    if (!_694)
    {
        _762 = _684;
    }
    float _770 = _762;
    float _772 = _770;
    if (_694)
    {
        float _774 = _746 + (-1.0);
        _740 = _774;
    }
    float _776 = _740;
    float _778 = _776;
    if (_694)
    {
        float _780 = _714 * _766;
        _392 = _780;
    }
    float _782 = _392;
    if (!_694)
    {
        _768 = _688;
    }
    float _784 = _768;
    float _786 = _784;
    if (_694)
    {
        float _788 = _776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _716 = _788;
    }
    float _790 = _716;
    if (_694)
    {
        float _792 = _682 * _782;
        _706 = _792;
    }
    float _794 = _706;
    if (!_694)
    {
        _778 = _686;
    }
    float _796 = _778;
    float _798 = _796;
    if (_694)
    {
        float _800 = _684 * _782;
        _772 = _800;
    }
    float _802 = _772;
    if (_694)
    {
        float _804 = fma(_752, _746, _790);
        _754 = _804;
    }
    float _806 = _754;
    if (_694)
    {
        float _808 = _794 * _794;
        _798 = _808;
    }
    float _810 = _798;
    if (_694)
    {
        float _812 = _802 * _802;
        _786 = _812;
    }
    float _814 = _786;
    float _816 = fma(_806, _806, _810);
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _820 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _818);
    float _822 = precise::clamp(_820, 0.0, 1.0);
    float _824 = _652 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _826 = _816 + _814;
    float _828 = _652 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _830 = -_822;
    float _832 = _830 + 1.0;
    float _834 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[0].x, _824);
    float _836 = rsqrt(_826);
    float _838 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[2].x, _828);
    float _840 = _652 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _842 = _652 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _844 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[0].z, _834);
    float _846 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[2].z, _838);
    float _848 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[1].x, _840);
    float _850 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[3].x, _842);
    float _852 = abs(_832);
    float _854 = log2(_852);
    float _856 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _858 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[1].z, _848);
    float _860 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _862 = _846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _864 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _866 = _858 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _868 = _860 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _870 = _836 * _794;
    float _872 = _836 * _806;
    float _874 = _866 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _876 = _862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _878 = _870 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _880 = _836 * _802;
    float _882 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[7].x, _874);
    float _884 = -_876;
    float _886 = fma(_884, _864, 1.0);
    float _888 = -_878;
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _888);
    float _892 = _854 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _894 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _882);
    float _896 = _866 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _898 = -_880;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _890);
    float _902 = log2(_886);
    float _904 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[7].w, _894);
    float _906 = _866 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _908 = fma(_900, -0.5, 0.5);
    float _910 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[4].x, _896);
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[5].x, _906);
    float _914 = 1.0 / _904;
    float _916 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _910);
    float _918 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _912);
    float _920 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[4].w, _916);
    float _922 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[5].w, _918);
    float _924 = exp2(_892);
    float _926 = _902 * 0.693147182464599609375;
    float _928 = _926 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _930 = sqrt(_908);
    float _932 = fma(_900, 0.5, 0.5);
    float _934 = _872 + 1.0;
    float _936 = _920 * _914;
    float _938 = _922 * _914;
    float _940 = fma(_932, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _942 = fma(_936, 0.5, 0.5);
    float _944 = -_872;
    float _946 = fma(_924, _934, _944);
    float _948 = fma(_932, _940, -0.212114393711090087890625);
    float _950 = fma(_938, -0.5, 0.5);
    float _952 = fma(_946, 0.5, 0.5);
    float _954 = fma(_932, _948, 1.570728778839111328125);
    float _956 = _930 * 0.636619746685028076171875;
    float3 _2529 = float3(_942, _950, _928);
    float _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2529, float3(0.0), isnan(_2529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2529, float3(0.0), isnan(_2529)), level(0.0)).x;
    float _960 = -_954;
    float _962 = fma(_956, _960, 1.0);
    float3 _2545 = float3(_942, _950, _928);
    float4 _965 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2545, float3(0.0), isnan(_2545)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2545, float3(0.0), isnan(_2545)), level(0.0)).xyzw;
    float _967 = _965.x;
    float _969 = _965.y;
    float _971 = _965.z;
    float _973 = _965.w;
    float2 _2562 = float2(_962, _952);
    float3 _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2562, float2(0.0), isnan(_2562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2562, float2(0.0), isnan(_2562)), level(0.0)).xyz;
    float _979 = _977.x;
    float _981 = _977.y;
    float _983 = _977.z;
    float _985 = _854 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _987 = _866 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _989 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[6].x, _987);
    float _991 = exp2(_985);
    float _993 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _989);
    float _995 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[6].w, _993);
    out.gl_Position.x = _920;
    out.gl_Position.y = _922;
    out.gl_Position.z = _995;
    out.gl_Position.w = _904;
    float _997 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _999 = -_991;
    float _1001 = _999 + 1.0;
    out.m_67.w = _997;
    float _1003 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1005 = -_1003;
    float _1007 = _1005 + 1.0;
    float _1009 = _1003 * _958;
    float _1011 = _973 * _1009;
    float _1013 = _973 * _1007;
    float _1015 = _983 * _1009;
    float _1017 = fma(_979, _1011, _967);
    float _1019 = fma(_981, _1011, _969);
    float _1021 = fma(_973, _1015, _971);
    out.m_69.x = _1017;
    out.m_69.y = _1019;
    out.m_69.z = _1021;
    out.m_69.w = _1013;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _608 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1079 = as_type<float>(_104);
        out.gl_Position.z = _1079;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1148 = as_type<float>(_140);
        out.gl_Position.z = _1148;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.x;
    float _144 = in.m_51.y;
    float _146 = in.m_51.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = in.m_53.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_51.w;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _182 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _150);
    float _188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _152);
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _154);
    float _194 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _196 = _154;
    float _198 = _188;
    if (!_164)
    {
        float _200 = _148 * _148;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _190 * _188;
    float _208 = _204;
    if (!_164)
    {
        _198 = _148;
    }
    float _210 = _198;
    float _212 = _194 * _186;
    float _214 = _210;
    float _216 = _212;
    if (!_164)
    {
        float _218 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _218;
    }
    float _220 = _208;
    bool _222 = !_164;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _148 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _148);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_164;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _148 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _214 = _278;
    }
    float _280 = _214;
    float _282 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _290 = fma(_280, _170, _282);
    float _292 = fma(_280, _168, _284);
    float _294 = fma(_280, _172, _286);
    float _296 = fma(_290, _166, _176);
    float _298 = fma(_292, _166, _174);
    float _300 = _206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _302 = _206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = fma(_294, _166, _178);
    float _310 = _288 * _192;
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _316 = _314 != 0;
    float _318 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _300);
    float _320 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _302);
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _318);
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _320);
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _326 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _340 = in.m_55.x;
    float _342 = _332 + _334;
    float _344 = _206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _346 = _338 + _336;
    float _348 = _332;
    float _350 = _342;
    float _352 = _346;
    if (_316)
    {
        float _354 = in.m_57.x;
        _348 = _354;
    }
    float _356 = _348;
    float _358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _360 = _342 + _358;
    float _362 = fma(_212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _344);
    float _364 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _366 = _346 + _364;
    float _368 = in.m_57.y;
    float _370 = _360 * _360;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    float _376 = _366 * _366;
    float _378 = in.m_55.y;
    float _380 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _362);
    float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _384 = _370 + _376;
    float _386 = _380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _388 = sqrt(_384);
    float _390 = _340;
    float _392 = _384;
    if (_316)
    {
        _216 = _340;
    }
    float _394 = _216;
    bool _396 = _356 > 0.5;
    bool _398 = _396 && _316;
    float _400 = _296 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _402 = _368 > 0.5;
    float _404 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _406 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    bool _408 = _388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = -_378;
    float _414 = _412 + 1.0;
    float _416 = _406 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = _394;
    float _420 = _378;
    float _422 = _416;
    float _424 = _414;
    if (_398)
    {
        float _426 = -_394;
        float _428 = _426 + 1.0;
        _418 = _428;
    }
    float _430 = _418;
    float _432 = _416 + _386;
    float _434 = _430;
    if (_374)
    {
        float _436 = _402 ? _414 : _378;
        _420 = _436;
    }
    float _438 = _420;
    if (_316)
    {
        _390 = _430;
    }
    float _440 = _390;
    if (!_408)
    {
        _422 = _376;
    }
    float _442 = _422;
    float _444 = _442;
    if (!_408)
    {
        _424 = _370;
    }
    float _446 = _424;
    float _448 = _446;
    if (!_408)
    {
        _434 = _432;
    }
    float _450 = _434;
    bool _452 = !_408;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _388 + _458;
        float _462 = rsqrt(_384);
        float _464 = _460 * _456;
        float _466 = _432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _468 = _464 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = cos(_474);
        float _478 = fma(_472, _466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _462 * _478;
        float _482 = _476 + (-1.0);
        float _484 = fma(_360, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_366, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _488 = _482 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _492 = _484 + _490;
        float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _496 = _486 + _494;
        float _498 = fma(_432, _476, _488);
        float _500 = _492 * _492;
        float _502 = _496 * _496;
        _454 = _498;
        _448 = _500;
        _444 = _502;
        _350 = _484;
        _352 = _486;
    }
    float _504 = _454;
    float _506 = _448;
    float _508 = _444;
    float _510 = _350;
    float _512 = _352;
    float _514 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _516 = _504 + _514;
    float _518 = _440 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _520 = _438 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _522 = fma(_516, _516, _506);
    float _524 = _518 * _382;
    float _526 = _520 * _410;
    float _528 = _522 + _508;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _534 = sqrt(_528);
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _544 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _550 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = _538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _524;
    out.m_59.y = _526;
    bool _558 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _560 = isnan(_534);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _566 = _562 || _564;
    out.m_61.x = _550;
    out.m_61.y = _552;
    out.m_61.z = _554;
    out.m_61.w = _548;
    out.m_63.x = _544;
    out.m_63.y = _546;
    out.m_63.z = _556;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _568 = _542;
    float _570 = _552;
    float _572 = _544;
    if (!_566)
    {
        _568 = 1.0;
    }
    float _574 = _568;
    bool _576 = !_566;
    float _578 = _574;
    if (!_576)
    {
        bool _580 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _582 = isnan(_534);
        bool _584 = _580 || _582;
        bool _586 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _588 = _584 || _586;
        if (!_588)
        {
            float _590 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _592 = _534 + _590;
            float _594 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _596 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _594;
            float _598 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _600 = _598 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _602 = 1.0 / _596;
            float _604 = _592 * _602;
            float _606 = fma(_604, _600, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _578 = _606;
            _608 = true;
        }
        else
        {
            bool _610 = _534 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _612 = isnan(_534);
            bool _614 = _610 || _612;
            bool _616 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _618 = _614 || _616;
            if (!_618)
            {
                float _620 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _622 = _534 + _620;
                float _624 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _626 = _624 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _628 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _630 = _628 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _632 = 1.0 / _626;
                float _634 = _622 * _632;
                float _636 = fma(_634, _630, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _578 = _636;
                _608 = true;
            }
            else
            {
                _578 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _608 = false;
    float _638 = _578;
    float _640 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _642 = _504 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _646 = _510 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _650 = _512 + _648;
    float _652 = fma(_642, _638, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _654 = fma(_646, _638, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _656 = fma(_650, _638, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _660 = _652 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _654 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _668 = _656 + _666;
    float _670 = _660 * _660;
    float _672 = fma(_664, _664, _670);
    float _674 = fma(_668, _668, _672);
    float _676 = rsqrt(_674);
    float _678 = sqrt(_674);
    float _680 = _676 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _682 = _664 * _680;
    float _684 = _668 * _680;
    float _686 = _682 * _682;
    float _688 = _684 * _684;
    float _690 = _686 + _688;
    float _692 = sqrt(_690);
    bool _694 = _692 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _698 = _692 + _696;
    float _700 = _668;
    float _702 = _698;
    float _704 = _660;
    float _706 = _682;
    if (_694)
    {
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _700 = _708;
    }
    float _710 = _700;
    if (_694)
    {
        float _712 = rsqrt(_690);
        _570 = _712;
    }
    float _714 = _570;
    float _716 = _714;
    if (_694)
    {
        float _718 = _698 * _710;
        _702 = _718;
    }
    float _720 = _702;
    if (_694)
    {
        float _722 = _720 * 0.15915493667125701904296875;
        _572 = _722;
    }
    float _724 = _572;
    float _726 = _676;
    if (_694)
    {
        float _728 = _724 * 6.283185482025146484375;
        float _730 = sin(_728);
        _726 = _730;
    }
    float _732 = _726;
    float _734 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _736 = precise::max(0.0, _734);
    float _738 = _710;
    float _740 = _736;
    if (_694)
    {
        float _742 = _724 * 6.283185482025146484375;
        float _744 = cos(_742);
        _738 = _744;
    }
    float _746 = _738;
    float _748 = -_680;
    float _750 = -_736;
    float _752 = fma(_660, _748, _750);
    float _754 = _752;
    if (_694)
    {
        float _756 = _752 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _704 = _756;
    }
    float _758 = _704;
    float _760 = _758;
    float _762 = _732;
    if (_694)
    {
        float _764 = fma(_732, _758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _760 = _764;
    }
    float _766 = _760;
    float _768 = _766;
    if (!_694)
    {
        _762 = _684;
    }
    float _770 = _762;
    float _772 = _770;
    if (_694)
    {
        float _774 = _746 + (-1.0);
        _740 = _774;
    }
    float _776 = _740;
    float _778 = _776;
    if (_694)
    {
        float _780 = _714 * _766;
        _392 = _780;
    }
    float _782 = _392;
    if (!_694)
    {
        _768 = _688;
    }
    float _784 = _768;
    float _786 = _784;
    if (_694)
    {
        float _788 = _776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _716 = _788;
    }
    float _790 = _716;
    if (_694)
    {
        float _792 = _682 * _782;
        _706 = _792;
    }
    float _794 = _706;
    if (!_694)
    {
        _778 = _686;
    }
    float _796 = _778;
    float _798 = _796;
    if (_694)
    {
        float _800 = _684 * _782;
        _772 = _800;
    }
    float _802 = _772;
    if (_694)
    {
        float _804 = fma(_752, _746, _790);
        _754 = _804;
    }
    float _806 = _754;
    if (_694)
    {
        float _808 = _794 * _794;
        _798 = _808;
    }
    float _810 = _798;
    if (_694)
    {
        float _812 = _802 * _802;
        _786 = _812;
    }
    float _814 = _786;
    float _816 = fma(_806, _806, _810);
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _820 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _818);
    float _822 = precise::clamp(_820, 0.0, 1.0);
    float _824 = _652 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _826 = _816 + _814;
    float _828 = _652 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _830 = -_822;
    float _832 = _830 + 1.0;
    float _834 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[0].x, _824);
    float _836 = rsqrt(_826);
    float _838 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[2].x, _828);
    float _840 = _652 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _842 = _652 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _844 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[0].z, _834);
    float _846 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[2].z, _838);
    float _848 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[1].x, _840);
    float _850 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[3].x, _842);
    float _852 = abs(_832);
    float _854 = log2(_852);
    float _856 = _844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _858 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[1].z, _848);
    float _860 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _862 = _846 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _864 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _866 = _858 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _868 = _860 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _870 = _836 * _794;
    float _872 = _836 * _806;
    float _874 = _866 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _876 = _862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _878 = _870 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _880 = _836 * _802;
    float _882 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[7].x, _874);
    float _884 = -_876;
    float _886 = fma(_884, _864, 1.0);
    float _888 = -_878;
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _888);
    float _892 = _854 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _894 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _882);
    float _896 = _866 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _898 = -_880;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _890);
    float _902 = log2(_886);
    float _904 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[7].w, _894);
    float _906 = _866 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _908 = fma(_900, -0.5, 0.5);
    float _910 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[4].x, _896);
    float _912 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[5].x, _906);
    float _914 = 1.0 / _904;
    float _916 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _910);
    float _918 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _912);
    float _920 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[4].w, _916);
    float _922 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[5].w, _918);
    float _924 = exp2(_892);
    float _926 = _902 * 0.693147182464599609375;
    float _928 = _926 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _930 = sqrt(_908);
    float _932 = fma(_900, 0.5, 0.5);
    float _934 = _872 + 1.0;
    float _936 = _920 * _914;
    float _938 = _922 * _914;
    float _940 = fma(_932, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _942 = fma(_936, 0.5, 0.5);
    float _944 = -_872;
    float _946 = fma(_924, _934, _944);
    float _948 = fma(_932, _940, -0.212114393711090087890625);
    float _950 = fma(_938, -0.5, 0.5);
    float _952 = fma(_946, 0.5, 0.5);
    float _954 = fma(_932, _948, 1.570728778839111328125);
    float _956 = _930 * 0.636619746685028076171875;
    float3 _2529 = float3(_942, _950, _928);
    float _958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2529, float3(0.0), isnan(_2529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2529, float3(0.0), isnan(_2529)), level(0.0)).x;
    float _960 = -_954;
    float _962 = fma(_956, _960, 1.0);
    float3 _2545 = float3(_942, _950, _928);
    float4 _965 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2545, float3(0.0), isnan(_2545)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2545, float3(0.0), isnan(_2545)), level(0.0)).xyzw;
    float _967 = _965.x;
    float _969 = _965.y;
    float _971 = _965.z;
    float _973 = _965.w;
    float2 _2562 = float2(_962, _952);
    float3 _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2562, float2(0.0), isnan(_2562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2562, float2(0.0), isnan(_2562)), level(0.0)).xyz;
    float _979 = _977.x;
    float _981 = _977.y;
    float _983 = _977.z;
    float _985 = _854 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _987 = _866 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _989 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[6].x, _987);
    float _991 = exp2(_985);
    float _993 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _989);
    float _995 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[6].w, _993);
    out.gl_Position.x = _920;
    out.gl_Position.y = _922;
    out.gl_Position.z = _995;
    out.gl_Position.w = _904;
    float _997 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _999 = -_991;
    float _1001 = _999 + 1.0;
    out.m_67.w = _997;
    float _1003 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1005 = -_1003;
    float _1007 = _1005 + 1.0;
    float _1009 = _1003 * _958;
    float _1011 = _973 * _1009;
    float _1013 = _973 * _1007;
    float _1015 = _983 * _1009;
    float _1017 = fma(_979, _1011, _967);
    float _1019 = fma(_981, _1011, _969);
    float _1021 = fma(_973, _1015, _971);
    out.m_69.x = _1017;
    out.m_69.y = _1019;
    out.m_69.z = _1021;
    out.m_69.w = _1013;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

