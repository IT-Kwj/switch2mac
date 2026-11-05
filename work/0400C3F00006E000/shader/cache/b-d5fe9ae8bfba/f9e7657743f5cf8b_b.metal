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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1717 = false;
    bool _910 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2024 = as_type<float>(_126);
        out.gl_Position.z = _2024;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2092 = as_type<float>(_160);
        out.gl_Position.z = _2092;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.y;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = in.m_55.z;
    float _168 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _170 = in.m_57.x;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _174 = _172 != 0;
    float _176 = in.m_48.x;
    float _178 = in.m_48.y;
    float _180 = in.m_48.z;
    float _182 = in.m_59.w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _190 = _188 != 0;
    float _192 = _168 * _164;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _196 = _194 != 0;
    float _198 = in.m_57.y;
    float _200 = _162 * 6.283185482025146484375;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = _162 > 0.5;
    float _208 = _166 * 6.283185482025146484375;
    float _210 = fma(_170, 9.0, _200);
    float _212 = fma(_170, 8.5, _208);
    float _214 = 0.0;
    float _216 = _198;
    bool _218 = _206;
    if (!_174)
    {
        _214 = _170;
    }
    float _220 = _214;
    float _222 = fma(_144, 0.20000000298023223876953125, _210);
    float _224 = fma(_144, -0.1809999942779541015625, _212);
    float _226 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _228 = _222 * 0.15915493667125701904296875;
    float _230 = _224 * 0.15915493667125701904296875;
    float _232 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _226);
    float _234 = in.m_55.x;
    float _236 = _228 * 6.283185482025146484375;
    float _238 = sin(_236);
    float _240 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _232);
    out.m_61.w = _182;
    float _242 = _230 * 6.283185482025146484375;
    float _244 = sin(_242);
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c10)._m0[3].x, -0.25);
    float _250 = fma(_234, 1234.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _252 = _238 + _244;
    float _254 = fma(2.0, _170, -1.0);
    float _256 = fma(_252, -0.100000001490116119384765625, 0.800000011920928955078125);
    float _258 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _260 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _262 = -_254;
    float _264 = fma(_262, _254, 1.0);
    float _266 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _258);
    float _268 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _260);
    float _270 = _250 * 0.01666666753590106964111328125;
    float _272 = _256 * _264;
    float _274 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _276 = in.m_63.x;
    float _278 = in.m_63.y;
    float _280 = in.m_63.z;
    float _282 = _270 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _284 = _272 * 3.7699115276336669921875;
    float _286 = _240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _268);
    float _290 = _274 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _292 = _284 * 0.15915493667125701904296875;
    float _294 = _282 * 6.283185482025146484375;
    float _296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _298 = _286 + _296;
    float _300 = _288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = _292 * 6.283185482025146484375;
    float _304 = cos(_302);
    float _306 = -_294;
    float _308 = fma(_272, 4.523893833160400390625, _306);
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = _290 + _310;
    float _314 = _298 * _298;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _318 = _300 + _316;
    float _320 = _308 * 0.15915493667125701904296875;
    float _322 = fma(_312, _312, _314);
    float _324 = (*spvDescriptorSet0.vp_c10)._m0[3].x * 1.5;
    float _326 = fma(_318, _318, _322);
    float _328 = _320 * 6.283185482025146484375;
    float _330 = sin(_328);
    float _332 = _278 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _334 = -_248;
    float _336 = _334 + _280;
    float _338 = fma(_304, -0.5, 0.5);
    float _340 = rsqrt(_326);
    float _342 = _332 * _338;
    float _344 = in.m_65.x;
    float _346 = in.m_65.y;
    float _348 = in.m_65.z;
    float _350 = fma(_342, 0.60000002384185791015625, 0.07500000298023223876953125);
    float _352 = fma(_330, 0.5, 0.5);
    float _354 = _272 * _350;
    float _356 = fma(_324, _352, 1.0);
    float _358 = _298 * _340;
    float _360 = _312 * _340;
    float _362 = _354 * _356;
    float _364 = -_358;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _368 = -_360;
    float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _372 = 0.0 + _362;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _366 * _366;
    float _378 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = fma(_370, _370, _376);
    float _382 = _374 * 0.52359879016876220703125;
    float _384 = _318 * _340;
    float _386 = precise::max(0.0, _362);
    float _388 = -_198;
    float _390 = _388 + 1.0;
    float _392 = _382 * 0.15915493667125701904296875;
    float _394 = -_384;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _398 = precise::min(_386, 2.625);
    float _400 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _402 = _392 * 6.283185482025146484375;
    float _404 = sin(_402);
    float _406 = fma(_396, _396, _380);
    float _408 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _410 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = _220;
    float _414 = _360;
    float _416 = _300;
    if (_196)
    {
        float _418 = _206 ? _390 : _198;
        _216 = _418;
    }
    float _420 = _216;
    float _422 = fma(_398, 1.14285719394683837890625, 1.0);
    float _424 = _392 * 6.283185482025146484375;
    float _426 = cos(_424);
    float _428 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, 0.10000002384185791015625, 1.0);
    float _430 = fma(_398, -0.2857142984867095947265625, 1.0);
    float _432 = _336 * _422;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _436 = _422 * _276;
    float _438 = _432 * _430;
    float _440 = sqrt(_406);
    float _442 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[79].z, _434);
    float _444 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _446 = _438 * _404;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _454 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _456 = -_446;
    float _458 = fma(_362, _426, _456);
    float _460 = _438 * _426;
    if (_174)
    {
        bool _462 = _234 > 0.5;
        _218 = _462;
    }
    bool _464 = _218;
    float _466 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _468 = _458 * _428;
    float _470 = fma(_362, _404, _460);
    float _472 = _436 * _428;
    float _474 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = _340 * _440;
    float _478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _468);
    float _480 = _470 * _428;
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _472);
    float _484 = _408 * _476;
    float _486 = _450 * _476;
    float _488 = _474 * _476;
    float _490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _480);
    float _492 = _484 * _478;
    float _494 = _486 * _482;
    float _496 = -_452;
    float _498 = fma(_454, 2.0, _496);
    float _500 = _492 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _502 = _492 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _504 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _508 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[79].x, _442);
    float _510 = _488 * _490;
    float _512 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[8].x, _500);
    float _514 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[10].x, _502);
    float _516 = fma(_504, -2.0, _246);
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _520 = _508 * (-0.15915493667125701904296875);
    float _522 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].z, _512);
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].z, _514);
    float _526 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _518);
    int _528 = as_type<int>(_512);
    if (_174)
    {
        float _530 = -_170;
        float _532 = _530 + 1.0;
        _528 = as_type<int>(_532);
    }
    int _534 = _528;
    float _536 = _290 + _522;
    float _538 = _300 + _524;
    float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _548 = _538 + _546;
    float _550 = _536;
    float _552 = _538;
    if (_174)
    {
        float _554 = _464 ? as_type<float>(_534) : _170;
        _412 = _554;
    }
    float _556 = _412;
    float _558 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _560 = _544 * _544;
    float _562 = _548 * _548;
    float _564 = _520 * 6.283185482025146484375;
    float _566 = sin(_564);
    float _568 = fma(_558, _420, -0.5);
    float _570 = _560 + _562;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _576 = _520 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _584 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _492 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _592 = _540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _594 = sqrt(_570);
    float _596 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _466);
    float _598 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[9].x, _590);
    out.m_67.x = _584;
    out.m_67.y = _586;
    out.m_67.z = _588;
    out.m_67.w = _582;
    float _600 = fma(_592, _556, -0.5);
    float _602 = -_144;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[76].x, _498);
    float _606 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _516);
    bool _608 = _468 != 0.0;
    bool _610 = isnan(_468);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    bool _618 = _472 == 0.0;
    bool _620 = !_616;
    bool _622 = _618 && _620;
    bool _624 = _480 == 0.0;
    bool _626 = _624 && _622;
    float _628 = _566 * _568;
    float _630 = _578 * _568;
    float _632 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _526);
    float _634 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].z, _598);
    bool _636 = _594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _638 = in.m_69.x;
    float _640 = in.m_69.y;
    float _642 = in.m_69.z;
    float _644 = floor(_444);
    float _646 = -_628;
    float _648 = fma(_578, _600, _646);
    float _650 = fma(_566, _600, _630);
    float _652 = _286 + _634;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _658 = !_186;
    int _660 = _658 ? 0 : 1;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _664 = !_190;
    int _666 = _664 ? 0 : 1;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _670 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _634;
    float _678 = _560;
    float _680 = _562;
    if (!_636)
    {
        _676 = _652;
    }
    float _682 = _676;
    bool _684 = !_636;
    float _686 = _682;
    float _688 = _640;
    float _690 = _638;
    float _692 = _642;
    if (!_684)
    {
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _698 = _594 + _696;
        float _700 = rsqrt(_570);
        float _702 = _698 * _694;
        float _704 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = _702 * 0.15915493667125701904296875;
        float _708 = _706 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = fma(_710, _704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = _700 * _716;
        float _720 = _714 + (-1.0);
        float _722 = fma(_544, _718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_548, _718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _726 = _720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _730 = _722 + _728;
        float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _734 = _724 + _732;
        float _736 = fma(_652, _714, _726);
        float _738 = _730 * _730;
        float _740 = _734 * _734;
        _686 = _736;
        _678 = _738;
        _680 = _740;
        _550 = _722;
        _552 = _724;
    }
    float _742 = _686;
    float _744 = _678;
    float _746 = _680;
    float _748 = _550;
    float _750 = _552;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _754 = _742 + _752;
    if (!_626)
    {
        float _756 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _688 = _756;
    }
    float _758 = _688;
    float _760 = -_644;
    float _762 = _444 + _760;
    float _764 = _444 * 6.283185482025146484375;
    float _766 = fma(_754, _754, _744);
    if (!_626)
    {
        float _768 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[17].y, _638);
        _690 = _768;
    }
    float _770 = _690;
    out.m_71.x = _670;
    out.m_71.y = _672;
    out.m_71.z = _674;
    out.m_71.w = _668;
    float _772 = fma(_596, _648, _604);
    float _774 = _766 + _746;
    float _776 = _758 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _778 = _758 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _780 = _764 * 0.15915493667125701904296875;
    if (!_626)
    {
        float _782 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _692 = _782;
    }
    float _784 = _692;
    float _786 = -_606;
    float _788 = fma(_632, _650, _786);
    float _790 = sqrt(_774);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].x, _778);
    float _794 = _772 + 0.5;
    float _796 = _272 * 0.60000002384185791015625;
    int _798 = abs(_660);
    float _800 = _758 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _802 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].x, _776);
    float _804 = _780 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _788 + 0.5;
    float _810 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].x, _800);
    float _812 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _814 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    out.m_73.x = _796;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].z, _810);
    out.m_75.x = _794;
    out.m_75.y = _808;
    bool _818 = !_204;
    int _820 = _818 ? 0 : 1;
    out.m_77.x = _812;
    out.m_77.y = _816;
    out.m_77.z = _814;
    bool _822 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _824 = isnan(_790);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _830 = _826 || _828;
    float _832 = -_762;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _836 = float(_798);
    float _838 = fma(_806, 0.5, 0.5);
    int _840 = abs(_820);
    int _842 = abs(_666);
    float _844 = abs(_834);
    float _846 = _836 * _844;
    bool _848 = _762 < 0.5;
    float _850 = float(_848);
    float _852 = -_838;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _856 = float(_840);
    float _858 = float(_842);
    float _860 = -_850;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _864 = fma(_856, _854, _846);
    float _866 = _856;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    float _870 = _810;
    if (!_830)
    {
        _866 = 1.0;
    }
    float _872 = _866;
    float _874 = abs(_862);
    float _876 = fma(_858, _874, _864);
    bool _878 = !_830;
    float _880 = _872;
    if (!_878)
    {
        bool _882 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _884 = isnan(_790);
        bool _886 = _882 || _884;
        bool _888 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _890 = _886 || _888;
        if (!_890)
        {
            float _892 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _894 = _790 + _892;
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _902 = _900 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _904 = 1.0 / _898;
            float _906 = _894 * _904;
            float _908 = fma(_906, _902, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _880 = _908;
            _910 = true;
        }
        else
        {
            bool _912 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _914 = isnan(_790);
            bool _916 = _912 || _914;
            bool _918 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _920 = _916 || _918;
            if (!_920)
            {
                float _922 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _924 = _790 + _922;
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _926 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _934 = 1.0 / _928;
                float _936 = _924 * _934;
                float _938 = fma(_936, _932, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _880 = _938;
                _910 = true;
            }
            else
            {
                _880 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _910 = false;
    float _940 = _880;
    float _942 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _944 = _742 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _948 = _748 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _952 = _750 + _950;
    float _954 = -_360;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[18].w, _290);
    float _958 = fma(_944, _940, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _960 = fma(_948, _940, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _962 = fma(_952, _940, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _964 = -_358;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _968 = -_360;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _972 = -_384;
    float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _976 = -_384;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _966 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _970 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _974 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _998 = fma(_990, _990, _994);
    float _1000 = rsqrt(_998);
    float _1002 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _990;
    float _1024 = _992;
    float _1026 = _1020;
    float _1028 = _1012;
    if (_1016)
    {
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1030;
    }
    float _1032 = _1022;
    if (!_1016)
    {
        _414 = _1008;
    }
    float _1034 = _414;
    float _1036 = _1034;
    if (_1016)
    {
        float _1038 = rsqrt(_1012);
        _1024 = _1038;
    }
    float _1040 = _1024;
    float _1042 = _1040;
    if (_1016)
    {
        float _1044 = _1020 * _1032;
        _1026 = _1044;
    }
    float _1046 = _1026;
    if (_1016)
    {
        float _1048 = _1046 * 0.15915493667125701904296875;
        _868 = _1048;
    }
    float _1050 = _868;
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1054 = _1032;
    if (_1016)
    {
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = precise::max(0.0, _1052);
    float _1064 = -_1002;
    float _1066 = -_1062;
    float _1068 = fma(_982, _1064, _1066);
    float _1070 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1062;
    if (_1016)
    {
        float _1074 = _1050 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        _1070 = _1076;
    }
    float _1078 = _1070;
    if (_1016)
    {
        float _1080 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1080;
    }
    float _1082 = _1072;
    float _1084 = _1060;
    if (_1016)
    {
        float _1086 = fma(_1060, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1028 = _1086;
    }
    float _1088 = _1028;
    float _1090 = _1088;
    if (!_1016)
    {
        _1084 = _1004;
    }
    float _1092 = _1084;
    float _1094 = fma(_956, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1096 = _1092;
    if (_1016)
    {
        float _1098 = _1040 * _1088;
        _870 = _1098;
    }
    float _1100 = _870;
    if (!_1016)
    {
        _1090 = _1068;
    }
    float _1102 = _1090;
    float _1104 = floor(_1094);
    float _1106 = _1102;
    if (!_1016)
    {
        _1042 = _1006;
    }
    float _1108 = _1042;
    float _1110 = _1108;
    float _1112 = _1078;
    if (_1016)
    {
        float _1114 = _1078 + (-1.0);
        _416 = _1114;
    }
    float _1116 = _416;
    float _1118 = _1116;
    if (_1016)
    {
        float _1120 = _1004 * _1100;
        _1096 = _1120;
    }
    float _1122 = _1096;
    if (_1016)
    {
        float _1124 = _1006 * _1100;
        _1110 = _1124;
    }
    float _1126 = _1110;
    float _1128 = _966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1016)
    {
        float _1130 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1130;
    }
    float _1132 = _1118;
    if (_1016)
    {
        float _1134 = _1122 * _1122;
        _1036 = _1134;
    }
    float _1136 = _1036;
    if (_1016)
    {
        float _1138 = fma(_1068, _1078, _1132);
        _1106 = _1138;
    }
    float _1140 = _1106;
    if (!_1016)
    {
        _1112 = _1010;
    }
    float _1142 = _1112;
    float _1144 = _1142;
    if (_1016)
    {
        float _1146 = _1126 * _1126;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = sqrt(_998);
    float _1152 = fma(_1140, _1140, _1136);
    float _1154 = fma(_978, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1156 = _966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1158 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1128);
    float _1160 = _1152 + _1148;
    float _1162 = _966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1156);
    float _1166 = floor(_1154);
    float _1168 = _966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    float _1172 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    float _1174 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1158);
    float _1176 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1178 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1170);
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1182 = rsqrt(_1160);
    float _1184 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1190 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1188);
    float _1192 = precise::clamp(_1190, 0.0, 1.0);
    float _1194 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1200 = -_1192;
    float _1202 = _1200 + 1.0;
    float _1204 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1206 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1198);
    float _1208 = abs(_1202);
    float _1210 = log2(_1208);
    float _1212 = -_1204;
    float _1214 = fma(_1212, _996, 1.0);
    float _1216 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1218 = _1182 * _1122;
    float _1220 = _1182 * _1126;
    float _1222 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1216);
    float _1224 = _1182 * _1140;
    float _1226 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1228 = -_1104;
    float _1230 = _1094 + _1228;
    float _1232 = log2(_1214);
    float _1234 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = -_1226;
    float _1238 = fma(_1224, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1236);
    float _1240 = -_1166;
    float _1242 = _1154 + _1240;
    float _1244 = _1224 + 1.0;
    float _1246 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1248 = -_1220;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1238);
    float _1252 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = 1.0 / _1222;
    float _1256 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1258 = fma(_1250, -0.5, 0.5);
    float _1260 = fma(_1250, 0.5, 0.5);
    float _1262 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1264 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1256);
    float _1266 = fma(_1260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1268 = exp2(_1246);
    float _1270 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1262);
    float _1272 = _1232 * 0.693147182464599609375;
    float _1274 = fma(_1260, _1266, -0.212114393711090087890625);
    float _1276 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1264);
    float _1278 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1270);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1282 = fma(_1260, _1274, 1.570728778839111328125);
    float _1284 = sqrt(_1258);
    float _1286 = _1276 * _1254;
    float _1288 = _1278 * _1254;
    float _1290 = fma(_1286, 0.5, 0.5);
    float _1292 = fma(_1288, -0.5, 0.5);
    float _1294 = -_1224;
    float _1296 = fma(_1268, _1244, _1294);
    float2 _3995 = float2(_1230, _1242);
    float _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3995, float2(0.0), isnan(_3995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3995, float2(0.0), isnan(_3995)), level(0.0)).x;
    float3 _4006 = float3(_1290, _1292, _1280);
    float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).x;
    float _1302 = fma(_1296, 0.5, 0.5);
    float _1304 = _1284 * 0.636619746685028076171875;
    float _1306 = -_1282;
    float _1308 = fma(_1304, _1306, 1.0);
    float3 _4027 = float3(_1290, _1292, _1280);
    float4 _1311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4027, float3(0.0), isnan(_4027)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4027, float3(0.0), isnan(_4027)), level(0.0)).xyzw;
    float _1313 = _1311.x;
    float _1315 = _1311.y;
    float _1317 = _1311.z;
    float _1319 = _1311.w;
    float2 _4043 = float2(_1308, _1302);
    float3 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4043, float2(0.0), isnan(_4043)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4043, float2(0.0), isnan(_4043)), level(0.0)).xyz;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = -_358;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _1335 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1337 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1339 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1343 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1335);
    float _1345 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1347 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1341);
    float _1349 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1351 = exp2(_1337);
    float _1353 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1345);
    float _1355 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1359 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1361 = 1.0 / _1357;
    float _1363 = _1359 + _1357;
    float _1365 = _1363 * _1361;
    float _1367 = _1365 * 0.5;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    float _1373 = 1.0 / _1371;
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1377 = _1373 * _1375;
    float _1379 = abs(_1377);
    float _1381 = log2(_1379);
    float _1383 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1385 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1349);
    float _1387 = in.m_79.x;
    float _1389 = _1385 + _1222;
    float _1391 = exp2(_1383);
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1278;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1222;
    float _1393 = _1389 * 0.5;
    out.m_81.z = _1393;
    out.m_81.w = _1222;
    bool _1395 = _1377 <= 8000.0;
    bool _1397 = isnan(_1377);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(8000.0);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = fma(_1409, -2.0, 3.0);
    float _1413 = _1409 * _1409;
    bool _1415 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(0.5);
    bool _1423 = _1419 || _1421;
    float _1425 = _1413 * _1411;
    float _1427 = -_1425;
    float _1429 = _1427 + 1.0;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1425);
    float _1433 = _1429;
    float _1435 = _1431;
    if (_1423)
    {
        _1433 = 1.0;
    }
    float _1437 = _1433;
    float _1439 = _1405 * _1431;
    float _1441 = _1437;
    if (_1423)
    {
        _1435 = 1.0;
    }
    float _1443 = _1435;
    float _1445 = _1443;
    float _1447 = _1319;
    if (!_1423)
    {
        float _1449 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1451 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1455;
        float _1467 = _1459 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = _1459 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = 1.0 / _1477;
        float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1483 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1481;
        float _1485 = 1.0 / _1483;
        float _1487 = _1475 * _1479;
        float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1491 = fma(_1377, _1487, _1489);
        float _1493 = _1491 * _1485;
        float _1495 = precise::clamp(_1493, 0.0, 1.0);
        _1441 = _1495;
    }
    float _1497 = _1441;
    if (!_1423)
    {
        float _1499 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = _1501 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1509 = _1507 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1505;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_1377, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1445 = _1549;
    }
    float _1551 = _1445;
    float _1553 = -_1351;
    float _1555 = _1553 + 1.0;
    float _1557 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1559 = -_1298;
    float _1561 = _1559 + 1.0;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1565 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1567 = isnan(_1150);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1573 = _1569 || _1571;
    float _1575 = _1561 * _1557;
    float _1577 = precise::clamp(_1575, 0.0, 1.0);
    float _1579 = _1563 * _1300;
    float _1581 = -_1563;
    float _1583 = _1581 + 1.0;
    float _1585 = -_1577;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1589 = _1319 * _1579;
    float _1591 = _1329 * _1579;
    float _1593 = _1587 * _1387;
    float _1595 = fma(_1325, _1589, _1313);
    float _1597 = fma(_1327, _1589, _1315);
    float _1599 = _1593 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1601 = _1319 * _1583;
    float _1603 = fma(_1319, _1591, _1317);
    float _1605 = _1497 * _1551;
    float _1607 = _1583;
    float _1609 = _1593;
    float _1611 = _1589;
    float _1613 = _1563;
    float _1615 = _1605;
    if (!_1573)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1617 = _1607;
    out.m_83.x = _1599;
    float _1619 = _1617;
    float _1621 = _1617;
    if (!_1573)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1623 = _1609;
    float _1625 = _876 * _1605;
    float _1627 = _1623;
    float _1629 = _1623;
    if (!_1573)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1631 = _1611;
    out.m_85.x = _1595;
    out.m_85.y = _1597;
    out.m_85.z = _1603;
    out.m_85.w = _1601;
    float _1633 = _1631;
    float _1635 = _1631;
    if (!_1573)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1637 = _1613;
    float _1639 = _1637;
    float _1641 = _1637;
    if (!_1573)
    {
        _1447 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1643 = _1447;
    float _1645 = _1643;
    float _1647 = _1643;
    if (!_1573)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1649 = _1615;
    bool _1651 = !_1573;
    float _1653 = _1649;
    float _1655 = _1649;
    if (!_1651)
    {
        bool _1657 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1659 = isnan(_1150);
        bool _1661 = _1657 || _1659;
        bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1665 = _1661 || _1663;
        if (!_1665)
        {
            float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1669 = _1150 + _1667;
            float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1671;
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1679 = 1.0 / _1673;
            float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1683 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1697 = _1669 * _1679;
            float _1699 = precise::clamp(_1697, 0.0, 1.0);
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1705 = fma(_1699, _1677, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1707 = fma(_1699, _1703, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1709 = fma(_1699, _1683, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1711 = fma(_1699, _1687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1713 = fma(_1699, _1691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1715 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1629 = _1709;
            _1647 = _1713;
            _1621 = _1705;
            _1641 = _1711;
            _1635 = _1707;
            _1655 = _1715;
            _1717 = true;
        }
        else
        {
            bool _1719 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1721 = isnan(_1150);
            bool _1723 = _1719 || _1721;
            bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1727 = _1723 || _1725;
            if (!_1727)
            {
                _1619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1729 = _1619;
            _1621 = _1729;
            if (!_1727)
            {
                _1627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1731 = _1627;
            _1629 = _1731;
            if (!_1727)
            {
                _1633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1733 = _1633;
            _1635 = _1733;
            if (!_1727)
            {
                _1639 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1735 = _1639;
            _1641 = _1735;
            if (!_1727)
            {
                _1645 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1737 = _1645;
            _1647 = _1737;
            if (!_1727)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1739 = _1653;
            bool _1741 = !_1727;
            _1655 = _1739;
            if (!_1741)
            {
                bool _1743 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1745 = isnan(_1150);
                bool _1747 = _1743 || _1745;
                bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1751 = _1747 || _1749;
                if (!_1751)
                {
                    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1755 = _1150 + _1753;
                    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1757;
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1765 = 1.0 / _1759;
                    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1769 = _1767 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1783 = _1755 * _1765;
                    float _1785 = precise::clamp(_1783, 0.0, 1.0);
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1791 = fma(_1785, _1763, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1793 = fma(_1785, _1789, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1795 = fma(_1785, _1769, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1797 = fma(_1785, _1773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1799 = fma(_1785, _1777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1801 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1629 = _1795;
                    _1647 = _1799;
                    _1621 = _1791;
                    _1641 = _1797;
                    _1635 = _1793;
                    _1655 = _1801;
                    _1717 = true;
                }
                else
                {
                    _1629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1647 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1641 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1717 = false;
    float _1803 = _1629;
    float _1805 = _1647;
    float _1807 = _1621;
    float _1809 = _1641;
    float _1811 = _1635;
    float _1813 = _1655;
    float _1815 = fma(_816, -0.5, 0.5);
    float _1817 = precise::clamp(_1815, 0.0, 1.0);
    float _1819 = -_1803;
    float _1821 = _1819 + _1805;
    float _1823 = _1625 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1825 = -_1807;
    float _1827 = _1825 + _1809;
    out.m_87.x = 0.0;
    float _1829 = fma(_1817, _1821, _1803);
    float _1831 = -_1811;
    float _1833 = _1831 + _1813;
    out.m_51.x = _1823;
    float _1835 = fma(_1817, _1827, _1807);
    float _1837 = _1829 * 0.586610972881317138671875;
    float _1839 = fma(_1817, _1833, _1811);
    bool _1841 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1843 = fma(_1835, 0.298911988735198974609375, _1837);
    bool _1845 = _1497 > 0.0;
    bool _1847 = isnan(_1497);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan(0.0);
    bool _1853 = _1849 || _1851;
    float _1855 = fma(_1839, 0.114477999508380889892578125, _1843);
    bool _1857 = _1551 <= 0.0;
    bool _1859 = !_1853;
    bool _1861 = _1857 || _1859;
    float _1863 = -_1855;
    float _1865 = _1835 + _1863;
    float _1867 = -_1855;
    float _1869 = _1829 + _1867;
    float _1871 = -_1855;
    float _1873 = _1839 + _1871;
    float _1875 = fma(_1865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1877 = fma(_1869, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1879 = fma(_1873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    bool _1881 = !_1841;
    if (!_1881)
    {
        float _1883 = -_966;
        float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1887 = -_970;
        float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1891 = -_974;
        float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1895 = _1885 * _1885;
        float _1897 = fma(_1889, _1889, _1895);
        float _1899 = fma(_1893, _1893, _1897);
        float _1901 = sqrt(_1899);
        float _1903 = rsqrt(_1899);
        float _1905 = -_1901;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1911 = precise::clamp(_1909, 0.0, 1.0);
        float _1913 = _1889 * _1903;
        float _1915 = _1885 * _1903;
        float _1917 = abs(_1911);
        float _1919 = log2(_1917);
        float _1921 = _1893 * _1903;
        float _1923 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1925 = _816 * _1915;
        float _1927 = -_1915;
        float _1929 = -_1923;
        float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1929);
        float _1933 = fma(_812, _1913, _1925);
        float _1935 = -_1921;
        float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1931);
        float _1939 = fma(_814, _1921, _1933);
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1945 = _1937 + _1943;
        float _1947 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1949 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        float _1953 = exp2(_1947);
        float _1955 = _1953 * _1951;
        float _1957 = _1941 * _1955;
        float _1959 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1961 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1959;
        out.m_87.y = _1961;
        out.m_87.z = _1963;
    }
    out.m_89.x = _1875;
    out.m_89.y = _1877;
    out.m_89.z = _1879;
    if (!_1861)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1965;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1717 = false;
    bool _910 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2024 = as_type<float>(_126);
        out.gl_Position.z = _2024;
    }
    if (!_112)
    {
        return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2092 = as_type<float>(_160);
        out.gl_Position.z = _2092;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.y;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = in.m_55.z;
    float _168 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _170 = in.m_57.x;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _174 = _172 != 0;
    float _176 = in.m_48.x;
    float _178 = in.m_48.y;
    float _180 = in.m_48.z;
    float _182 = in.m_59.w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _190 = _188 != 0;
    float _192 = _168 * _164;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _196 = _194 != 0;
    float _198 = in.m_57.y;
    float _200 = _162 * 6.283185482025146484375;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = _162 > 0.5;
    float _208 = _166 * 6.283185482025146484375;
    float _210 = fma(_170, 9.0, _200);
    float _212 = fma(_170, 8.5, _208);
    float _214 = 0.0;
    float _216 = _198;
    bool _218 = _206;
    if (!_174)
    {
        _214 = _170;
    }
    float _220 = _214;
    float _222 = fma(_144, 0.20000000298023223876953125, _210);
    float _224 = fma(_144, -0.1809999942779541015625, _212);
    float _226 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _228 = _222 * 0.15915493667125701904296875;
    float _230 = _224 * 0.15915493667125701904296875;
    float _232 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _226);
    float _234 = in.m_55.x;
    float _236 = _228 * 6.283185482025146484375;
    float _238 = sin(_236);
    float _240 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _232);
    out.m_61.w = _182;
    float _242 = _230 * 6.283185482025146484375;
    float _244 = sin(_242);
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c10)._m0[3].x, -0.25);
    float _250 = fma(_234, 1234.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _252 = _238 + _244;
    float _254 = fma(2.0, _170, -1.0);
    float _256 = fma(_252, -0.100000001490116119384765625, 0.800000011920928955078125);
    float _258 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _260 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _262 = -_254;
    float _264 = fma(_262, _254, 1.0);
    float _266 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _258);
    float _268 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _260);
    float _270 = _250 * 0.01666666753590106964111328125;
    float _272 = _256 * _264;
    float _274 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _276 = in.m_63.x;
    float _278 = in.m_63.y;
    float _280 = in.m_63.z;
    float _282 = _270 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _284 = _272 * 3.7699115276336669921875;
    float _286 = _240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _268);
    float _290 = _274 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _292 = _284 * 0.15915493667125701904296875;
    float _294 = _282 * 6.283185482025146484375;
    float _296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _298 = _286 + _296;
    float _300 = _288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = _292 * 6.283185482025146484375;
    float _304 = cos(_302);
    float _306 = -_294;
    float _308 = fma(_272, 4.523893833160400390625, _306);
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = _290 + _310;
    float _314 = _298 * _298;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _318 = _300 + _316;
    float _320 = _308 * 0.15915493667125701904296875;
    float _322 = fma(_312, _312, _314);
    float _324 = (*spvDescriptorSet0.vp_c10)._m0[3].x * 1.5;
    float _326 = fma(_318, _318, _322);
    float _328 = _320 * 6.283185482025146484375;
    float _330 = sin(_328);
    float _332 = _278 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _334 = -_248;
    float _336 = _334 + _280;
    float _338 = fma(_304, -0.5, 0.5);
    float _340 = rsqrt(_326);
    float _342 = _332 * _338;
    float _344 = in.m_65.x;
    float _346 = in.m_65.y;
    float _348 = in.m_65.z;
    float _350 = fma(_342, 0.60000002384185791015625, 0.07500000298023223876953125);
    float _352 = fma(_330, 0.5, 0.5);
    float _354 = _272 * _350;
    float _356 = fma(_324, _352, 1.0);
    float _358 = _298 * _340;
    float _360 = _312 * _340;
    float _362 = _354 * _356;
    float _364 = -_358;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _368 = -_360;
    float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _372 = 0.0 + _362;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _366 * _366;
    float _378 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = fma(_370, _370, _376);
    float _382 = _374 * 0.52359879016876220703125;
    float _384 = _318 * _340;
    float _386 = precise::max(0.0, _362);
    float _388 = -_198;
    float _390 = _388 + 1.0;
    float _392 = _382 * 0.15915493667125701904296875;
    float _394 = -_384;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _398 = precise::min(_386, 2.625);
    float _400 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _402 = _392 * 6.283185482025146484375;
    float _404 = sin(_402);
    float _406 = fma(_396, _396, _380);
    float _408 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _410 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = _220;
    float _414 = _360;
    float _416 = _300;
    if (_196)
    {
        float _418 = _206 ? _390 : _198;
        _216 = _418;
    }
    float _420 = _216;
    float _422 = fma(_398, 1.14285719394683837890625, 1.0);
    float _424 = _392 * 6.283185482025146484375;
    float _426 = cos(_424);
    float _428 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, 0.10000002384185791015625, 1.0);
    float _430 = fma(_398, -0.2857142984867095947265625, 1.0);
    float _432 = _336 * _422;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _436 = _422 * _276;
    float _438 = _432 * _430;
    float _440 = sqrt(_406);
    float _442 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[79].z, _434);
    float _444 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _446 = _438 * _404;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _454 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _456 = -_446;
    float _458 = fma(_362, _426, _456);
    float _460 = _438 * _426;
    if (_174)
    {
        bool _462 = _234 > 0.5;
        _218 = _462;
    }
    bool _464 = _218;
    float _466 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _468 = _458 * _428;
    float _470 = fma(_362, _404, _460);
    float _472 = _436 * _428;
    float _474 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = _340 * _440;
    float _478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _468);
    float _480 = _470 * _428;
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _472);
    float _484 = _408 * _476;
    float _486 = _450 * _476;
    float _488 = _474 * _476;
    float _490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _480);
    float _492 = _484 * _478;
    float _494 = _486 * _482;
    float _496 = -_452;
    float _498 = fma(_454, 2.0, _496);
    float _500 = _492 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _502 = _492 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _504 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _508 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[79].x, _442);
    float _510 = _488 * _490;
    float _512 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[8].x, _500);
    float _514 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[10].x, _502);
    float _516 = fma(_504, -2.0, _246);
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _520 = _508 * (-0.15915493667125701904296875);
    float _522 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].z, _512);
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].z, _514);
    float _526 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _518);
    int _528 = as_type<int>(_512);
    if (_174)
    {
        float _530 = -_170;
        float _532 = _530 + 1.0;
        _528 = as_type<int>(_532);
    }
    int _534 = _528;
    float _536 = _290 + _522;
    float _538 = _300 + _524;
    float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _548 = _538 + _546;
    float _550 = _536;
    float _552 = _538;
    if (_174)
    {
        float _554 = _464 ? as_type<float>(_534) : _170;
        _412 = _554;
    }
    float _556 = _412;
    float _558 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _560 = _544 * _544;
    float _562 = _548 * _548;
    float _564 = _520 * 6.283185482025146484375;
    float _566 = sin(_564);
    float _568 = fma(_558, _420, -0.5);
    float _570 = _560 + _562;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _576 = _520 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _584 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _492 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _592 = _540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _594 = sqrt(_570);
    float _596 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _466);
    float _598 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[9].x, _590);
    out.m_67.x = _584;
    out.m_67.y = _586;
    out.m_67.z = _588;
    out.m_67.w = _582;
    float _600 = fma(_592, _556, -0.5);
    float _602 = -_144;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[76].x, _498);
    float _606 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _516);
    bool _608 = _468 != 0.0;
    bool _610 = isnan(_468);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    bool _618 = _472 == 0.0;
    bool _620 = !_616;
    bool _622 = _618 && _620;
    bool _624 = _480 == 0.0;
    bool _626 = _624 && _622;
    float _628 = _566 * _568;
    float _630 = _578 * _568;
    float _632 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _526);
    float _634 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].z, _598);
    bool _636 = _594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _638 = in.m_69.x;
    float _640 = in.m_69.y;
    float _642 = in.m_69.z;
    float _644 = floor(_444);
    float _646 = -_628;
    float _648 = fma(_578, _600, _646);
    float _650 = fma(_566, _600, _630);
    float _652 = _286 + _634;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _658 = !_186;
    int _660 = _658 ? 0 : 1;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _664 = !_190;
    int _666 = _664 ? 0 : 1;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _670 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _634;
    float _678 = _560;
    float _680 = _562;
    if (!_636)
    {
        _676 = _652;
    }
    float _682 = _676;
    bool _684 = !_636;
    float _686 = _682;
    float _688 = _640;
    float _690 = _638;
    float _692 = _642;
    if (!_684)
    {
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _698 = _594 + _696;
        float _700 = rsqrt(_570);
        float _702 = _698 * _694;
        float _704 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = _702 * 0.15915493667125701904296875;
        float _708 = _706 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = fma(_710, _704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = _700 * _716;
        float _720 = _714 + (-1.0);
        float _722 = fma(_544, _718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_548, _718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _726 = _720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _730 = _722 + _728;
        float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _734 = _724 + _732;
        float _736 = fma(_652, _714, _726);
        float _738 = _730 * _730;
        float _740 = _734 * _734;
        _686 = _736;
        _678 = _738;
        _680 = _740;
        _550 = _722;
        _552 = _724;
    }
    float _742 = _686;
    float _744 = _678;
    float _746 = _680;
    float _748 = _550;
    float _750 = _552;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _754 = _742 + _752;
    if (!_626)
    {
        float _756 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _688 = _756;
    }
    float _758 = _688;
    float _760 = -_644;
    float _762 = _444 + _760;
    float _764 = _444 * 6.283185482025146484375;
    float _766 = fma(_754, _754, _744);
    if (!_626)
    {
        float _768 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[17].y, _638);
        _690 = _768;
    }
    float _770 = _690;
    out.m_71.x = _670;
    out.m_71.y = _672;
    out.m_71.z = _674;
    out.m_71.w = _668;
    float _772 = fma(_596, _648, _604);
    float _774 = _766 + _746;
    float _776 = _758 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _778 = _758 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _780 = _764 * 0.15915493667125701904296875;
    if (!_626)
    {
        float _782 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _692 = _782;
    }
    float _784 = _692;
    float _786 = -_606;
    float _788 = fma(_632, _650, _786);
    float _790 = sqrt(_774);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].x, _778);
    float _794 = _772 + 0.5;
    float _796 = _272 * 0.60000002384185791015625;
    int _798 = abs(_660);
    float _800 = _758 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _802 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].x, _776);
    float _804 = _780 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _788 + 0.5;
    float _810 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].x, _800);
    float _812 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _814 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    out.m_73.x = _796;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].z, _810);
    out.m_75.x = _794;
    out.m_75.y = _808;
    bool _818 = !_204;
    int _820 = _818 ? 0 : 1;
    out.m_77.x = _812;
    out.m_77.y = _816;
    out.m_77.z = _814;
    bool _822 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _824 = isnan(_790);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _830 = _826 || _828;
    float _832 = -_762;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _836 = float(_798);
    float _838 = fma(_806, 0.5, 0.5);
    int _840 = abs(_820);
    int _842 = abs(_666);
    float _844 = abs(_834);
    float _846 = _836 * _844;
    bool _848 = _762 < 0.5;
    float _850 = float(_848);
    float _852 = -_838;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _856 = float(_840);
    float _858 = float(_842);
    float _860 = -_850;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _864 = fma(_856, _854, _846);
    float _866 = _856;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    float _870 = _810;
    if (!_830)
    {
        _866 = 1.0;
    }
    float _872 = _866;
    float _874 = abs(_862);
    float _876 = fma(_858, _874, _864);
    bool _878 = !_830;
    float _880 = _872;
    if (!_878)
    {
        bool _882 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _884 = isnan(_790);
        bool _886 = _882 || _884;
        bool _888 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _890 = _886 || _888;
        if (!_890)
        {
            float _892 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _894 = _790 + _892;
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _902 = _900 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _904 = 1.0 / _898;
            float _906 = _894 * _904;
            float _908 = fma(_906, _902, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _880 = _908;
            _910 = true;
        }
        else
        {
            bool _912 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _914 = isnan(_790);
            bool _916 = _912 || _914;
            bool _918 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _920 = _916 || _918;
            if (!_920)
            {
                float _922 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _924 = _790 + _922;
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _926 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _934 = 1.0 / _928;
                float _936 = _924 * _934;
                float _938 = fma(_936, _932, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _880 = _938;
                _910 = true;
            }
            else
            {
                _880 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _910 = false;
    float _940 = _880;
    float _942 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _944 = _742 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _948 = _748 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _952 = _750 + _950;
    float _954 = -_360;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[18].w, _290);
    float _958 = fma(_944, _940, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _960 = fma(_948, _940, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _962 = fma(_952, _940, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _964 = -_358;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _968 = -_360;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _972 = -_384;
    float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _976 = -_384;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _966 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _970 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _974 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _998 = fma(_990, _990, _994);
    float _1000 = rsqrt(_998);
    float _1002 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _990;
    float _1024 = _992;
    float _1026 = _1020;
    float _1028 = _1012;
    if (_1016)
    {
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1030;
    }
    float _1032 = _1022;
    if (!_1016)
    {
        _414 = _1008;
    }
    float _1034 = _414;
    float _1036 = _1034;
    if (_1016)
    {
        float _1038 = rsqrt(_1012);
        _1024 = _1038;
    }
    float _1040 = _1024;
    float _1042 = _1040;
    if (_1016)
    {
        float _1044 = _1020 * _1032;
        _1026 = _1044;
    }
    float _1046 = _1026;
    if (_1016)
    {
        float _1048 = _1046 * 0.15915493667125701904296875;
        _868 = _1048;
    }
    float _1050 = _868;
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1054 = _1032;
    if (_1016)
    {
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = precise::max(0.0, _1052);
    float _1064 = -_1002;
    float _1066 = -_1062;
    float _1068 = fma(_982, _1064, _1066);
    float _1070 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1062;
    if (_1016)
    {
        float _1074 = _1050 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        _1070 = _1076;
    }
    float _1078 = _1070;
    if (_1016)
    {
        float _1080 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1080;
    }
    float _1082 = _1072;
    float _1084 = _1060;
    if (_1016)
    {
        float _1086 = fma(_1060, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1028 = _1086;
    }
    float _1088 = _1028;
    float _1090 = _1088;
    if (!_1016)
    {
        _1084 = _1004;
    }
    float _1092 = _1084;
    float _1094 = fma(_956, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1096 = _1092;
    if (_1016)
    {
        float _1098 = _1040 * _1088;
        _870 = _1098;
    }
    float _1100 = _870;
    if (!_1016)
    {
        _1090 = _1068;
    }
    float _1102 = _1090;
    float _1104 = floor(_1094);
    float _1106 = _1102;
    if (!_1016)
    {
        _1042 = _1006;
    }
    float _1108 = _1042;
    float _1110 = _1108;
    float _1112 = _1078;
    if (_1016)
    {
        float _1114 = _1078 + (-1.0);
        _416 = _1114;
    }
    float _1116 = _416;
    float _1118 = _1116;
    if (_1016)
    {
        float _1120 = _1004 * _1100;
        _1096 = _1120;
    }
    float _1122 = _1096;
    if (_1016)
    {
        float _1124 = _1006 * _1100;
        _1110 = _1124;
    }
    float _1126 = _1110;
    float _1128 = _966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1016)
    {
        float _1130 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1130;
    }
    float _1132 = _1118;
    if (_1016)
    {
        float _1134 = _1122 * _1122;
        _1036 = _1134;
    }
    float _1136 = _1036;
    if (_1016)
    {
        float _1138 = fma(_1068, _1078, _1132);
        _1106 = _1138;
    }
    float _1140 = _1106;
    if (!_1016)
    {
        _1112 = _1010;
    }
    float _1142 = _1112;
    float _1144 = _1142;
    if (_1016)
    {
        float _1146 = _1126 * _1126;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = sqrt(_998);
    float _1152 = fma(_1140, _1140, _1136);
    float _1154 = fma(_978, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1156 = _966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1158 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1128);
    float _1160 = _1152 + _1148;
    float _1162 = _966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1156);
    float _1166 = floor(_1154);
    float _1168 = _966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    float _1172 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    float _1174 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1158);
    float _1176 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1178 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1170);
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1182 = rsqrt(_1160);
    float _1184 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1190 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1188);
    float _1192 = precise::clamp(_1190, 0.0, 1.0);
    float _1194 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1200 = -_1192;
    float _1202 = _1200 + 1.0;
    float _1204 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1206 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1198);
    float _1208 = abs(_1202);
    float _1210 = log2(_1208);
    float _1212 = -_1204;
    float _1214 = fma(_1212, _996, 1.0);
    float _1216 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1218 = _1182 * _1122;
    float _1220 = _1182 * _1126;
    float _1222 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1216);
    float _1224 = _1182 * _1140;
    float _1226 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1228 = -_1104;
    float _1230 = _1094 + _1228;
    float _1232 = log2(_1214);
    float _1234 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = -_1226;
    float _1238 = fma(_1224, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1236);
    float _1240 = -_1166;
    float _1242 = _1154 + _1240;
    float _1244 = _1224 + 1.0;
    float _1246 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1248 = -_1220;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1238);
    float _1252 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = 1.0 / _1222;
    float _1256 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1258 = fma(_1250, -0.5, 0.5);
    float _1260 = fma(_1250, 0.5, 0.5);
    float _1262 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1264 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1256);
    float _1266 = fma(_1260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1268 = exp2(_1246);
    float _1270 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1262);
    float _1272 = _1232 * 0.693147182464599609375;
    float _1274 = fma(_1260, _1266, -0.212114393711090087890625);
    float _1276 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1264);
    float _1278 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1270);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1282 = fma(_1260, _1274, 1.570728778839111328125);
    float _1284 = sqrt(_1258);
    float _1286 = _1276 * _1254;
    float _1288 = _1278 * _1254;
    float _1290 = fma(_1286, 0.5, 0.5);
    float _1292 = fma(_1288, -0.5, 0.5);
    float _1294 = -_1224;
    float _1296 = fma(_1268, _1244, _1294);
    float2 _3995 = float2(_1230, _1242);
    float _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3995, float2(0.0), isnan(_3995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3995, float2(0.0), isnan(_3995)), level(0.0)).x;
    float3 _4006 = float3(_1290, _1292, _1280);
    float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).x;
    float _1302 = fma(_1296, 0.5, 0.5);
    float _1304 = _1284 * 0.636619746685028076171875;
    float _1306 = -_1282;
    float _1308 = fma(_1304, _1306, 1.0);
    float3 _4027 = float3(_1290, _1292, _1280);
    float4 _1311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4027, float3(0.0), isnan(_4027)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4027, float3(0.0), isnan(_4027)), level(0.0)).xyzw;
    float _1313 = _1311.x;
    float _1315 = _1311.y;
    float _1317 = _1311.z;
    float _1319 = _1311.w;
    float2 _4043 = float2(_1308, _1302);
    float3 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4043, float2(0.0), isnan(_4043)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4043, float2(0.0), isnan(_4043)), level(0.0)).xyz;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = -_358;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _1335 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1337 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1339 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1343 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1335);
    float _1345 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1347 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1341);
    float _1349 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1351 = exp2(_1337);
    float _1353 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1345);
    float _1355 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1359 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1361 = 1.0 / _1357;
    float _1363 = _1359 + _1357;
    float _1365 = _1363 * _1361;
    float _1367 = _1365 * 0.5;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    float _1373 = 1.0 / _1371;
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1377 = _1373 * _1375;
    float _1379 = abs(_1377);
    float _1381 = log2(_1379);
    float _1383 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1385 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1349);
    float _1387 = in.m_79.x;
    float _1389 = _1385 + _1222;
    float _1391 = exp2(_1383);
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1278;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1222;
    float _1393 = _1389 * 0.5;
    out.m_81.z = _1393;
    out.m_81.w = _1222;
    bool _1395 = _1377 <= 8000.0;
    bool _1397 = isnan(_1377);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(8000.0);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = fma(_1409, -2.0, 3.0);
    float _1413 = _1409 * _1409;
    bool _1415 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(0.5);
    bool _1423 = _1419 || _1421;
    float _1425 = _1413 * _1411;
    float _1427 = -_1425;
    float _1429 = _1427 + 1.0;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1425);
    float _1433 = _1429;
    float _1435 = _1431;
    if (_1423)
    {
        _1433 = 1.0;
    }
    float _1437 = _1433;
    float _1439 = _1405 * _1431;
    float _1441 = _1437;
    if (_1423)
    {
        _1435 = 1.0;
    }
    float _1443 = _1435;
    float _1445 = _1443;
    float _1447 = _1319;
    if (!_1423)
    {
        float _1449 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1451 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1455;
        float _1467 = _1459 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = _1459 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = 1.0 / _1477;
        float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1483 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1481;
        float _1485 = 1.0 / _1483;
        float _1487 = _1475 * _1479;
        float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1491 = fma(_1377, _1487, _1489);
        float _1493 = _1491 * _1485;
        float _1495 = precise::clamp(_1493, 0.0, 1.0);
        _1441 = _1495;
    }
    float _1497 = _1441;
    if (!_1423)
    {
        float _1499 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = _1501 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1509 = _1507 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1505;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_1377, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1445 = _1549;
    }
    float _1551 = _1445;
    float _1553 = -_1351;
    float _1555 = _1553 + 1.0;
    float _1557 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1559 = -_1298;
    float _1561 = _1559 + 1.0;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1565 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1567 = isnan(_1150);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1573 = _1569 || _1571;
    float _1575 = _1561 * _1557;
    float _1577 = precise::clamp(_1575, 0.0, 1.0);
    float _1579 = _1563 * _1300;
    float _1581 = -_1563;
    float _1583 = _1581 + 1.0;
    float _1585 = -_1577;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1589 = _1319 * _1579;
    float _1591 = _1329 * _1579;
    float _1593 = _1587 * _1387;
    float _1595 = fma(_1325, _1589, _1313);
    float _1597 = fma(_1327, _1589, _1315);
    float _1599 = _1593 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1601 = _1319 * _1583;
    float _1603 = fma(_1319, _1591, _1317);
    float _1605 = _1497 * _1551;
    float _1607 = _1583;
    float _1609 = _1593;
    float _1611 = _1589;
    float _1613 = _1563;
    float _1615 = _1605;
    if (!_1573)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1617 = _1607;
    out.m_83.x = _1599;
    float _1619 = _1617;
    float _1621 = _1617;
    if (!_1573)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1623 = _1609;
    float _1625 = _876 * _1605;
    float _1627 = _1623;
    float _1629 = _1623;
    if (!_1573)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1631 = _1611;
    out.m_85.x = _1595;
    out.m_85.y = _1597;
    out.m_85.z = _1603;
    out.m_85.w = _1601;
    float _1633 = _1631;
    float _1635 = _1631;
    if (!_1573)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1637 = _1613;
    float _1639 = _1637;
    float _1641 = _1637;
    if (!_1573)
    {
        _1447 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1643 = _1447;
    float _1645 = _1643;
    float _1647 = _1643;
    if (!_1573)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1649 = _1615;
    bool _1651 = !_1573;
    float _1653 = _1649;
    float _1655 = _1649;
    if (!_1651)
    {
        bool _1657 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1659 = isnan(_1150);
        bool _1661 = _1657 || _1659;
        bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1665 = _1661 || _1663;
        if (!_1665)
        {
            float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1669 = _1150 + _1667;
            float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1671;
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1679 = 1.0 / _1673;
            float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1683 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1697 = _1669 * _1679;
            float _1699 = precise::clamp(_1697, 0.0, 1.0);
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1705 = fma(_1699, _1677, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1707 = fma(_1699, _1703, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1709 = fma(_1699, _1683, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1711 = fma(_1699, _1687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1713 = fma(_1699, _1691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1715 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1629 = _1709;
            _1647 = _1713;
            _1621 = _1705;
            _1641 = _1711;
            _1635 = _1707;
            _1655 = _1715;
            _1717 = true;
        }
        else
        {
            bool _1719 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1721 = isnan(_1150);
            bool _1723 = _1719 || _1721;
            bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1727 = _1723 || _1725;
            if (!_1727)
            {
                _1619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1729 = _1619;
            _1621 = _1729;
            if (!_1727)
            {
                _1627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1731 = _1627;
            _1629 = _1731;
            if (!_1727)
            {
                _1633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1733 = _1633;
            _1635 = _1733;
            if (!_1727)
            {
                _1639 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1735 = _1639;
            _1641 = _1735;
            if (!_1727)
            {
                _1645 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1737 = _1645;
            _1647 = _1737;
            if (!_1727)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1739 = _1653;
            bool _1741 = !_1727;
            _1655 = _1739;
            if (!_1741)
            {
                bool _1743 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1745 = isnan(_1150);
                bool _1747 = _1743 || _1745;
                bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1751 = _1747 || _1749;
                if (!_1751)
                {
                    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1755 = _1150 + _1753;
                    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1757;
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1765 = 1.0 / _1759;
                    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1769 = _1767 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1783 = _1755 * _1765;
                    float _1785 = precise::clamp(_1783, 0.0, 1.0);
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1791 = fma(_1785, _1763, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1793 = fma(_1785, _1789, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1795 = fma(_1785, _1769, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1797 = fma(_1785, _1773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1799 = fma(_1785, _1777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1801 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1629 = _1795;
                    _1647 = _1799;
                    _1621 = _1791;
                    _1641 = _1797;
                    _1635 = _1793;
                    _1655 = _1801;
                    _1717 = true;
                }
                else
                {
                    _1629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1647 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1641 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1717 = false;
    float _1803 = _1629;
    float _1805 = _1647;
    float _1807 = _1621;
    float _1809 = _1641;
    float _1811 = _1635;
    float _1813 = _1655;
    float _1815 = fma(_816, -0.5, 0.5);
    float _1817 = precise::clamp(_1815, 0.0, 1.0);
    float _1819 = -_1803;
    float _1821 = _1819 + _1805;
    float _1823 = _1625 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1825 = -_1807;
    float _1827 = _1825 + _1809;
    out.m_87.x = 0.0;
    float _1829 = fma(_1817, _1821, _1803);
    float _1831 = -_1811;
    float _1833 = _1831 + _1813;
    out.m_51.x = _1823;
    float _1835 = fma(_1817, _1827, _1807);
    float _1837 = _1829 * 0.586610972881317138671875;
    float _1839 = fma(_1817, _1833, _1811);
    bool _1841 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1843 = fma(_1835, 0.298911988735198974609375, _1837);
    bool _1845 = _1497 > 0.0;
    bool _1847 = isnan(_1497);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan(0.0);
    bool _1853 = _1849 || _1851;
    float _1855 = fma(_1839, 0.114477999508380889892578125, _1843);
    bool _1857 = _1551 <= 0.0;
    bool _1859 = !_1853;
    bool _1861 = _1857 || _1859;
    float _1863 = -_1855;
    float _1865 = _1835 + _1863;
    float _1867 = -_1855;
    float _1869 = _1829 + _1867;
    float _1871 = -_1855;
    float _1873 = _1839 + _1871;
    float _1875 = fma(_1865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1877 = fma(_1869, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1879 = fma(_1873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    bool _1881 = !_1841;
    if (!_1881)
    {
        float _1883 = -_966;
        float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1887 = -_970;
        float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1891 = -_974;
        float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1895 = _1885 * _1885;
        float _1897 = fma(_1889, _1889, _1895);
        float _1899 = fma(_1893, _1893, _1897);
        float _1901 = sqrt(_1899);
        float _1903 = rsqrt(_1899);
        float _1905 = -_1901;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1911 = precise::clamp(_1909, 0.0, 1.0);
        float _1913 = _1889 * _1903;
        float _1915 = _1885 * _1903;
        float _1917 = abs(_1911);
        float _1919 = log2(_1917);
        float _1921 = _1893 * _1903;
        float _1923 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1925 = _816 * _1915;
        float _1927 = -_1915;
        float _1929 = -_1923;
        float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1929);
        float _1933 = fma(_812, _1913, _1925);
        float _1935 = -_1921;
        float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1931);
        float _1939 = fma(_814, _1921, _1933);
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1945 = _1937 + _1943;
        float _1947 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1949 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        float _1953 = exp2(_1947);
        float _1955 = _1953 * _1951;
        float _1957 = _1941 * _1955;
        float _1959 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1961 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1959;
        out.m_87.y = _1961;
        out.m_87.z = _1963;
    }
    out.m_89.x = _1875;
    out.m_89.y = _1877;
    out.m_89.z = _1879;
    if (!_1861)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1965;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1717 = false;
    bool _910 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2024 = as_type<float>(_126);
        out.gl_Position.z = _2024;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2092 = as_type<float>(_160);
        out.gl_Position.z = _2092;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.y;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = in.m_55.z;
    float _168 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _170 = in.m_57.x;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _174 = _172 != 0;
    float _176 = in.m_48.x;
    float _178 = in.m_48.y;
    float _180 = in.m_48.z;
    float _182 = in.m_59.w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _190 = _188 != 0;
    float _192 = _168 * _164;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _196 = _194 != 0;
    float _198 = in.m_57.y;
    float _200 = _162 * 6.283185482025146484375;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = _162 > 0.5;
    float _208 = _166 * 6.283185482025146484375;
    float _210 = fma(_170, 9.0, _200);
    float _212 = fma(_170, 8.5, _208);
    float _214 = 0.0;
    float _216 = _198;
    bool _218 = _206;
    if (!_174)
    {
        _214 = _170;
    }
    float _220 = _214;
    float _222 = fma(_144, 0.20000000298023223876953125, _210);
    float _224 = fma(_144, -0.1809999942779541015625, _212);
    float _226 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _228 = _222 * 0.15915493667125701904296875;
    float _230 = _224 * 0.15915493667125701904296875;
    float _232 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _226);
    float _234 = in.m_55.x;
    float _236 = _228 * 6.283185482025146484375;
    float _238 = sin(_236);
    float _240 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _232);
    out.m_61.w = _182;
    float _242 = _230 * 6.283185482025146484375;
    float _244 = sin(_242);
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c10)._m0[3].x, -0.25);
    float _250 = fma(_234, 1234.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _252 = _238 + _244;
    float _254 = fma(2.0, _170, -1.0);
    float _256 = fma(_252, -0.100000001490116119384765625, 0.800000011920928955078125);
    float _258 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _260 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _262 = -_254;
    float _264 = fma(_262, _254, 1.0);
    float _266 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _258);
    float _268 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _260);
    float _270 = _250 * 0.01666666753590106964111328125;
    float _272 = _256 * _264;
    float _274 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _276 = in.m_63.x;
    float _278 = in.m_63.y;
    float _280 = in.m_63.z;
    float _282 = _270 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _284 = _272 * 3.7699115276336669921875;
    float _286 = _240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _268);
    float _290 = _274 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _292 = _284 * 0.15915493667125701904296875;
    float _294 = _282 * 6.283185482025146484375;
    float _296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _298 = _286 + _296;
    float _300 = _288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = _292 * 6.283185482025146484375;
    float _304 = cos(_302);
    float _306 = -_294;
    float _308 = fma(_272, 4.523893833160400390625, _306);
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = _290 + _310;
    float _314 = _298 * _298;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _318 = _300 + _316;
    float _320 = _308 * 0.15915493667125701904296875;
    float _322 = fma(_312, _312, _314);
    float _324 = (*spvDescriptorSet0.vp_c10)._m0[3].x * 1.5;
    float _326 = fma(_318, _318, _322);
    float _328 = _320 * 6.283185482025146484375;
    float _330 = sin(_328);
    float _332 = _278 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _334 = -_248;
    float _336 = _334 + _280;
    float _338 = fma(_304, -0.5, 0.5);
    float _340 = rsqrt(_326);
    float _342 = _332 * _338;
    float _344 = in.m_65.x;
    float _346 = in.m_65.y;
    float _348 = in.m_65.z;
    float _350 = fma(_342, 0.60000002384185791015625, 0.07500000298023223876953125);
    float _352 = fma(_330, 0.5, 0.5);
    float _354 = _272 * _350;
    float _356 = fma(_324, _352, 1.0);
    float _358 = _298 * _340;
    float _360 = _312 * _340;
    float _362 = _354 * _356;
    float _364 = -_358;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _368 = -_360;
    float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _372 = 0.0 + _362;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _366 * _366;
    float _378 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = fma(_370, _370, _376);
    float _382 = _374 * 0.52359879016876220703125;
    float _384 = _318 * _340;
    float _386 = precise::max(0.0, _362);
    float _388 = -_198;
    float _390 = _388 + 1.0;
    float _392 = _382 * 0.15915493667125701904296875;
    float _394 = -_384;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _398 = precise::min(_386, 2.625);
    float _400 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _402 = _392 * 6.283185482025146484375;
    float _404 = sin(_402);
    float _406 = fma(_396, _396, _380);
    float _408 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _410 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = _220;
    float _414 = _360;
    float _416 = _300;
    if (_196)
    {
        float _418 = _206 ? _390 : _198;
        _216 = _418;
    }
    float _420 = _216;
    float _422 = fma(_398, 1.14285719394683837890625, 1.0);
    float _424 = _392 * 6.283185482025146484375;
    float _426 = cos(_424);
    float _428 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, 0.10000002384185791015625, 1.0);
    float _430 = fma(_398, -0.2857142984867095947265625, 1.0);
    float _432 = _336 * _422;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _436 = _422 * _276;
    float _438 = _432 * _430;
    float _440 = sqrt(_406);
    float _442 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[79].z, _434);
    float _444 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _446 = _438 * _404;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _454 = _234 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _456 = -_446;
    float _458 = fma(_362, _426, _456);
    float _460 = _438 * _426;
    if (_174)
    {
        bool _462 = _234 > 0.5;
        _218 = _462;
    }
    bool _464 = _218;
    float _466 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _468 = _458 * _428;
    float _470 = fma(_362, _404, _460);
    float _472 = _436 * _428;
    float _474 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = _340 * _440;
    float _478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _468);
    float _480 = _470 * _428;
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _472);
    float _484 = _408 * _476;
    float _486 = _450 * _476;
    float _488 = _474 * _476;
    float _490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _480);
    float _492 = _484 * _478;
    float _494 = _486 * _482;
    float _496 = -_452;
    float _498 = fma(_454, 2.0, _496);
    float _500 = _492 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _502 = _492 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _504 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _508 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[79].x, _442);
    float _510 = _488 * _490;
    float _512 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[8].x, _500);
    float _514 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[10].x, _502);
    float _516 = fma(_504, -2.0, _246);
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _520 = _508 * (-0.15915493667125701904296875);
    float _522 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].z, _512);
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].z, _514);
    float _526 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _518);
    int _528 = as_type<int>(_512);
    if (_174)
    {
        float _530 = -_170;
        float _532 = _530 + 1.0;
        _528 = as_type<int>(_532);
    }
    int _534 = _528;
    float _536 = _290 + _522;
    float _538 = _300 + _524;
    float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _548 = _538 + _546;
    float _550 = _536;
    float _552 = _538;
    if (_174)
    {
        float _554 = _464 ? as_type<float>(_534) : _170;
        _412 = _554;
    }
    float _556 = _412;
    float _558 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _560 = _544 * _544;
    float _562 = _548 * _548;
    float _564 = _520 * 6.283185482025146484375;
    float _566 = sin(_564);
    float _568 = fma(_558, _420, -0.5);
    float _570 = _560 + _562;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _576 = _520 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _584 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _492 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _592 = _540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _594 = sqrt(_570);
    float _596 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _466);
    float _598 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[9].x, _590);
    out.m_67.x = _584;
    out.m_67.y = _586;
    out.m_67.z = _588;
    out.m_67.w = _582;
    float _600 = fma(_592, _556, -0.5);
    float _602 = -_144;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[76].x, _498);
    float _606 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _516);
    bool _608 = _468 != 0.0;
    bool _610 = isnan(_468);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    bool _618 = _472 == 0.0;
    bool _620 = !_616;
    bool _622 = _618 && _620;
    bool _624 = _480 == 0.0;
    bool _626 = _624 && _622;
    float _628 = _566 * _568;
    float _630 = _578 * _568;
    float _632 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _526);
    float _634 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].z, _598);
    bool _636 = _594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _638 = in.m_69.x;
    float _640 = in.m_69.y;
    float _642 = in.m_69.z;
    float _644 = floor(_444);
    float _646 = -_628;
    float _648 = fma(_578, _600, _646);
    float _650 = fma(_566, _600, _630);
    float _652 = _286 + _634;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _658 = !_186;
    int _660 = _658 ? 0 : 1;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _664 = !_190;
    int _666 = _664 ? 0 : 1;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _670 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _634;
    float _678 = _560;
    float _680 = _562;
    if (!_636)
    {
        _676 = _652;
    }
    float _682 = _676;
    bool _684 = !_636;
    float _686 = _682;
    float _688 = _640;
    float _690 = _638;
    float _692 = _642;
    if (!_684)
    {
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _698 = _594 + _696;
        float _700 = rsqrt(_570);
        float _702 = _698 * _694;
        float _704 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = _702 * 0.15915493667125701904296875;
        float _708 = _706 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = fma(_710, _704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = _700 * _716;
        float _720 = _714 + (-1.0);
        float _722 = fma(_544, _718, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_548, _718, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _726 = _720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _730 = _722 + _728;
        float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _734 = _724 + _732;
        float _736 = fma(_652, _714, _726);
        float _738 = _730 * _730;
        float _740 = _734 * _734;
        _686 = _736;
        _678 = _738;
        _680 = _740;
        _550 = _722;
        _552 = _724;
    }
    float _742 = _686;
    float _744 = _678;
    float _746 = _680;
    float _748 = _550;
    float _750 = _552;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _754 = _742 + _752;
    if (!_626)
    {
        float _756 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _688 = _756;
    }
    float _758 = _688;
    float _760 = -_644;
    float _762 = _444 + _760;
    float _764 = _444 * 6.283185482025146484375;
    float _766 = fma(_754, _754, _744);
    if (!_626)
    {
        float _768 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[17].y, _638);
        _690 = _768;
    }
    float _770 = _690;
    out.m_71.x = _670;
    out.m_71.y = _672;
    out.m_71.z = _674;
    out.m_71.w = _668;
    float _772 = fma(_596, _648, _604);
    float _774 = _766 + _746;
    float _776 = _758 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _778 = _758 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _780 = _764 * 0.15915493667125701904296875;
    if (!_626)
    {
        float _782 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _692 = _782;
    }
    float _784 = _692;
    float _786 = -_606;
    float _788 = fma(_632, _650, _786);
    float _790 = sqrt(_774);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].x, _778);
    float _794 = _772 + 0.5;
    float _796 = _272 * 0.60000002384185791015625;
    int _798 = abs(_660);
    float _800 = _758 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _802 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].x, _776);
    float _804 = _780 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _788 + 0.5;
    float _810 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].x, _800);
    float _812 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _814 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    out.m_73.x = _796;
    float _816 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].z, _810);
    out.m_75.x = _794;
    out.m_75.y = _808;
    bool _818 = !_204;
    int _820 = _818 ? 0 : 1;
    out.m_77.x = _812;
    out.m_77.y = _816;
    out.m_77.z = _814;
    bool _822 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _824 = isnan(_790);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _830 = _826 || _828;
    float _832 = -_762;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _836 = float(_798);
    float _838 = fma(_806, 0.5, 0.5);
    int _840 = abs(_820);
    int _842 = abs(_666);
    float _844 = abs(_834);
    float _846 = _836 * _844;
    bool _848 = _762 < 0.5;
    float _850 = float(_848);
    float _852 = -_838;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _856 = float(_840);
    float _858 = float(_842);
    float _860 = -_850;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _864 = fma(_856, _854, _846);
    float _866 = _856;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    float _870 = _810;
    if (!_830)
    {
        _866 = 1.0;
    }
    float _872 = _866;
    float _874 = abs(_862);
    float _876 = fma(_858, _874, _864);
    bool _878 = !_830;
    float _880 = _872;
    if (!_878)
    {
        bool _882 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _884 = isnan(_790);
        bool _886 = _882 || _884;
        bool _888 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _890 = _886 || _888;
        if (!_890)
        {
            float _892 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _894 = _790 + _892;
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _902 = _900 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _904 = 1.0 / _898;
            float _906 = _894 * _904;
            float _908 = fma(_906, _902, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _880 = _908;
            _910 = true;
        }
        else
        {
            bool _912 = _790 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _914 = isnan(_790);
            bool _916 = _912 || _914;
            bool _918 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _920 = _916 || _918;
            if (!_920)
            {
                float _922 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _924 = _790 + _922;
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _926 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _934 = 1.0 / _928;
                float _936 = _924 * _934;
                float _938 = fma(_936, _932, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _880 = _938;
                _910 = true;
            }
            else
            {
                _880 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _910 = false;
    float _940 = _880;
    float _942 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _944 = _742 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _948 = _748 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _952 = _750 + _950;
    float _954 = -_360;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[18].w, _290);
    float _958 = fma(_944, _940, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _960 = fma(_948, _940, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _962 = fma(_952, _940, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _964 = -_358;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _968 = -_360;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _972 = -_384;
    float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _976 = -_384;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _966 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _970 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _974 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _998 = fma(_990, _990, _994);
    float _1000 = rsqrt(_998);
    float _1002 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _990;
    float _1024 = _992;
    float _1026 = _1020;
    float _1028 = _1012;
    if (_1016)
    {
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1030;
    }
    float _1032 = _1022;
    if (!_1016)
    {
        _414 = _1008;
    }
    float _1034 = _414;
    float _1036 = _1034;
    if (_1016)
    {
        float _1038 = rsqrt(_1012);
        _1024 = _1038;
    }
    float _1040 = _1024;
    float _1042 = _1040;
    if (_1016)
    {
        float _1044 = _1020 * _1032;
        _1026 = _1044;
    }
    float _1046 = _1026;
    if (_1016)
    {
        float _1048 = _1046 * 0.15915493667125701904296875;
        _868 = _1048;
    }
    float _1050 = _868;
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1054 = _1032;
    if (_1016)
    {
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = precise::max(0.0, _1052);
    float _1064 = -_1002;
    float _1066 = -_1062;
    float _1068 = fma(_982, _1064, _1066);
    float _1070 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1062;
    if (_1016)
    {
        float _1074 = _1050 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        _1070 = _1076;
    }
    float _1078 = _1070;
    if (_1016)
    {
        float _1080 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1080;
    }
    float _1082 = _1072;
    float _1084 = _1060;
    if (_1016)
    {
        float _1086 = fma(_1060, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1028 = _1086;
    }
    float _1088 = _1028;
    float _1090 = _1088;
    if (!_1016)
    {
        _1084 = _1004;
    }
    float _1092 = _1084;
    float _1094 = fma(_956, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1096 = _1092;
    if (_1016)
    {
        float _1098 = _1040 * _1088;
        _870 = _1098;
    }
    float _1100 = _870;
    if (!_1016)
    {
        _1090 = _1068;
    }
    float _1102 = _1090;
    float _1104 = floor(_1094);
    float _1106 = _1102;
    if (!_1016)
    {
        _1042 = _1006;
    }
    float _1108 = _1042;
    float _1110 = _1108;
    float _1112 = _1078;
    if (_1016)
    {
        float _1114 = _1078 + (-1.0);
        _416 = _1114;
    }
    float _1116 = _416;
    float _1118 = _1116;
    if (_1016)
    {
        float _1120 = _1004 * _1100;
        _1096 = _1120;
    }
    float _1122 = _1096;
    if (_1016)
    {
        float _1124 = _1006 * _1100;
        _1110 = _1124;
    }
    float _1126 = _1110;
    float _1128 = _966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1016)
    {
        float _1130 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1130;
    }
    float _1132 = _1118;
    if (_1016)
    {
        float _1134 = _1122 * _1122;
        _1036 = _1134;
    }
    float _1136 = _1036;
    if (_1016)
    {
        float _1138 = fma(_1068, _1078, _1132);
        _1106 = _1138;
    }
    float _1140 = _1106;
    if (!_1016)
    {
        _1112 = _1010;
    }
    float _1142 = _1112;
    float _1144 = _1142;
    if (_1016)
    {
        float _1146 = _1126 * _1126;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = sqrt(_998);
    float _1152 = fma(_1140, _1140, _1136);
    float _1154 = fma(_978, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1156 = _966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1158 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1128);
    float _1160 = _1152 + _1148;
    float _1162 = _966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1156);
    float _1166 = floor(_1154);
    float _1168 = _966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    float _1172 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    float _1174 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1158);
    float _1176 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1178 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1170);
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1182 = rsqrt(_1160);
    float _1184 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1190 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1188);
    float _1192 = precise::clamp(_1190, 0.0, 1.0);
    float _1194 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1200 = -_1192;
    float _1202 = _1200 + 1.0;
    float _1204 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1206 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1198);
    float _1208 = abs(_1202);
    float _1210 = log2(_1208);
    float _1212 = -_1204;
    float _1214 = fma(_1212, _996, 1.0);
    float _1216 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1206);
    float _1218 = _1182 * _1122;
    float _1220 = _1182 * _1126;
    float _1222 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1216);
    float _1224 = _1182 * _1140;
    float _1226 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1228 = -_1104;
    float _1230 = _1094 + _1228;
    float _1232 = log2(_1214);
    float _1234 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = -_1226;
    float _1238 = fma(_1224, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1236);
    float _1240 = -_1166;
    float _1242 = _1154 + _1240;
    float _1244 = _1224 + 1.0;
    float _1246 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1248 = -_1220;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1238);
    float _1252 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1254 = 1.0 / _1222;
    float _1256 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1258 = fma(_1250, -0.5, 0.5);
    float _1260 = fma(_1250, 0.5, 0.5);
    float _1262 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1252);
    float _1264 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1256);
    float _1266 = fma(_1260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1268 = exp2(_1246);
    float _1270 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1262);
    float _1272 = _1232 * 0.693147182464599609375;
    float _1274 = fma(_1260, _1266, -0.212114393711090087890625);
    float _1276 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1264);
    float _1278 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1270);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1282 = fma(_1260, _1274, 1.570728778839111328125);
    float _1284 = sqrt(_1258);
    float _1286 = _1276 * _1254;
    float _1288 = _1278 * _1254;
    float _1290 = fma(_1286, 0.5, 0.5);
    float _1292 = fma(_1288, -0.5, 0.5);
    float _1294 = -_1224;
    float _1296 = fma(_1268, _1244, _1294);
    float2 _3995 = float2(_1230, _1242);
    float _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3995, float2(0.0), isnan(_3995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3995, float2(0.0), isnan(_3995)), level(0.0)).x;
    float3 _4006 = float3(_1290, _1292, _1280);
    float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).x;
    float _1302 = fma(_1296, 0.5, 0.5);
    float _1304 = _1284 * 0.636619746685028076171875;
    float _1306 = -_1282;
    float _1308 = fma(_1304, _1306, 1.0);
    float3 _4027 = float3(_1290, _1292, _1280);
    float4 _1311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4027, float3(0.0), isnan(_4027)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4027, float3(0.0), isnan(_4027)), level(0.0)).xyzw;
    float _1313 = _1311.x;
    float _1315 = _1311.y;
    float _1317 = _1311.z;
    float _1319 = _1311.w;
    float2 _4043 = float2(_1308, _1302);
    float3 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4043, float2(0.0), isnan(_4043)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4043, float2(0.0), isnan(_4043)), level(0.0)).xyz;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = -_358;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _1335 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1337 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1339 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1343 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1335);
    float _1345 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1347 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1341);
    float _1349 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1351 = exp2(_1337);
    float _1353 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1345);
    float _1355 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1359 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1361 = 1.0 / _1357;
    float _1363 = _1359 + _1357;
    float _1365 = _1363 * _1361;
    float _1367 = _1365 * 0.5;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1371 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1369);
    float _1373 = 1.0 / _1371;
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1377 = _1373 * _1375;
    float _1379 = abs(_1377);
    float _1381 = log2(_1379);
    float _1383 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1385 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1349);
    float _1387 = in.m_79.x;
    float _1389 = _1385 + _1222;
    float _1391 = exp2(_1383);
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1278;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1222;
    float _1393 = _1389 * 0.5;
    out.m_81.z = _1393;
    out.m_81.w = _1222;
    bool _1395 = _1377 <= 8000.0;
    bool _1397 = isnan(_1377);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(8000.0);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = fma(_1409, -2.0, 3.0);
    float _1413 = _1409 * _1409;
    bool _1415 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(0.5);
    bool _1423 = _1419 || _1421;
    float _1425 = _1413 * _1411;
    float _1427 = -_1425;
    float _1429 = _1427 + 1.0;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1425);
    float _1433 = _1429;
    float _1435 = _1431;
    if (_1423)
    {
        _1433 = 1.0;
    }
    float _1437 = _1433;
    float _1439 = _1405 * _1431;
    float _1441 = _1437;
    if (_1423)
    {
        _1435 = 1.0;
    }
    float _1443 = _1435;
    float _1445 = _1443;
    float _1447 = _1319;
    if (!_1423)
    {
        float _1449 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1451 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1455;
        float _1467 = _1459 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = _1459 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = 1.0 / _1477;
        float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1483 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1481;
        float _1485 = 1.0 / _1483;
        float _1487 = _1475 * _1479;
        float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1491 = fma(_1377, _1487, _1489);
        float _1493 = _1491 * _1485;
        float _1495 = precise::clamp(_1493, 0.0, 1.0);
        _1441 = _1495;
    }
    float _1497 = _1441;
    if (!_1423)
    {
        float _1499 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1501 = _1499 * 0.15915493667125701904296875;
        float _1503 = _1501 * 6.283185482025146484375;
        float _1505 = cos(_1503);
        float _1507 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1509 = _1507 * 0.15915493667125701904296875;
        float _1511 = _1501 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = 1.0 / _1505;
        float _1517 = _1509 * 6.283185482025146484375;
        float _1519 = cos(_1517);
        float _1521 = _1513 * _1515;
        float _1523 = _1509 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519 * _1521;
        float _1529 = 1.0 / _1527;
        float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1533 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1531;
        float _1535 = 1.0 / _1533;
        float _1537 = _1525 * _1529;
        float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1541 = fma(_1377, _1537, _1539);
        float _1543 = _1541 * _1535;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = -_1545;
        float _1549 = _1547 + 1.0;
        _1445 = _1549;
    }
    float _1551 = _1445;
    float _1553 = -_1351;
    float _1555 = _1553 + 1.0;
    float _1557 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1559 = -_1298;
    float _1561 = _1559 + 1.0;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1565 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1567 = isnan(_1150);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1573 = _1569 || _1571;
    float _1575 = _1561 * _1557;
    float _1577 = precise::clamp(_1575, 0.0, 1.0);
    float _1579 = _1563 * _1300;
    float _1581 = -_1563;
    float _1583 = _1581 + 1.0;
    float _1585 = -_1577;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1589 = _1319 * _1579;
    float _1591 = _1329 * _1579;
    float _1593 = _1587 * _1387;
    float _1595 = fma(_1325, _1589, _1313);
    float _1597 = fma(_1327, _1589, _1315);
    float _1599 = _1593 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1601 = _1319 * _1583;
    float _1603 = fma(_1319, _1591, _1317);
    float _1605 = _1497 * _1551;
    float _1607 = _1583;
    float _1609 = _1593;
    float _1611 = _1589;
    float _1613 = _1563;
    float _1615 = _1605;
    if (!_1573)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1617 = _1607;
    out.m_83.x = _1599;
    float _1619 = _1617;
    float _1621 = _1617;
    if (!_1573)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1623 = _1609;
    float _1625 = _876 * _1605;
    float _1627 = _1623;
    float _1629 = _1623;
    if (!_1573)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1631 = _1611;
    out.m_85.x = _1595;
    out.m_85.y = _1597;
    out.m_85.z = _1603;
    out.m_85.w = _1601;
    float _1633 = _1631;
    float _1635 = _1631;
    if (!_1573)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1637 = _1613;
    float _1639 = _1637;
    float _1641 = _1637;
    if (!_1573)
    {
        _1447 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1643 = _1447;
    float _1645 = _1643;
    float _1647 = _1643;
    if (!_1573)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1649 = _1615;
    bool _1651 = !_1573;
    float _1653 = _1649;
    float _1655 = _1649;
    if (!_1651)
    {
        bool _1657 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1659 = isnan(_1150);
        bool _1661 = _1657 || _1659;
        bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1665 = _1661 || _1663;
        if (!_1665)
        {
            float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1669 = _1150 + _1667;
            float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1671;
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1679 = 1.0 / _1673;
            float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1683 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1697 = _1669 * _1679;
            float _1699 = precise::clamp(_1697, 0.0, 1.0);
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1705 = fma(_1699, _1677, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1707 = fma(_1699, _1703, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1709 = fma(_1699, _1683, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1711 = fma(_1699, _1687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1713 = fma(_1699, _1691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1715 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1629 = _1709;
            _1647 = _1713;
            _1621 = _1705;
            _1641 = _1711;
            _1635 = _1707;
            _1655 = _1715;
            _1717 = true;
        }
        else
        {
            bool _1719 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1721 = isnan(_1150);
            bool _1723 = _1719 || _1721;
            bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1727 = _1723 || _1725;
            if (!_1727)
            {
                _1619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1729 = _1619;
            _1621 = _1729;
            if (!_1727)
            {
                _1627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1731 = _1627;
            _1629 = _1731;
            if (!_1727)
            {
                _1633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1733 = _1633;
            _1635 = _1733;
            if (!_1727)
            {
                _1639 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1735 = _1639;
            _1641 = _1735;
            if (!_1727)
            {
                _1645 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1737 = _1645;
            _1647 = _1737;
            if (!_1727)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1739 = _1653;
            bool _1741 = !_1727;
            _1655 = _1739;
            if (!_1741)
            {
                bool _1743 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1745 = isnan(_1150);
                bool _1747 = _1743 || _1745;
                bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1751 = _1747 || _1749;
                if (!_1751)
                {
                    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1755 = _1150 + _1753;
                    float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1757;
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1765 = 1.0 / _1759;
                    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1769 = _1767 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1783 = _1755 * _1765;
                    float _1785 = precise::clamp(_1783, 0.0, 1.0);
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1791 = fma(_1785, _1763, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1793 = fma(_1785, _1789, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1795 = fma(_1785, _1769, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1797 = fma(_1785, _1773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1799 = fma(_1785, _1777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1801 = fma(_1785, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1629 = _1795;
                    _1647 = _1799;
                    _1621 = _1791;
                    _1641 = _1797;
                    _1635 = _1793;
                    _1655 = _1801;
                    _1717 = true;
                }
                else
                {
                    _1629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1647 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1641 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1717 = false;
    float _1803 = _1629;
    float _1805 = _1647;
    float _1807 = _1621;
    float _1809 = _1641;
    float _1811 = _1635;
    float _1813 = _1655;
    float _1815 = fma(_816, -0.5, 0.5);
    float _1817 = precise::clamp(_1815, 0.0, 1.0);
    float _1819 = -_1803;
    float _1821 = _1819 + _1805;
    float _1823 = _1625 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1825 = -_1807;
    float _1827 = _1825 + _1809;
    out.m_87.x = 0.0;
    float _1829 = fma(_1817, _1821, _1803);
    float _1831 = -_1811;
    float _1833 = _1831 + _1813;
    out.m_51.x = _1823;
    float _1835 = fma(_1817, _1827, _1807);
    float _1837 = _1829 * 0.586610972881317138671875;
    float _1839 = fma(_1817, _1833, _1811);
    bool _1841 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1843 = fma(_1835, 0.298911988735198974609375, _1837);
    bool _1845 = _1497 > 0.0;
    bool _1847 = isnan(_1497);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan(0.0);
    bool _1853 = _1849 || _1851;
    float _1855 = fma(_1839, 0.114477999508380889892578125, _1843);
    bool _1857 = _1551 <= 0.0;
    bool _1859 = !_1853;
    bool _1861 = _1857 || _1859;
    float _1863 = -_1855;
    float _1865 = _1835 + _1863;
    float _1867 = -_1855;
    float _1869 = _1829 + _1867;
    float _1871 = -_1855;
    float _1873 = _1839 + _1871;
    float _1875 = fma(_1865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1877 = fma(_1869, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1879 = fma(_1873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    bool _1881 = !_1841;
    if (!_1881)
    {
        float _1883 = -_966;
        float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1887 = -_970;
        float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1891 = -_974;
        float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1895 = _1885 * _1885;
        float _1897 = fma(_1889, _1889, _1895);
        float _1899 = fma(_1893, _1893, _1897);
        float _1901 = sqrt(_1899);
        float _1903 = rsqrt(_1899);
        float _1905 = -_1901;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1911 = precise::clamp(_1909, 0.0, 1.0);
        float _1913 = _1889 * _1903;
        float _1915 = _1885 * _1903;
        float _1917 = abs(_1911);
        float _1919 = log2(_1917);
        float _1921 = _1893 * _1903;
        float _1923 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1925 = _816 * _1915;
        float _1927 = -_1915;
        float _1929 = -_1923;
        float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1929);
        float _1933 = fma(_812, _1913, _1925);
        float _1935 = -_1921;
        float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1931);
        float _1939 = fma(_814, _1921, _1933);
        float _1941 = precise::clamp(_1939, 0.0, 1.0);
        float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1945 = _1937 + _1943;
        float _1947 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1949 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        float _1953 = exp2(_1947);
        float _1955 = _1953 * _1951;
        float _1957 = _1941 * _1955;
        float _1959 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1961 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1959;
        out.m_87.y = _1961;
        out.m_87.z = _1963;
    }
    out.m_89.x = _1875;
    out.m_89.y = _1877;
    out.m_89.z = _1879;
    if (!_1861)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1965;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

