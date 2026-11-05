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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c11 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _33* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_74 [[attribute(4)]];
    float4 m_64 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
    float4 m_62 [[attribute(7)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1435 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_53.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_113);
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _119;
    if (!_117)
    {
        out.m_56.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_129);
        out.gl_Position.z = _1781;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_58.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _121 = _151;
    }
    float _153 = _121;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _149;
    if (_159)
    {
        out.m_56.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1850 = as_type<float>(_165);
        out.gl_Position.z = _1850;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_60.w;
    float _169 = in.m_62.x;
    float _171 = in.m_62.y;
    float _173 = in.m_62.z;
    float _175 = in.m_64.x;
    float _177 = in.m_64.y;
    float _179 = in.m_64.z;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = trunc(_167);
    int _189 = int(_187);
    int _191 = _189 << 5;
    uint _194 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_194)];
    float _196 = as_type<float>(_dmw0.x);
    int _198 = _191 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>(_dmw0.y);
    int _204 = _191 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>(_dmw0.z);
    int _210 = _191 + 12;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>(_dmw0.w);
    float _216 = _169 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _218 = _171 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = _173 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _222 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _226 = _216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _228 = _220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _230 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _222);
    float _232 = _224 * _226;
    float _234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _236 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _179);
    float _240 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _230);
    float _242 = _234 * _236;
    float _244 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _246 = _238 * _228;
    float _248 = _240 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _250 = _242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _252 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _244);
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _256 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _258 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[10].x, _250);
    float _260 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _252);
    float _262 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[8].x, _254);
    float _264 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _256);
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _258);
    float _268 = _260 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _262);
    float _272 = _242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _274 = _248 + _266;
    float _276 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _264);
    float _278 = _268 + _270;
    float _280 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[9].x, _272);
    float _282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _284 = _274 + _282;
    float _286 = _276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _290 = _278 + _288;
    float _292 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _280);
    float _294 = _284 * _284;
    float _296 = _286 + _292;
    float _298 = fma(_290, _290, _294);
    float _300 = sqrt(_298);
    bool _302 = _300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _304 = _214 * 2.0;
    float _306 = _202 * 2.0;
    float _308 = _196 * _304;
    float _310 = -_308;
    float _312 = fma(_208, _306, _310);
    float _314 = fma(_208, _306, _308);
    float _316 = _308;
    float _318 = _296;
    float _320 = _278;
    if (!_302)
    {
        _316 = _274;
    }
    float _322 = _316;
    bool _324 = !_302;
    float _326 = _322;
    if (!_324)
    {
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _332 = _300 + _330;
        float _334 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _336 = rsqrt(_298);
        float _338 = _332 * _328;
        float _340 = _338 * 0.15915493667125701904296875;
        float _342 = _340 * 6.283185482025146484375;
        float _344 = cos(_342);
        float _346 = _340 * 6.283185482025146484375;
        float _348 = sin(_346);
        float _350 = _344 + (-1.0);
        float _352 = fma(_348, _334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _354 = _350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _356 = _336 * _352;
        float _358 = fma(_296, _344, _354);
        float _360 = fma(_290, _356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _362 = fma(_284, _356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _318 = _358;
        _320 = _360;
        _326 = _362;
    }
    float _364 = _318;
    float _366 = _320;
    float _368 = _326;
    float _370 = -_286;
    float _372 = _370 + _364;
    float _374 = _196 * _196;
    float _376 = -_268;
    float _378 = _376 + _366;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = _196 * 2.0;
    float _384 = _208 * _304;
    float _386 = _208 * _208;
    float _388 = fma(_374, -2.0, 1.0);
    float _390 = -_248;
    float _392 = _390 + _368;
    float _394 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _396 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].y, _380);
    float _398 = -_384;
    float _400 = fma(_202, _382, _398);
    float _402 = _202 * _304;
    float _404 = fma(_202, _382, _384);
    float _406 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _408 = _202 * _202;
    float _410 = fma(_386, -2.0, _388);
    float _412 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _414 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].y, _396);
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _406);
    float _418 = fma(_408, -2.0, 1.0);
    float _420 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _412);
    float _422 = _414 * _410;
    float _424 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _426 = fma(_386, -2.0, _418);
    float _428 = _414 * _400;
    float _430 = fma(_420, _404, _422);
    float _432 = fma(_208, _382, _402);
    float _434 = -_402;
    float _436 = fma(_208, _382, _434);
    float _438 = _414 * _314;
    float _440 = fma(_420, _426, _428);
    float _442 = fma(_424, _312, _430);
    float _444 = fma(_408, -2.0, _388);
    float _446 = fma(_420, _436, _438);
    float _448 = fma(_424, _432, _440);
    float _450 = _286 + _442;
    float _452 = fma(_424, _444, _446);
    float _454 = _268 + _448;
    float _456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _458 = _450 + _456;
    float _460 = _450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _462 = _248 + _452;
    float _464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _466 = _454 + _464;
    float _468 = _458 * _458;
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _460);
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = _462 + _472;
    float _476 = fma(_466, _466, _468);
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _470);
    float _480 = fma(_474, _474, _476);
    float _482 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _484 = _478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _486 = rsqrt(_480);
    float _488 = sqrt(_480);
    float _490 = _466 * _486;
    float _492 = _474 * _486;
    float _494 = _458 * _486;
    float _496 = _490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _500 = _496 * _496;
    float _502 = _498 * _498;
    float _504 = _500 + _502;
    float _506 = sqrt(_504);
    bool _508 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = _506 + _510;
    float _514 = _452;
    float _516 = _504;
    float _518 = _512;
    float _520 = _388;
    if (_508)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _522;
    }
    float _524 = _514;
    if (_508)
    {
        float _526 = rsqrt(_504);
        _516 = _526;
    }
    float _528 = _516;
    if (_508)
    {
        float _530 = _512 * _524;
        _518 = _530;
    }
    float _532 = _518;
    float _534 = 0.0;
    if (_508)
    {
        float _536 = _532 * 0.15915493667125701904296875;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = _442;
    float _542 = _538;
    if (_508)
    {
        float _544 = _538 * 6.283185482025146484375;
        float _546 = sin(_544);
        _540 = _546;
    }
    float _548 = _540;
    float _550 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _552 = precise::max(0.0, _550);
    float _554 = _524;
    float _556 = _552;
    float _558 = _550;
    if (_508)
    {
        float _560 = _538 * 6.283185482025146484375;
        float _562 = cos(_560);
        _554 = _562;
    }
    float _564 = _554;
    float _566 = -_494;
    float _568 = -_552;
    float _570 = fma(_566, (*spvDescriptorSet0.vp_c15)._m0[24].y, _568);
    float _572 = _570;
    if (_508)
    {
        float _574 = _570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _556 = _574;
    }
    float _576 = _556;
    float _578 = _576;
    float _580 = _548;
    if (_508)
    {
        float _582 = fma(_548, _576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _520 = _582;
    }
    float _584 = _520;
    float _586 = _584;
    if (!_508)
    {
        _578 = _496;
    }
    float _588 = _578;
    float _590 = _588;
    float _592 = _564;
    if (_508)
    {
        float _594 = _564 + (-1.0);
        _558 = _594;
    }
    float _596 = _558;
    float _598 = _596;
    if (_508)
    {
        float _600 = _528 * _584;
        _542 = _600;
    }
    float _602 = _542;
    if (!_508)
    {
        _586 = _502;
    }
    float _604 = _586;
    float _606 = _604;
    if (_508)
    {
        float _608 = _596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _580 = _608;
    }
    float _610 = _580;
    if (_508)
    {
        float _612 = _496 * _602;
        _590 = _612;
    }
    float _614 = _590;
    if (!_508)
    {
        _598 = _498;
    }
    float _616 = _598;
    float _618 = _616;
    if (_508)
    {
        float _620 = _498 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (_508)
    {
        float _624 = fma(_570, _564, _610);
        _572 = _624;
    }
    float _626 = _572;
    if (!_508)
    {
        _592 = _500;
    }
    float _628 = _592;
    float _630 = _628;
    if (_508)
    {
        float _632 = _614 * _614;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = fma(_268, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _638 = _636;
    if (_508)
    {
        float _640 = _622 * _622;
        _606 = _640;
    }
    float _642 = _606;
    float _644 = fma(_626, _626, _634);
    float _646 = _450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _648 = floor(_636);
    float _650 = _644 + _642;
    float _652 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _646);
    float _654 = fma(_248, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _656 = _450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _666 = _662 || _664;
    float _668 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _652);
    float _670 = _450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _672 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _674 = rsqrt(_650);
    float _676 = _668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _670);
    float _680 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _672);
    float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _684 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _678);
    float _686 = _680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _688 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _690 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _688);
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = -_682;
    float _696 = fma(_694, _482, 1.0);
    float _698 = _684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _700 = _686 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _702 = -_692;
    float _704 = _702 + 1.0;
    float _706 = floor(_654);
    float _708 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _700);
    float _710 = _674 * _614;
    bool _712 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _714 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.5);
    bool _720 = _716 || _718;
    float _722 = _674 * _626;
    float _724 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _708);
    float _726 = _710 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _728 = log2(_696);
    float _730 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[7].w, _724);
    float _732 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _734 = _674 * _622;
    float _736 = -_726;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _736);
    float _740 = 0.0;
    float _742 = _730;
    if (!_666)
    {
        _740 = 1.0;
    }
    float _744 = _740;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _746);
    float _750 = abs(_704);
    float _752 = log2(_750);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].z, _754);
    float _758 = -_734;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _738);
    float _762 = 1.0 / _730;
    bool _764 = !_666;
    float _766 = _744;
    if (!_764)
    {
        float _768 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        float _770 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _756);
        float _772 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _748);
        float _774 = precise::min(_768, 20.0);
        float _776 = _248 + _770;
        float _778 = _268 + _772;
        float _780 = -_776;
        float _782 = _780 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _784 = 1.0 / _774;
        float _786 = -_778;
        float _788 = _786 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _790 = precise::min(_776, _782);
        float _792 = precise::min(_778, _788);
        float _794 = precise::min(_790, _792);
        float _796 = _794 * _784;
        float _798 = precise::clamp(_796, 0.0, 1.0);
        _766 = _798;
    }
    float _800 = _766;
    float _802 = _686 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _804 = fma(_760, -0.5, 0.5);
    float _806 = 0.0;
    float _808 = _804;
    if (_720)
    {
        _806 = 1.0;
    }
    float _810 = _806;
    float _812 = _810;
    if (!_720)
    {
        float _814 = in.m_66.w;
        int _816 = as_type<int>(_814) << 24;
        int _818 = as_type<int>(_814) << 16;
        int _820 = _816 >> 24;
        int _822 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        int _824 = as_type<int>(_814) << 8;
        int _826 = _818 >> 24;
        int _828 = _824 >> 24;
        int _830 = as_type<int>(_814) >> 24;
        float _832 = float(_826);
        float _834 = float(_828);
        float _836 = float(_830);
        float _838 = _832 * 0.0078740157186985015869140625;
        float _840 = float(_820);
        float _842 = _834 * 0.0078740157186985015869140625;
        bool _844 = _822 == 4;
        float _846 = _836 * 0.0078740157186985015869140625;
        float _848 = _840 * 0.0078740157186985015869140625;
        bool _850 = _822 == 8;
        bool _852 = _822 == 12;
        float _854 = precise::min(_838, 1.0);
        float _856 = precise::min(_842, 1.0);
        float _858 = precise::min(_846, 1.0);
        float _860 = precise::min(_848, 1.0);
        float _862 = precise::max(_854, -1.0);
        float _864 = precise::max(_856, -1.0);
        float _866 = precise::max(_858, -1.0);
        float _868 = precise::max(_860, -1.0);
        float _870 = _868;
        if (_844)
        {
            _870 = _862;
        }
        float _872 = _870;
        float _874 = _872;
        if (_850)
        {
            _874 = _864;
        }
        float _876 = _874;
        float _878 = _876;
        if (_852)
        {
            _878 = _866;
        }
        float _880 = _878;
        float _882 = abs(_880);
        float _884 = (-0.0) + _882;
        _812 = _884;
    }
    float _886 = _812;
    float _888 = _686 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _890 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _802);
    bool _892 = _886 != 0.0;
    bool _894 = isnan(_886);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = fma(_760, 0.5, 0.5);
    float _904 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _888);
    float _906 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _890);
    float _908 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _910 = sqrt(_804);
    float _912 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _904);
    float _914 = fma(_902, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _916 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[4].w, _906);
    float _918 = -_648;
    float _920 = _636 + _918;
    float _922 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[5].w, _912);
    float _924 = -_706;
    float _926 = _654 + _924;
    float _928 = fma(_902, _914, -0.212114393711090087890625);
    float _930 = exp2(_908);
    float _932 = _922;
    if (_900)
    {
        _808 = _916;
    }
    float _934 = _808;
    float _936 = _728 * 0.693147182464599609375;
    float _938 = _934;
    if (_900)
    {
        _638 = _922;
    }
    float _940 = _638;
    float _942 = _722 + 1.0;
    float _944 = _940;
    if (!_900)
    {
        _938 = 0.0;
    }
    float _946 = _938;
    float2 _3120 = float2(_920, _926);
    float _948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3120, float2(0.0), isnan(_3120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3120, float2(0.0), isnan(_3120)), level(0.0)).x;
    if (!_900)
    {
        _944 = 0.0;
    }
    float _950 = _944;
    float _952 = fma(_902, _928, 1.570728778839111328125);
    float _954 = _910 * 0.636619746685028076171875;
    float _956 = _762 * _946;
    float _958 = _762 * _950;
    float _960 = _936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _962 = fma(_956, 0.5, 0.5);
    float _964 = -_952;
    float _966 = fma(_954, _964, 1.0);
    float _968 = fma(_958, -0.5, 0.5);
    float _970 = -_722;
    float _972 = fma(_930, _942, _970);
    float3 _3168 = float3(_962, _968, _960);
    float _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3168, float3(0.0), isnan(_3168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3168, float3(0.0), isnan(_3168)), level(0.0)).x;
    float3 _3179 = float3(_962, _968, _960);
    float4 _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3179, float3(0.0), isnan(_3179)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3179, float3(0.0), isnan(_3179)), level(0.0)).xyzw;
    float _979 = _977.x;
    float _981 = _977.y;
    float _983 = _977.z;
    float _985 = _977.w;
    float _987 = fma(_972, 0.5, 0.5);
    float2 _3197 = float2(_966, _987);
    float3 _991 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3197, float2(0.0), isnan(_3197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3197, float2(0.0), isnan(_3197)), level(0.0)).xyz;
    float _993 = _991.x;
    float _995 = _991.y;
    float _997 = _991.z;
    float _999 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1001 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1003 = in.m_68.x;
    float _1005 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[11].x, _999);
    float _1007 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1001);
    float _1009 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1011 = fma(_248, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1005);
    float _1013 = fma(_248, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1007);
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1017 = _1015 != 0;
    float _1019 = in.m_68.y;
    float _1021 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1025 = _177 != 0.0;
    bool _1027 = isnan(_177);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan(0.0);
    bool _1033 = _1029 || _1031;
    float _1035 = in.m_70.y;
    float _1037 = 1.0 / _1021;
    float _1039 = _1023 + _1021;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1043 = _1041 != 0;
    out.m_72.x = _454;
    out.m_72.y = _450;
    out.m_72.z = _462;
    float _1045 = _962;
    float _1047 = _1019;
    float _1049 = _1003;
    if (_1017)
    {
        float _1051 = in.m_70.x;
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = exp2(_1009);
    bool _1057 = _175 == 0.0;
    bool _1059 = !_1033;
    bool _1061 = _1057 && _1059;
    float _1063 = _1039 * _1037;
    float _1065 = _1063 * 0.5;
    bool _1067 = _179 == 0.0;
    bool _1069 = _1067 && _1061;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1073);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1079 = _1035 > 0.5;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1083 = -_1055;
    float _1085 = _1083 + 1.0;
    float _1087 = 1.0 / _1075;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1091 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1097 = _1053 > 0.5;
    bool _1099 = _1097 && _1017;
    float _1101 = -_1019;
    float _1103 = _1101 + 1.0;
    float _1105 = in.m_74.x;
    float _1107 = in.m_74.y;
    float _1109 = in.m_74.z;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1043)
    {
        float _1115 = _1079 ? _1103 : _1019;
        _1047 = _1115;
    }
    float _1117 = _1047;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1121 = _1087 * _1119;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1129 = abs(_1121);
    float _1131 = log2(_1129);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1017)
    {
        _1113 = _1003;
    }
    float _1135 = _1113;
    float _1137 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1135;
    if (_1099)
    {
        float _1147 = -_1135;
        float _1149 = _1147 + 1.0;
        _1145 = _1149;
    }
    float _1151 = _1145;
    out.m_76.x = _1091;
    out.m_76.y = _1137;
    out.m_76.z = _1139;
    out.m_76.w = _1089;
    bool _1153 = _1121 <= 8000.0;
    bool _1155 = isnan(_1121);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(8000.0);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1107;
    float _1167 = _1105;
    float _1169 = _1109;
    if (!_1069)
    {
        float _1171 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1107);
        _1165 = _1171;
    }
    float _1173 = _1165;
    if (_1017)
    {
        _1049 = _1151;
    }
    float _1175 = _1049;
    out.m_78.x = _1141;
    out.m_78.y = _1143;
    out.m_78.z = _1093;
    if (!_1069)
    {
        float _1177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1105);
        _1167 = _1177;
    }
    float _1179 = _1167;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1069)
    {
        float _1183 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1109);
        _1169 = _1183;
    }
    float _1185 = _1169;
    float _1187 = _686 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1189 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1191 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1193 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1195 = isnan(_488);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1201 = _1197 || _1199;
    float _1203 = exp2(_1181);
    float _1205 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1207 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1209 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1211 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1187);
    float _1213 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1205);
    float _1215 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1207);
    float _1217 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1209);
    float _1219 = _1189 * _1111;
    float _1221 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1213);
    float _1223 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1215);
    float _1225 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1217);
    float _1227 = _1191 * _1071;
    float _1229 = _1221 * _400;
    float _1231 = _1221 * _410;
    float _1233 = _1221 * _314;
    float _1235 = fma(_1203, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1237 = precise::clamp(_1235, 0.0, 1.0);
    float _1239 = in.m_66.x;
    float _1241 = fma(_1223, _404, _1231);
    float _1243 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1245 = fma(_1237, -2.0, 3.0);
    float _1247 = _1237 * _1237;
    float _1249 = fma(_1223, _426, _1229);
    float _1251 = _1243 * _886;
    float _1253 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1211);
    float _1255 = _1247 * _1245;
    float _1257 = fma(_1225, _312, _1241);
    float _1259 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1253);
    float _1261 = -_1255;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1223, _436, _1233);
    float _1267 = _1259 + _730;
    float _1269 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1255);
    out.gl_Position.x = _916;
    out.gl_Position.y = _922;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _730;
    int _1271 = as_type<int>(_1263);
    float _1273 = _1259;
    if (!_900)
    {
        float _1275 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1271 = as_type<int>(_1275);
    }
    int _1277 = _1271;
    float _1279 = _1267 * 0.5;
    float _1281 = _1163 * _1269;
    float _1283 = fma(_1225, _432, _1249);
    float _1285 = fma(_1225, _444, _1265);
    out.m_80.x = _1227;
    out.m_80.y = _1219;
    float _1287 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.z = _1279;
    out.m_82.w = _730;
    float _1289 = -_1095;
    float _1291 = _1289 + 1.0;
    out.m_84.x = _1283;
    out.m_84.y = _1257;
    out.m_84.z = _1285;
    float _1293 = as_type<float>(_1277);
    float _1295 = 0.0;
    float _1297 = 0.0;
    float _1299 = _1291;
    if (!_1201)
    {
        _742 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1301 = _742;
    float _1303 = _1301;
    float _1305 = _1301;
    if (!_1201)
    {
        _1273 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1307 = _1273;
    float _1309 = _1307;
    float _1311 = _1307;
    if (!_900)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3776 = as_type<float>(_1277);
        out.gl_Position.z = _3776;
    }
    if (!_1201)
    {
        _932 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1313 = _932;
    float _1315 = _1313;
    float _1317 = _1313;
    if (_900)
    {
        _1293 = _1251;
    }
    float _1319 = _1293;
    float _1321 = _1319;
    if (!_900)
    {
        _1321 = 0.0;
    }
    float _1323 = _1321;
    if (!_1201)
    {
        _1295 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1325 = _1295;
    float _1327 = _1325;
    float _1329 = _1325;
    if (!_1201)
    {
        _1297 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1331 = _1297;
    float _1333 = -_948;
    float _1335 = _1333 + 1.0;
    float _1337 = _1335 * _1287;
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = -_1339;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1345 = _1343 * _1239;
    float _1347 = _1095 * _974;
    float _1349 = _985 * _1291;
    float _1351 = _1345 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1353 = _1331;
    float _1355 = _1331;
    if (!_1201)
    {
        _1299 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1357 = _1299;
    float _1359 = _985 * _1347;
    float _1361 = _997 * _1347;
    out.m_86.x = _1351;
    float _1363 = fma(_993, _1359, _979);
    float _1365 = fma(_995, _1359, _981);
    float _1367 = fma(_985, _1361, _983);
    out.m_88.x = _1363;
    out.m_88.y = _1365;
    out.m_88.z = _1367;
    out.m_88.w = _1349;
    bool _1369 = !_1201;
    float _1371 = _1357;
    float _1373 = _1357;
    if (!_1369)
    {
        bool _1375 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1377 = isnan(_488);
        bool _1379 = _1375 || _1377;
        bool _1381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1383 = _1379 || _1381;
        if (!_1383)
        {
            float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1387 = _488 + _1385;
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1391 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1389;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1397 = 1.0 / _1391;
            float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1401 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1405 = _1403 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1409 = _1407 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1413 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1415 = _1387 * _1397;
            float _1417 = precise::clamp(_1415, 0.0, 1.0);
            float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1421 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1423 = fma(_1417, _1395, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1425 = fma(_1417, _1421, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1427 = fma(_1417, _1401, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1429 = fma(_1417, _1405, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1431 = fma(_1417, _1409, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1433 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1355 = _1427;
            _1317 = _1431;
            _1329 = _1423;
            _1311 = _1429;
            _1305 = _1425;
            _1373 = _1433;
            _1435 = true;
        }
        else
        {
            bool _1437 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1439 = isnan(_488);
            bool _1441 = _1437 || _1439;
            bool _1443 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1445 = _1441 || _1443;
            if (!_1445)
            {
                _1327 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1447 = _1327;
            _1329 = _1447;
            if (!_1445)
            {
                _1353 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1449 = _1353;
            _1355 = _1449;
            if (!_1445)
            {
                _1303 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1451 = _1303;
            _1305 = _1451;
            if (!_1445)
            {
                _1309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1453 = _1309;
            _1311 = _1453;
            if (!_1445)
            {
                _1315 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1455 = _1315;
            _1317 = _1455;
            if (!_1445)
            {
                _1371 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1457 = _1371;
            bool _1459 = !_1445;
            _1373 = _1457;
            if (!_1459)
            {
                bool _1461 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1463 = isnan(_488);
                bool _1465 = _1461 || _1463;
                bool _1467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1469 = _1465 || _1467;
                if (!_1469)
                {
                    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1473 = _488 + _1471;
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1475;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1483 = 1.0 / _1477;
                    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1491 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1495 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1499 = _1497 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1501 = _1473 * _1483;
                    float _1503 = precise::clamp(_1501, 0.0, 1.0);
                    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1507 = _1505 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1509 = fma(_1503, _1481, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1511 = fma(_1503, _1507, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1513 = fma(_1503, _1487, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1515 = fma(_1503, _1491, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1517 = fma(_1503, _1495, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1519 = fma(_1503, _1499, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1355 = _1513;
                    _1317 = _1517;
                    _1329 = _1509;
                    _1311 = _1515;
                    _1305 = _1511;
                    _1373 = _1519;
                    _1435 = true;
                }
                else
                {
                    _1355 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1317 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1329 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1305 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1373 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1435 = false;
    float _1521 = _1355;
    float _1523 = _1317;
    float _1525 = _1329;
    float _1527 = _1311;
    float _1529 = _1305;
    float _1531 = _1373;
    float _1533 = fma(_1257, -0.5, 0.5);
    float _1535 = precise::clamp(_1533, 0.0, 1.0);
    float _1537 = -_1521;
    float _1539 = _1537 + _1523;
    float _1541 = -_1525;
    float _1543 = _1541 + _1527;
    float _1545 = -_1529;
    float _1547 = _1545 + _1531;
    bool _1549 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1551 = fma(_1535, _1539, _1521);
    float _1553 = fma(_1535, _1543, _1525);
    float _1555 = fma(_1535, _1547, _1529);
    float _1557 = _1323 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1559 = _1551 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _1561 = fma(_1553, 0.298911988735198974609375, _1559);
    out.m_86.w = _1557;
    float _1563 = fma(_1555, 0.114477999508380889892578125, _1561);
    out.m_56.x = 1.0;
    float _1565 = -_1563;
    float _1567 = _1553 + _1565;
    float _1569 = -_1563;
    float _1571 = _1551 + _1569;
    float _1573 = -_1563;
    float _1575 = _1555 + _1573;
    float _1577 = fma(_1567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    float _1579 = fma(_1571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    float _1581 = fma(_1575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    out.m_92.x = 0.0;
    out.m_94.x = _1577;
    out.m_94.y = _1579;
    out.m_94.z = _1581;
    if (!_1549)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1583 = -_450;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1587 = -_454;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1591 = -_462;
    float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1595 = _1585 * _1585;
    float _1597 = fma(_1589, _1589, _1595);
    float _1599 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1601 = precise::clamp(_1599, 0.0, 1.0);
    float _1603 = fma(_1593, _1593, _1597);
    float _1605 = _1601 * _1601;
    float _1607 = rsqrt(_1603);
    float _1609 = _1585 * _1607;
    float _1611 = _1589 * _1607;
    float _1613 = _1593 * _1607;
    float _1615 = sqrt(_1603);
    float _1617 = -_494;
    float _1619 = _1617 + _1609;
    float _1621 = -_490;
    float _1623 = _1621 + _1611;
    float _1625 = -_492;
    float _1627 = _1625 + _1613;
    float _1629 = _1619 * _1619;
    float _1631 = fma(_1623, _1623, _1629);
    float _1633 = fma(_1627, _1627, _1631);
    float _1635 = -_1615;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1639 = rsqrt(_1633);
    float _1641 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1643 = precise::clamp(_1641, 0.0, 1.0);
    float _1645 = abs(_1643);
    float _1647 = log2(_1645);
    float _1649 = _1605 + (-1.0);
    float _1651 = _1619 * _1639;
    float _1653 = _1623 * _1639;
    float _1655 = _1627 * _1639;
    float _1657 = _1257 * _1651;
    float _1659 = _1257 * _1609;
    float _1661 = fma(_1283, _1653, _1657);
    float _1663 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1665 = fma(_1283, _1611, _1659);
    float _1667 = fma(_1285, _1655, _1661);
    float _1669 = precise::clamp(_1667, 0.0, 1.0);
    float _1671 = fma(_1285, _1613, _1665);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = exp2(_1663);
    float _1677 = _1669 * _1669;
    float _1679 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1681 = fma(_1677, _1649, 1.0);
    float _1683 = -_1609;
    float _1685 = -_1679;
    float _1687 = fma(_1683, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1685);
    float _1689 = _1681 * _1681;
    float _1691 = -_1613;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1687);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1697 = _1693 + _1695;
    float _1699 = 1.0 / _1689;
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = _1675 * _1703;
    float _1707 = _1673 * _1705;
    float _1709 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1711 = _1605 * _1699;
    float _1713 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1715 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _1717 = _1707 * _1711;
    out.m_90.x = _1709;
    out.m_90.y = _1713;
    out.m_90.z = _1715;
    float _1719 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1721 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1723 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _1719;
    out.m_92.y = _1721;
    out.m_92.z = _1723;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1435 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_53.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_113);
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _119;
    if (!_117)
    {
        out.m_56.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_129);
        out.gl_Position.z = _1781;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_58.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _121 = _151;
    }
    float _153 = _121;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _149;
    if (_159)
    {
        out.m_56.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1850 = as_type<float>(_165);
        out.gl_Position.z = _1850;
    }
    if (_159)
    {
        return out;
    }
    float _167 = in.m_60.w;
    float _169 = in.m_62.x;
    float _171 = in.m_62.y;
    float _173 = in.m_62.z;
    float _175 = in.m_64.x;
    float _177 = in.m_64.y;
    float _179 = in.m_64.z;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = trunc(_167);
    int _189 = int(_187);
    int _191 = _189 << 5;
    uint _194 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_194)];
    float _196 = as_type<float>(_dmw0.x);
    int _198 = _191 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>(_dmw0.y);
    int _204 = _191 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>(_dmw0.z);
    int _210 = _191 + 12;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>(_dmw0.w);
    float _216 = _169 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _218 = _171 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = _173 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _222 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _226 = _216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _228 = _220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _230 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _222);
    float _232 = _224 * _226;
    float _234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _236 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _179);
    float _240 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _230);
    float _242 = _234 * _236;
    float _244 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _246 = _238 * _228;
    float _248 = _240 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _250 = _242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _252 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _244);
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _256 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _258 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[10].x, _250);
    float _260 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _252);
    float _262 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[8].x, _254);
    float _264 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _256);
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _258);
    float _268 = _260 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _262);
    float _272 = _242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _274 = _248 + _266;
    float _276 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _264);
    float _278 = _268 + _270;
    float _280 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[9].x, _272);
    float _282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _284 = _274 + _282;
    float _286 = _276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _290 = _278 + _288;
    float _292 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _280);
    float _294 = _284 * _284;
    float _296 = _286 + _292;
    float _298 = fma(_290, _290, _294);
    float _300 = sqrt(_298);
    bool _302 = _300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _304 = _214 * 2.0;
    float _306 = _202 * 2.0;
    float _308 = _196 * _304;
    float _310 = -_308;
    float _312 = fma(_208, _306, _310);
    float _314 = fma(_208, _306, _308);
    float _316 = _308;
    float _318 = _296;
    float _320 = _278;
    if (!_302)
    {
        _316 = _274;
    }
    float _322 = _316;
    bool _324 = !_302;
    float _326 = _322;
    if (!_324)
    {
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _332 = _300 + _330;
        float _334 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _336 = rsqrt(_298);
        float _338 = _332 * _328;
        float _340 = _338 * 0.15915493667125701904296875;
        float _342 = _340 * 6.283185482025146484375;
        float _344 = cos(_342);
        float _346 = _340 * 6.283185482025146484375;
        float _348 = sin(_346);
        float _350 = _344 + (-1.0);
        float _352 = fma(_348, _334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _354 = _350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _356 = _336 * _352;
        float _358 = fma(_296, _344, _354);
        float _360 = fma(_290, _356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _362 = fma(_284, _356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _318 = _358;
        _320 = _360;
        _326 = _362;
    }
    float _364 = _318;
    float _366 = _320;
    float _368 = _326;
    float _370 = -_286;
    float _372 = _370 + _364;
    float _374 = _196 * _196;
    float _376 = -_268;
    float _378 = _376 + _366;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = _196 * 2.0;
    float _384 = _208 * _304;
    float _386 = _208 * _208;
    float _388 = fma(_374, -2.0, 1.0);
    float _390 = -_248;
    float _392 = _390 + _368;
    float _394 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _396 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].y, _380);
    float _398 = -_384;
    float _400 = fma(_202, _382, _398);
    float _402 = _202 * _304;
    float _404 = fma(_202, _382, _384);
    float _406 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _408 = _202 * _202;
    float _410 = fma(_386, -2.0, _388);
    float _412 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _414 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].y, _396);
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _406);
    float _418 = fma(_408, -2.0, 1.0);
    float _420 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _412);
    float _422 = _414 * _410;
    float _424 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _426 = fma(_386, -2.0, _418);
    float _428 = _414 * _400;
    float _430 = fma(_420, _404, _422);
    float _432 = fma(_208, _382, _402);
    float _434 = -_402;
    float _436 = fma(_208, _382, _434);
    float _438 = _414 * _314;
    float _440 = fma(_420, _426, _428);
    float _442 = fma(_424, _312, _430);
    float _444 = fma(_408, -2.0, _388);
    float _446 = fma(_420, _436, _438);
    float _448 = fma(_424, _432, _440);
    float _450 = _286 + _442;
    float _452 = fma(_424, _444, _446);
    float _454 = _268 + _448;
    float _456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _458 = _450 + _456;
    float _460 = _450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _462 = _248 + _452;
    float _464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _466 = _454 + _464;
    float _468 = _458 * _458;
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _460);
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = _462 + _472;
    float _476 = fma(_466, _466, _468);
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _470);
    float _480 = fma(_474, _474, _476);
    float _482 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _484 = _478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _486 = rsqrt(_480);
    float _488 = sqrt(_480);
    float _490 = _466 * _486;
    float _492 = _474 * _486;
    float _494 = _458 * _486;
    float _496 = _490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _500 = _496 * _496;
    float _502 = _498 * _498;
    float _504 = _500 + _502;
    float _506 = sqrt(_504);
    bool _508 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = _506 + _510;
    float _514 = _452;
    float _516 = _504;
    float _518 = _512;
    float _520 = _388;
    if (_508)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _522;
    }
    float _524 = _514;
    if (_508)
    {
        float _526 = rsqrt(_504);
        _516 = _526;
    }
    float _528 = _516;
    if (_508)
    {
        float _530 = _512 * _524;
        _518 = _530;
    }
    float _532 = _518;
    float _534 = 0.0;
    if (_508)
    {
        float _536 = _532 * 0.15915493667125701904296875;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = _442;
    float _542 = _538;
    if (_508)
    {
        float _544 = _538 * 6.283185482025146484375;
        float _546 = sin(_544);
        _540 = _546;
    }
    float _548 = _540;
    float _550 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _552 = precise::max(0.0, _550);
    float _554 = _524;
    float _556 = _552;
    float _558 = _550;
    if (_508)
    {
        float _560 = _538 * 6.283185482025146484375;
        float _562 = cos(_560);
        _554 = _562;
    }
    float _564 = _554;
    float _566 = -_494;
    float _568 = -_552;
    float _570 = fma(_566, (*spvDescriptorSet0.vp_c15)._m0[24].y, _568);
    float _572 = _570;
    if (_508)
    {
        float _574 = _570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _556 = _574;
    }
    float _576 = _556;
    float _578 = _576;
    float _580 = _548;
    if (_508)
    {
        float _582 = fma(_548, _576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _520 = _582;
    }
    float _584 = _520;
    float _586 = _584;
    if (!_508)
    {
        _578 = _496;
    }
    float _588 = _578;
    float _590 = _588;
    float _592 = _564;
    if (_508)
    {
        float _594 = _564 + (-1.0);
        _558 = _594;
    }
    float _596 = _558;
    float _598 = _596;
    if (_508)
    {
        float _600 = _528 * _584;
        _542 = _600;
    }
    float _602 = _542;
    if (!_508)
    {
        _586 = _502;
    }
    float _604 = _586;
    float _606 = _604;
    if (_508)
    {
        float _608 = _596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _580 = _608;
    }
    float _610 = _580;
    if (_508)
    {
        float _612 = _496 * _602;
        _590 = _612;
    }
    float _614 = _590;
    if (!_508)
    {
        _598 = _498;
    }
    float _616 = _598;
    float _618 = _616;
    if (_508)
    {
        float _620 = _498 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (_508)
    {
        float _624 = fma(_570, _564, _610);
        _572 = _624;
    }
    float _626 = _572;
    if (!_508)
    {
        _592 = _500;
    }
    float _628 = _592;
    float _630 = _628;
    if (_508)
    {
        float _632 = _614 * _614;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = fma(_268, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _638 = _636;
    if (_508)
    {
        float _640 = _622 * _622;
        _606 = _640;
    }
    float _642 = _606;
    float _644 = fma(_626, _626, _634);
    float _646 = _450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _648 = floor(_636);
    float _650 = _644 + _642;
    float _652 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _646);
    float _654 = fma(_248, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _656 = _450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _666 = _662 || _664;
    float _668 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _652);
    float _670 = _450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _672 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _674 = rsqrt(_650);
    float _676 = _668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _670);
    float _680 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _672);
    float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _684 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _678);
    float _686 = _680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _688 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _690 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _688);
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = -_682;
    float _696 = fma(_694, _482, 1.0);
    float _698 = _684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _700 = _686 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _702 = -_692;
    float _704 = _702 + 1.0;
    float _706 = floor(_654);
    float _708 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _700);
    float _710 = _674 * _614;
    bool _712 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _714 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.5);
    bool _720 = _716 || _718;
    float _722 = _674 * _626;
    float _724 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _708);
    float _726 = _710 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _728 = log2(_696);
    float _730 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[7].w, _724);
    float _732 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _734 = _674 * _622;
    float _736 = -_726;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _736);
    float _740 = 0.0;
    float _742 = _730;
    if (!_666)
    {
        _740 = 1.0;
    }
    float _744 = _740;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _746);
    float _750 = abs(_704);
    float _752 = log2(_750);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].z, _754);
    float _758 = -_734;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _738);
    float _762 = 1.0 / _730;
    bool _764 = !_666;
    float _766 = _744;
    if (!_764)
    {
        float _768 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        float _770 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _756);
        float _772 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _748);
        float _774 = precise::min(_768, 20.0);
        float _776 = _248 + _770;
        float _778 = _268 + _772;
        float _780 = -_776;
        float _782 = _780 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _784 = 1.0 / _774;
        float _786 = -_778;
        float _788 = _786 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _790 = precise::min(_776, _782);
        float _792 = precise::min(_778, _788);
        float _794 = precise::min(_790, _792);
        float _796 = _794 * _784;
        float _798 = precise::clamp(_796, 0.0, 1.0);
        _766 = _798;
    }
    float _800 = _766;
    float _802 = _686 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _804 = fma(_760, -0.5, 0.5);
    float _806 = 0.0;
    float _808 = _804;
    if (_720)
    {
        _806 = 1.0;
    }
    float _810 = _806;
    float _812 = _810;
    if (!_720)
    {
        float _814 = in.m_66.w;
        int _816 = as_type<int>(_814) << 24;
        int _818 = as_type<int>(_814) << 16;
        int _820 = _816 >> 24;
        int _822 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        int _824 = as_type<int>(_814) << 8;
        int _826 = _818 >> 24;
        int _828 = _824 >> 24;
        int _830 = as_type<int>(_814) >> 24;
        float _832 = float(_826);
        float _834 = float(_828);
        float _836 = float(_830);
        float _838 = _832 * 0.0078740157186985015869140625;
        float _840 = float(_820);
        float _842 = _834 * 0.0078740157186985015869140625;
        bool _844 = _822 == 4;
        float _846 = _836 * 0.0078740157186985015869140625;
        float _848 = _840 * 0.0078740157186985015869140625;
        bool _850 = _822 == 8;
        bool _852 = _822 == 12;
        float _854 = precise::min(_838, 1.0);
        float _856 = precise::min(_842, 1.0);
        float _858 = precise::min(_846, 1.0);
        float _860 = precise::min(_848, 1.0);
        float _862 = precise::max(_854, -1.0);
        float _864 = precise::max(_856, -1.0);
        float _866 = precise::max(_858, -1.0);
        float _868 = precise::max(_860, -1.0);
        float _870 = _868;
        if (_844)
        {
            _870 = _862;
        }
        float _872 = _870;
        float _874 = _872;
        if (_850)
        {
            _874 = _864;
        }
        float _876 = _874;
        float _878 = _876;
        if (_852)
        {
            _878 = _866;
        }
        float _880 = _878;
        float _882 = abs(_880);
        float _884 = (-0.0) + _882;
        _812 = _884;
    }
    float _886 = _812;
    float _888 = _686 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _890 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _802);
    bool _892 = _886 != 0.0;
    bool _894 = isnan(_886);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = fma(_760, 0.5, 0.5);
    float _904 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _888);
    float _906 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _890);
    float _908 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _910 = sqrt(_804);
    float _912 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _904);
    float _914 = fma(_902, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _916 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[4].w, _906);
    float _918 = -_648;
    float _920 = _636 + _918;
    float _922 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[5].w, _912);
    float _924 = -_706;
    float _926 = _654 + _924;
    float _928 = fma(_902, _914, -0.212114393711090087890625);
    float _930 = exp2(_908);
    float _932 = _922;
    if (_900)
    {
        _808 = _916;
    }
    float _934 = _808;
    float _936 = _728 * 0.693147182464599609375;
    float _938 = _934;
    if (_900)
    {
        _638 = _922;
    }
    float _940 = _638;
    float _942 = _722 + 1.0;
    float _944 = _940;
    if (!_900)
    {
        _938 = 0.0;
    }
    float _946 = _938;
    float2 _3120 = float2(_920, _926);
    float _948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3120, float2(0.0), isnan(_3120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3120, float2(0.0), isnan(_3120)), level(0.0)).x;
    if (!_900)
    {
        _944 = 0.0;
    }
    float _950 = _944;
    float _952 = fma(_902, _928, 1.570728778839111328125);
    float _954 = _910 * 0.636619746685028076171875;
    float _956 = _762 * _946;
    float _958 = _762 * _950;
    float _960 = _936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _962 = fma(_956, 0.5, 0.5);
    float _964 = -_952;
    float _966 = fma(_954, _964, 1.0);
    float _968 = fma(_958, -0.5, 0.5);
    float _970 = -_722;
    float _972 = fma(_930, _942, _970);
    float3 _3168 = float3(_962, _968, _960);
    float _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3168, float3(0.0), isnan(_3168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3168, float3(0.0), isnan(_3168)), level(0.0)).x;
    float3 _3179 = float3(_962, _968, _960);
    float4 _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3179, float3(0.0), isnan(_3179)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3179, float3(0.0), isnan(_3179)), level(0.0)).xyzw;
    float _979 = _977.x;
    float _981 = _977.y;
    float _983 = _977.z;
    float _985 = _977.w;
    float _987 = fma(_972, 0.5, 0.5);
    float2 _3197 = float2(_966, _987);
    float3 _991 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3197, float2(0.0), isnan(_3197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3197, float2(0.0), isnan(_3197)), level(0.0)).xyz;
    float _993 = _991.x;
    float _995 = _991.y;
    float _997 = _991.z;
    float _999 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1001 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1003 = in.m_68.x;
    float _1005 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[11].x, _999);
    float _1007 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1001);
    float _1009 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1011 = fma(_248, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1005);
    float _1013 = fma(_248, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1007);
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1017 = _1015 != 0;
    float _1019 = in.m_68.y;
    float _1021 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1025 = _177 != 0.0;
    bool _1027 = isnan(_177);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan(0.0);
    bool _1033 = _1029 || _1031;
    float _1035 = in.m_70.y;
    float _1037 = 1.0 / _1021;
    float _1039 = _1023 + _1021;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1043 = _1041 != 0;
    out.m_72.x = _454;
    out.m_72.y = _450;
    out.m_72.z = _462;
    float _1045 = _962;
    float _1047 = _1019;
    float _1049 = _1003;
    if (_1017)
    {
        float _1051 = in.m_70.x;
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = exp2(_1009);
    bool _1057 = _175 == 0.0;
    bool _1059 = !_1033;
    bool _1061 = _1057 && _1059;
    float _1063 = _1039 * _1037;
    float _1065 = _1063 * 0.5;
    bool _1067 = _179 == 0.0;
    bool _1069 = _1067 && _1061;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1073);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1079 = _1035 > 0.5;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1083 = -_1055;
    float _1085 = _1083 + 1.0;
    float _1087 = 1.0 / _1075;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1091 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1097 = _1053 > 0.5;
    bool _1099 = _1097 && _1017;
    float _1101 = -_1019;
    float _1103 = _1101 + 1.0;
    float _1105 = in.m_74.x;
    float _1107 = in.m_74.y;
    float _1109 = in.m_74.z;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1043)
    {
        float _1115 = _1079 ? _1103 : _1019;
        _1047 = _1115;
    }
    float _1117 = _1047;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1121 = _1087 * _1119;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1129 = abs(_1121);
    float _1131 = log2(_1129);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1017)
    {
        _1113 = _1003;
    }
    float _1135 = _1113;
    float _1137 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1135;
    if (_1099)
    {
        float _1147 = -_1135;
        float _1149 = _1147 + 1.0;
        _1145 = _1149;
    }
    float _1151 = _1145;
    out.m_76.x = _1091;
    out.m_76.y = _1137;
    out.m_76.z = _1139;
    out.m_76.w = _1089;
    bool _1153 = _1121 <= 8000.0;
    bool _1155 = isnan(_1121);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(8000.0);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1107;
    float _1167 = _1105;
    float _1169 = _1109;
    if (!_1069)
    {
        float _1171 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1107);
        _1165 = _1171;
    }
    float _1173 = _1165;
    if (_1017)
    {
        _1049 = _1151;
    }
    float _1175 = _1049;
    out.m_78.x = _1141;
    out.m_78.y = _1143;
    out.m_78.z = _1093;
    if (!_1069)
    {
        float _1177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1105);
        _1167 = _1177;
    }
    float _1179 = _1167;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1069)
    {
        float _1183 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1109);
        _1169 = _1183;
    }
    float _1185 = _1169;
    float _1187 = _686 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1189 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1191 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1193 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1195 = isnan(_488);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1201 = _1197 || _1199;
    float _1203 = exp2(_1181);
    float _1205 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1207 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1209 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1211 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1187);
    float _1213 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1205);
    float _1215 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1207);
    float _1217 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1209);
    float _1219 = _1189 * _1111;
    float _1221 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1213);
    float _1223 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1215);
    float _1225 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1217);
    float _1227 = _1191 * _1071;
    float _1229 = _1221 * _400;
    float _1231 = _1221 * _410;
    float _1233 = _1221 * _314;
    float _1235 = fma(_1203, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1237 = precise::clamp(_1235, 0.0, 1.0);
    float _1239 = in.m_66.x;
    float _1241 = fma(_1223, _404, _1231);
    float _1243 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1245 = fma(_1237, -2.0, 3.0);
    float _1247 = _1237 * _1237;
    float _1249 = fma(_1223, _426, _1229);
    float _1251 = _1243 * _886;
    float _1253 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1211);
    float _1255 = _1247 * _1245;
    float _1257 = fma(_1225, _312, _1241);
    float _1259 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1253);
    float _1261 = -_1255;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1223, _436, _1233);
    float _1267 = _1259 + _730;
    float _1269 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1255);
    out.gl_Position.x = _916;
    out.gl_Position.y = _922;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _730;
    int _1271 = as_type<int>(_1263);
    float _1273 = _1259;
    if (!_900)
    {
        float _1275 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1271 = as_type<int>(_1275);
    }
    int _1277 = _1271;
    float _1279 = _1267 * 0.5;
    float _1281 = _1163 * _1269;
    float _1283 = fma(_1225, _432, _1249);
    float _1285 = fma(_1225, _444, _1265);
    out.m_80.x = _1227;
    out.m_80.y = _1219;
    float _1287 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.z = _1279;
    out.m_82.w = _730;
    float _1289 = -_1095;
    float _1291 = _1289 + 1.0;
    out.m_84.x = _1283;
    out.m_84.y = _1257;
    out.m_84.z = _1285;
    float _1293 = as_type<float>(_1277);
    float _1295 = 0.0;
    float _1297 = 0.0;
    float _1299 = _1291;
    if (!_1201)
    {
        _742 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1301 = _742;
    float _1303 = _1301;
    float _1305 = _1301;
    if (!_1201)
    {
        _1273 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1307 = _1273;
    float _1309 = _1307;
    float _1311 = _1307;
    if (!_900)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3776 = as_type<float>(_1277);
        out.gl_Position.z = _3776;
    }
    if (!_1201)
    {
        _932 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1313 = _932;
    float _1315 = _1313;
    float _1317 = _1313;
    if (_900)
    {
        _1293 = _1251;
    }
    float _1319 = _1293;
    float _1321 = _1319;
    if (!_900)
    {
        _1321 = 0.0;
    }
    float _1323 = _1321;
    if (!_1201)
    {
        _1295 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1325 = _1295;
    float _1327 = _1325;
    float _1329 = _1325;
    if (!_1201)
    {
        _1297 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1331 = _1297;
    float _1333 = -_948;
    float _1335 = _1333 + 1.0;
    float _1337 = _1335 * _1287;
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = -_1339;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1345 = _1343 * _1239;
    float _1347 = _1095 * _974;
    float _1349 = _985 * _1291;
    float _1351 = _1345 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1353 = _1331;
    float _1355 = _1331;
    if (!_1201)
    {
        _1299 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1357 = _1299;
    float _1359 = _985 * _1347;
    float _1361 = _997 * _1347;
    out.m_86.x = _1351;
    float _1363 = fma(_993, _1359, _979);
    float _1365 = fma(_995, _1359, _981);
    float _1367 = fma(_985, _1361, _983);
    out.m_88.x = _1363;
    out.m_88.y = _1365;
    out.m_88.z = _1367;
    out.m_88.w = _1349;
    bool _1369 = !_1201;
    float _1371 = _1357;
    float _1373 = _1357;
    if (!_1369)
    {
        bool _1375 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1377 = isnan(_488);
        bool _1379 = _1375 || _1377;
        bool _1381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1383 = _1379 || _1381;
        if (!_1383)
        {
            float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1387 = _488 + _1385;
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1391 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1389;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1397 = 1.0 / _1391;
            float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1401 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1405 = _1403 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1409 = _1407 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1413 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1415 = _1387 * _1397;
            float _1417 = precise::clamp(_1415, 0.0, 1.0);
            float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1421 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1423 = fma(_1417, _1395, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1425 = fma(_1417, _1421, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1427 = fma(_1417, _1401, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1429 = fma(_1417, _1405, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1431 = fma(_1417, _1409, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1433 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1355 = _1427;
            _1317 = _1431;
            _1329 = _1423;
            _1311 = _1429;
            _1305 = _1425;
            _1373 = _1433;
            _1435 = true;
        }
        else
        {
            bool _1437 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1439 = isnan(_488);
            bool _1441 = _1437 || _1439;
            bool _1443 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1445 = _1441 || _1443;
            if (!_1445)
            {
                _1327 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1447 = _1327;
            _1329 = _1447;
            if (!_1445)
            {
                _1353 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1449 = _1353;
            _1355 = _1449;
            if (!_1445)
            {
                _1303 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1451 = _1303;
            _1305 = _1451;
            if (!_1445)
            {
                _1309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1453 = _1309;
            _1311 = _1453;
            if (!_1445)
            {
                _1315 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1455 = _1315;
            _1317 = _1455;
            if (!_1445)
            {
                _1371 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1457 = _1371;
            bool _1459 = !_1445;
            _1373 = _1457;
            if (!_1459)
            {
                bool _1461 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1463 = isnan(_488);
                bool _1465 = _1461 || _1463;
                bool _1467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1469 = _1465 || _1467;
                if (!_1469)
                {
                    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1473 = _488 + _1471;
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1475;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1483 = 1.0 / _1477;
                    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1491 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1495 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1499 = _1497 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1501 = _1473 * _1483;
                    float _1503 = precise::clamp(_1501, 0.0, 1.0);
                    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1507 = _1505 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1509 = fma(_1503, _1481, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1511 = fma(_1503, _1507, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1513 = fma(_1503, _1487, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1515 = fma(_1503, _1491, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1517 = fma(_1503, _1495, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1519 = fma(_1503, _1499, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1355 = _1513;
                    _1317 = _1517;
                    _1329 = _1509;
                    _1311 = _1515;
                    _1305 = _1511;
                    _1373 = _1519;
                    _1435 = true;
                }
                else
                {
                    _1355 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1317 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1329 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1305 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1373 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1435 = false;
    float _1521 = _1355;
    float _1523 = _1317;
    float _1525 = _1329;
    float _1527 = _1311;
    float _1529 = _1305;
    float _1531 = _1373;
    float _1533 = fma(_1257, -0.5, 0.5);
    float _1535 = precise::clamp(_1533, 0.0, 1.0);
    float _1537 = -_1521;
    float _1539 = _1537 + _1523;
    float _1541 = -_1525;
    float _1543 = _1541 + _1527;
    float _1545 = -_1529;
    float _1547 = _1545 + _1531;
    bool _1549 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1551 = fma(_1535, _1539, _1521);
    float _1553 = fma(_1535, _1543, _1525);
    float _1555 = fma(_1535, _1547, _1529);
    float _1557 = _1323 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1559 = _1551 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _1561 = fma(_1553, 0.298911988735198974609375, _1559);
    out.m_86.w = _1557;
    float _1563 = fma(_1555, 0.114477999508380889892578125, _1561);
    out.m_56.x = 1.0;
    float _1565 = -_1563;
    float _1567 = _1553 + _1565;
    float _1569 = -_1563;
    float _1571 = _1551 + _1569;
    float _1573 = -_1563;
    float _1575 = _1555 + _1573;
    float _1577 = fma(_1567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    float _1579 = fma(_1571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    float _1581 = fma(_1575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    out.m_92.x = 0.0;
    out.m_94.x = _1577;
    out.m_94.y = _1579;
    out.m_94.z = _1581;
    if (!_1549)
    {
        return out;
    }
    float _1583 = -_450;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1587 = -_454;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1591 = -_462;
    float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1595 = _1585 * _1585;
    float _1597 = fma(_1589, _1589, _1595);
    float _1599 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1601 = precise::clamp(_1599, 0.0, 1.0);
    float _1603 = fma(_1593, _1593, _1597);
    float _1605 = _1601 * _1601;
    float _1607 = rsqrt(_1603);
    float _1609 = _1585 * _1607;
    float _1611 = _1589 * _1607;
    float _1613 = _1593 * _1607;
    float _1615 = sqrt(_1603);
    float _1617 = -_494;
    float _1619 = _1617 + _1609;
    float _1621 = -_490;
    float _1623 = _1621 + _1611;
    float _1625 = -_492;
    float _1627 = _1625 + _1613;
    float _1629 = _1619 * _1619;
    float _1631 = fma(_1623, _1623, _1629);
    float _1633 = fma(_1627, _1627, _1631);
    float _1635 = -_1615;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1639 = rsqrt(_1633);
    float _1641 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1643 = precise::clamp(_1641, 0.0, 1.0);
    float _1645 = abs(_1643);
    float _1647 = log2(_1645);
    float _1649 = _1605 + (-1.0);
    float _1651 = _1619 * _1639;
    float _1653 = _1623 * _1639;
    float _1655 = _1627 * _1639;
    float _1657 = _1257 * _1651;
    float _1659 = _1257 * _1609;
    float _1661 = fma(_1283, _1653, _1657);
    float _1663 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1665 = fma(_1283, _1611, _1659);
    float _1667 = fma(_1285, _1655, _1661);
    float _1669 = precise::clamp(_1667, 0.0, 1.0);
    float _1671 = fma(_1285, _1613, _1665);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = exp2(_1663);
    float _1677 = _1669 * _1669;
    float _1679 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1681 = fma(_1677, _1649, 1.0);
    float _1683 = -_1609;
    float _1685 = -_1679;
    float _1687 = fma(_1683, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1685);
    float _1689 = _1681 * _1681;
    float _1691 = -_1613;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1687);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1697 = _1693 + _1695;
    float _1699 = 1.0 / _1689;
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = _1675 * _1703;
    float _1707 = _1673 * _1705;
    float _1709 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1711 = _1605 * _1699;
    float _1713 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1715 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _1717 = _1707 * _1711;
    out.m_90.x = _1709;
    out.m_90.y = _1713;
    out.m_90.z = _1715;
    float _1719 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1721 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1723 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _1719;
    out.m_92.y = _1721;
    out.m_92.z = _1723;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1435 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_53.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_113);
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _119;
    if (!_117)
    {
        out.m_56.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_129);
        out.gl_Position.z = _1781;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_58.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _121 = _151;
    }
    float _153 = _121;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _149 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _149;
    if (_159)
    {
        out.m_56.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1850 = as_type<float>(_165);
        out.gl_Position.z = _1850;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_60.w;
    float _169 = in.m_62.x;
    float _171 = in.m_62.y;
    float _173 = in.m_62.z;
    float _175 = in.m_64.x;
    float _177 = in.m_64.y;
    float _179 = in.m_64.z;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = trunc(_167);
    int _189 = int(_187);
    int _191 = _189 << 5;
    uint _194 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_194)];
    float _196 = as_type<float>(_dmw0.x);
    int _198 = _191 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>(_dmw0.y);
    int _204 = _191 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>(_dmw0.z);
    int _210 = _191 + 12;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>(_dmw0.w);
    float _216 = _169 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _218 = _171 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = _173 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _222 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _226 = _216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _228 = _220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _230 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _222);
    float _232 = _224 * _226;
    float _234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _236 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _179);
    float _240 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _230);
    float _242 = _234 * _236;
    float _244 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _246 = _238 * _228;
    float _248 = _240 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _250 = _242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _252 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _244);
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _256 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _258 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[10].x, _250);
    float _260 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _252);
    float _262 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[8].x, _254);
    float _264 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _256);
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _258);
    float _268 = _260 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _262);
    float _272 = _242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _274 = _248 + _266;
    float _276 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _264);
    float _278 = _268 + _270;
    float _280 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[9].x, _272);
    float _282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _284 = _274 + _282;
    float _286 = _276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _290 = _278 + _288;
    float _292 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _280);
    float _294 = _284 * _284;
    float _296 = _286 + _292;
    float _298 = fma(_290, _290, _294);
    float _300 = sqrt(_298);
    bool _302 = _300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _304 = _214 * 2.0;
    float _306 = _202 * 2.0;
    float _308 = _196 * _304;
    float _310 = -_308;
    float _312 = fma(_208, _306, _310);
    float _314 = fma(_208, _306, _308);
    float _316 = _308;
    float _318 = _296;
    float _320 = _278;
    if (!_302)
    {
        _316 = _274;
    }
    float _322 = _316;
    bool _324 = !_302;
    float _326 = _322;
    if (!_324)
    {
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _332 = _300 + _330;
        float _334 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _336 = rsqrt(_298);
        float _338 = _332 * _328;
        float _340 = _338 * 0.15915493667125701904296875;
        float _342 = _340 * 6.283185482025146484375;
        float _344 = cos(_342);
        float _346 = _340 * 6.283185482025146484375;
        float _348 = sin(_346);
        float _350 = _344 + (-1.0);
        float _352 = fma(_348, _334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _354 = _350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _356 = _336 * _352;
        float _358 = fma(_296, _344, _354);
        float _360 = fma(_290, _356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _362 = fma(_284, _356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _318 = _358;
        _320 = _360;
        _326 = _362;
    }
    float _364 = _318;
    float _366 = _320;
    float _368 = _326;
    float _370 = -_286;
    float _372 = _370 + _364;
    float _374 = _196 * _196;
    float _376 = -_268;
    float _378 = _376 + _366;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = _196 * 2.0;
    float _384 = _208 * _304;
    float _386 = _208 * _208;
    float _388 = fma(_374, -2.0, 1.0);
    float _390 = -_248;
    float _392 = _390 + _368;
    float _394 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _396 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].y, _380);
    float _398 = -_384;
    float _400 = fma(_202, _382, _398);
    float _402 = _202 * _304;
    float _404 = fma(_202, _382, _384);
    float _406 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _408 = _202 * _202;
    float _410 = fma(_386, -2.0, _388);
    float _412 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _414 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].y, _396);
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _406);
    float _418 = fma(_408, -2.0, 1.0);
    float _420 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _412);
    float _422 = _414 * _410;
    float _424 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _426 = fma(_386, -2.0, _418);
    float _428 = _414 * _400;
    float _430 = fma(_420, _404, _422);
    float _432 = fma(_208, _382, _402);
    float _434 = -_402;
    float _436 = fma(_208, _382, _434);
    float _438 = _414 * _314;
    float _440 = fma(_420, _426, _428);
    float _442 = fma(_424, _312, _430);
    float _444 = fma(_408, -2.0, _388);
    float _446 = fma(_420, _436, _438);
    float _448 = fma(_424, _432, _440);
    float _450 = _286 + _442;
    float _452 = fma(_424, _444, _446);
    float _454 = _268 + _448;
    float _456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _458 = _450 + _456;
    float _460 = _450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _462 = _248 + _452;
    float _464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _466 = _454 + _464;
    float _468 = _458 * _458;
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _460);
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = _462 + _472;
    float _476 = fma(_466, _466, _468);
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _470);
    float _480 = fma(_474, _474, _476);
    float _482 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _484 = _478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _486 = rsqrt(_480);
    float _488 = sqrt(_480);
    float _490 = _466 * _486;
    float _492 = _474 * _486;
    float _494 = _458 * _486;
    float _496 = _490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _498 = _492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _500 = _496 * _496;
    float _502 = _498 * _498;
    float _504 = _500 + _502;
    float _506 = sqrt(_504);
    bool _508 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _512 = _506 + _510;
    float _514 = _452;
    float _516 = _504;
    float _518 = _512;
    float _520 = _388;
    if (_508)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _522;
    }
    float _524 = _514;
    if (_508)
    {
        float _526 = rsqrt(_504);
        _516 = _526;
    }
    float _528 = _516;
    if (_508)
    {
        float _530 = _512 * _524;
        _518 = _530;
    }
    float _532 = _518;
    float _534 = 0.0;
    if (_508)
    {
        float _536 = _532 * 0.15915493667125701904296875;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = _442;
    float _542 = _538;
    if (_508)
    {
        float _544 = _538 * 6.283185482025146484375;
        float _546 = sin(_544);
        _540 = _546;
    }
    float _548 = _540;
    float _550 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _552 = precise::max(0.0, _550);
    float _554 = _524;
    float _556 = _552;
    float _558 = _550;
    if (_508)
    {
        float _560 = _538 * 6.283185482025146484375;
        float _562 = cos(_560);
        _554 = _562;
    }
    float _564 = _554;
    float _566 = -_494;
    float _568 = -_552;
    float _570 = fma(_566, (*spvDescriptorSet0.vp_c15)._m0[24].y, _568);
    float _572 = _570;
    if (_508)
    {
        float _574 = _570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _556 = _574;
    }
    float _576 = _556;
    float _578 = _576;
    float _580 = _548;
    if (_508)
    {
        float _582 = fma(_548, _576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _520 = _582;
    }
    float _584 = _520;
    float _586 = _584;
    if (!_508)
    {
        _578 = _496;
    }
    float _588 = _578;
    float _590 = _588;
    float _592 = _564;
    if (_508)
    {
        float _594 = _564 + (-1.0);
        _558 = _594;
    }
    float _596 = _558;
    float _598 = _596;
    if (_508)
    {
        float _600 = _528 * _584;
        _542 = _600;
    }
    float _602 = _542;
    if (!_508)
    {
        _586 = _502;
    }
    float _604 = _586;
    float _606 = _604;
    if (_508)
    {
        float _608 = _596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _580 = _608;
    }
    float _610 = _580;
    if (_508)
    {
        float _612 = _496 * _602;
        _590 = _612;
    }
    float _614 = _590;
    if (!_508)
    {
        _598 = _498;
    }
    float _616 = _598;
    float _618 = _616;
    if (_508)
    {
        float _620 = _498 * _602;
        _618 = _620;
    }
    float _622 = _618;
    if (_508)
    {
        float _624 = fma(_570, _564, _610);
        _572 = _624;
    }
    float _626 = _572;
    if (!_508)
    {
        _592 = _500;
    }
    float _628 = _592;
    float _630 = _628;
    if (_508)
    {
        float _632 = _614 * _614;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = fma(_268, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _638 = _636;
    if (_508)
    {
        float _640 = _622 * _622;
        _606 = _640;
    }
    float _642 = _606;
    float _644 = fma(_626, _626, _634);
    float _646 = _450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _648 = floor(_636);
    float _650 = _644 + _642;
    float _652 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _646);
    float _654 = fma(_248, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _656 = _450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _666 = _662 || _664;
    float _668 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _652);
    float _670 = _450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _672 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _674 = rsqrt(_650);
    float _676 = _668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _670);
    float _680 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _672);
    float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _684 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _678);
    float _686 = _680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _688 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _690 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _688);
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = -_682;
    float _696 = fma(_694, _482, 1.0);
    float _698 = _684 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _700 = _686 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _702 = -_692;
    float _704 = _702 + 1.0;
    float _706 = floor(_654);
    float _708 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[7].x, _700);
    float _710 = _674 * _614;
    bool _712 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _714 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.5);
    bool _720 = _716 || _718;
    float _722 = _674 * _626;
    float _724 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _708);
    float _726 = _710 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _728 = log2(_696);
    float _730 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[7].w, _724);
    float _732 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _734 = _674 * _622;
    float _736 = -_726;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _736);
    float _740 = 0.0;
    float _742 = _730;
    if (!_666)
    {
        _740 = 1.0;
    }
    float _744 = _740;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _746);
    float _750 = abs(_704);
    float _752 = log2(_750);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].z, _754);
    float _758 = -_734;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _738);
    float _762 = 1.0 / _730;
    bool _764 = !_666;
    float _766 = _744;
    if (!_764)
    {
        float _768 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        float _770 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _756);
        float _772 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _748);
        float _774 = precise::min(_768, 20.0);
        float _776 = _248 + _770;
        float _778 = _268 + _772;
        float _780 = -_776;
        float _782 = _780 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _784 = 1.0 / _774;
        float _786 = -_778;
        float _788 = _786 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _790 = precise::min(_776, _782);
        float _792 = precise::min(_778, _788);
        float _794 = precise::min(_790, _792);
        float _796 = _794 * _784;
        float _798 = precise::clamp(_796, 0.0, 1.0);
        _766 = _798;
    }
    float _800 = _766;
    float _802 = _686 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _804 = fma(_760, -0.5, 0.5);
    float _806 = 0.0;
    float _808 = _804;
    if (_720)
    {
        _806 = 1.0;
    }
    float _810 = _806;
    float _812 = _810;
    if (!_720)
    {
        float _814 = in.m_66.w;
        int _816 = as_type<int>(_814) << 24;
        int _818 = as_type<int>(_814) << 16;
        int _820 = _816 >> 24;
        int _822 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        int _824 = as_type<int>(_814) << 8;
        int _826 = _818 >> 24;
        int _828 = _824 >> 24;
        int _830 = as_type<int>(_814) >> 24;
        float _832 = float(_826);
        float _834 = float(_828);
        float _836 = float(_830);
        float _838 = _832 * 0.0078740157186985015869140625;
        float _840 = float(_820);
        float _842 = _834 * 0.0078740157186985015869140625;
        bool _844 = _822 == 4;
        float _846 = _836 * 0.0078740157186985015869140625;
        float _848 = _840 * 0.0078740157186985015869140625;
        bool _850 = _822 == 8;
        bool _852 = _822 == 12;
        float _854 = precise::min(_838, 1.0);
        float _856 = precise::min(_842, 1.0);
        float _858 = precise::min(_846, 1.0);
        float _860 = precise::min(_848, 1.0);
        float _862 = precise::max(_854, -1.0);
        float _864 = precise::max(_856, -1.0);
        float _866 = precise::max(_858, -1.0);
        float _868 = precise::max(_860, -1.0);
        float _870 = _868;
        if (_844)
        {
            _870 = _862;
        }
        float _872 = _870;
        float _874 = _872;
        if (_850)
        {
            _874 = _864;
        }
        float _876 = _874;
        float _878 = _876;
        if (_852)
        {
            _878 = _866;
        }
        float _880 = _878;
        float _882 = abs(_880);
        float _884 = (-0.0) + _882;
        _812 = _884;
    }
    float _886 = _812;
    float _888 = _686 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _890 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[4].x, _802);
    bool _892 = _886 != 0.0;
    bool _894 = isnan(_886);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = fma(_760, 0.5, 0.5);
    float _904 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[5].x, _888);
    float _906 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _890);
    float _908 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _910 = sqrt(_804);
    float _912 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _904);
    float _914 = fma(_902, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _916 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[4].w, _906);
    float _918 = -_648;
    float _920 = _636 + _918;
    float _922 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[5].w, _912);
    float _924 = -_706;
    float _926 = _654 + _924;
    float _928 = fma(_902, _914, -0.212114393711090087890625);
    float _930 = exp2(_908);
    float _932 = _922;
    if (_900)
    {
        _808 = _916;
    }
    float _934 = _808;
    float _936 = _728 * 0.693147182464599609375;
    float _938 = _934;
    if (_900)
    {
        _638 = _922;
    }
    float _940 = _638;
    float _942 = _722 + 1.0;
    float _944 = _940;
    if (!_900)
    {
        _938 = 0.0;
    }
    float _946 = _938;
    float2 _3120 = float2(_920, _926);
    float _948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3120, float2(0.0), isnan(_3120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3120, float2(0.0), isnan(_3120)), level(0.0)).x;
    if (!_900)
    {
        _944 = 0.0;
    }
    float _950 = _944;
    float _952 = fma(_902, _928, 1.570728778839111328125);
    float _954 = _910 * 0.636619746685028076171875;
    float _956 = _762 * _946;
    float _958 = _762 * _950;
    float _960 = _936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _962 = fma(_956, 0.5, 0.5);
    float _964 = -_952;
    float _966 = fma(_954, _964, 1.0);
    float _968 = fma(_958, -0.5, 0.5);
    float _970 = -_722;
    float _972 = fma(_930, _942, _970);
    float3 _3168 = float3(_962, _968, _960);
    float _974 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3168, float3(0.0), isnan(_3168)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3168, float3(0.0), isnan(_3168)), level(0.0)).x;
    float3 _3179 = float3(_962, _968, _960);
    float4 _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3179, float3(0.0), isnan(_3179)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3179, float3(0.0), isnan(_3179)), level(0.0)).xyzw;
    float _979 = _977.x;
    float _981 = _977.y;
    float _983 = _977.z;
    float _985 = _977.w;
    float _987 = fma(_972, 0.5, 0.5);
    float2 _3197 = float2(_966, _987);
    float3 _991 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3197, float2(0.0), isnan(_3197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3197, float2(0.0), isnan(_3197)), level(0.0)).xyz;
    float _993 = _991.x;
    float _995 = _991.y;
    float _997 = _991.z;
    float _999 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1001 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1003 = in.m_68.x;
    float _1005 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[11].x, _999);
    float _1007 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1001);
    float _1009 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1011 = fma(_248, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1005);
    float _1013 = fma(_248, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1007);
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1017 = _1015 != 0;
    float _1019 = in.m_68.y;
    float _1021 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1023 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1025 = _177 != 0.0;
    bool _1027 = isnan(_177);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan(0.0);
    bool _1033 = _1029 || _1031;
    float _1035 = in.m_70.y;
    float _1037 = 1.0 / _1021;
    float _1039 = _1023 + _1021;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1043 = _1041 != 0;
    out.m_72.x = _454;
    out.m_72.y = _450;
    out.m_72.z = _462;
    float _1045 = _962;
    float _1047 = _1019;
    float _1049 = _1003;
    if (_1017)
    {
        float _1051 = in.m_70.x;
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = exp2(_1009);
    bool _1057 = _175 == 0.0;
    bool _1059 = !_1033;
    bool _1061 = _1057 && _1059;
    float _1063 = _1039 * _1037;
    float _1065 = _1063 * 0.5;
    bool _1067 = _179 == 0.0;
    bool _1069 = _1067 && _1061;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1073);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1079 = _1035 > 0.5;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1083 = -_1055;
    float _1085 = _1083 + 1.0;
    float _1087 = 1.0 / _1075;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1091 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1097 = _1053 > 0.5;
    bool _1099 = _1097 && _1017;
    float _1101 = -_1019;
    float _1103 = _1101 + 1.0;
    float _1105 = in.m_74.x;
    float _1107 = in.m_74.y;
    float _1109 = in.m_74.z;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1043)
    {
        float _1115 = _1079 ? _1103 : _1019;
        _1047 = _1115;
    }
    float _1117 = _1047;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1121 = _1087 * _1119;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1129 = abs(_1121);
    float _1131 = log2(_1129);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1017)
    {
        _1113 = _1003;
    }
    float _1135 = _1113;
    float _1137 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1135;
    if (_1099)
    {
        float _1147 = -_1135;
        float _1149 = _1147 + 1.0;
        _1145 = _1149;
    }
    float _1151 = _1145;
    out.m_76.x = _1091;
    out.m_76.y = _1137;
    out.m_76.z = _1139;
    out.m_76.w = _1089;
    bool _1153 = _1121 <= 8000.0;
    bool _1155 = isnan(_1121);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(8000.0);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1107;
    float _1167 = _1105;
    float _1169 = _1109;
    if (!_1069)
    {
        float _1171 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1107);
        _1165 = _1171;
    }
    float _1173 = _1165;
    if (_1017)
    {
        _1049 = _1151;
    }
    float _1175 = _1049;
    out.m_78.x = _1141;
    out.m_78.y = _1143;
    out.m_78.z = _1093;
    if (!_1069)
    {
        float _1177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1105);
        _1167 = _1177;
    }
    float _1179 = _1167;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1069)
    {
        float _1183 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1109);
        _1169 = _1183;
    }
    float _1185 = _1169;
    float _1187 = _686 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1189 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1191 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1193 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1195 = isnan(_488);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1201 = _1197 || _1199;
    float _1203 = exp2(_1181);
    float _1205 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1207 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1209 = _1173 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1211 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1187);
    float _1213 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1205);
    float _1215 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1207);
    float _1217 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1209);
    float _1219 = _1189 * _1111;
    float _1221 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1213);
    float _1223 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1215);
    float _1225 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1217);
    float _1227 = _1191 * _1071;
    float _1229 = _1221 * _400;
    float _1231 = _1221 * _410;
    float _1233 = _1221 * _314;
    float _1235 = fma(_1203, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1237 = precise::clamp(_1235, 0.0, 1.0);
    float _1239 = in.m_66.x;
    float _1241 = fma(_1223, _404, _1231);
    float _1243 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1245 = fma(_1237, -2.0, 3.0);
    float _1247 = _1237 * _1237;
    float _1249 = fma(_1223, _426, _1229);
    float _1251 = _1243 * _886;
    float _1253 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1211);
    float _1255 = _1247 * _1245;
    float _1257 = fma(_1225, _312, _1241);
    float _1259 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1253);
    float _1261 = -_1255;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1223, _436, _1233);
    float _1267 = _1259 + _730;
    float _1269 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1255);
    out.gl_Position.x = _916;
    out.gl_Position.y = _922;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _730;
    int _1271 = as_type<int>(_1263);
    float _1273 = _1259;
    if (!_900)
    {
        float _1275 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1271 = as_type<int>(_1275);
    }
    int _1277 = _1271;
    float _1279 = _1267 * 0.5;
    float _1281 = _1163 * _1269;
    float _1283 = fma(_1225, _432, _1249);
    float _1285 = fma(_1225, _444, _1265);
    out.m_80.x = _1227;
    out.m_80.y = _1219;
    float _1287 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.z = _1279;
    out.m_82.w = _730;
    float _1289 = -_1095;
    float _1291 = _1289 + 1.0;
    out.m_84.x = _1283;
    out.m_84.y = _1257;
    out.m_84.z = _1285;
    float _1293 = as_type<float>(_1277);
    float _1295 = 0.0;
    float _1297 = 0.0;
    float _1299 = _1291;
    if (!_1201)
    {
        _742 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1301 = _742;
    float _1303 = _1301;
    float _1305 = _1301;
    if (!_1201)
    {
        _1273 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1307 = _1273;
    float _1309 = _1307;
    float _1311 = _1307;
    if (!_900)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3776 = as_type<float>(_1277);
        out.gl_Position.z = _3776;
    }
    if (!_1201)
    {
        _932 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1313 = _932;
    float _1315 = _1313;
    float _1317 = _1313;
    if (_900)
    {
        _1293 = _1251;
    }
    float _1319 = _1293;
    float _1321 = _1319;
    if (!_900)
    {
        _1321 = 0.0;
    }
    float _1323 = _1321;
    if (!_1201)
    {
        _1295 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1325 = _1295;
    float _1327 = _1325;
    float _1329 = _1325;
    if (!_1201)
    {
        _1297 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1331 = _1297;
    float _1333 = -_948;
    float _1335 = _1333 + 1.0;
    float _1337 = _1335 * _1287;
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = -_1339;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1345 = _1343 * _1239;
    float _1347 = _1095 * _974;
    float _1349 = _985 * _1291;
    float _1351 = _1345 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1353 = _1331;
    float _1355 = _1331;
    if (!_1201)
    {
        _1299 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1357 = _1299;
    float _1359 = _985 * _1347;
    float _1361 = _997 * _1347;
    out.m_86.x = _1351;
    float _1363 = fma(_993, _1359, _979);
    float _1365 = fma(_995, _1359, _981);
    float _1367 = fma(_985, _1361, _983);
    out.m_88.x = _1363;
    out.m_88.y = _1365;
    out.m_88.z = _1367;
    out.m_88.w = _1349;
    bool _1369 = !_1201;
    float _1371 = _1357;
    float _1373 = _1357;
    if (!_1369)
    {
        bool _1375 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1377 = isnan(_488);
        bool _1379 = _1375 || _1377;
        bool _1381 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1383 = _1379 || _1381;
        if (!_1383)
        {
            float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1387 = _488 + _1385;
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1391 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1389;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1397 = 1.0 / _1391;
            float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1401 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1405 = _1403 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1409 = _1407 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1413 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1415 = _1387 * _1397;
            float _1417 = precise::clamp(_1415, 0.0, 1.0);
            float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1421 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1423 = fma(_1417, _1395, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1425 = fma(_1417, _1421, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1427 = fma(_1417, _1401, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1429 = fma(_1417, _1405, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1431 = fma(_1417, _1409, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1433 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1355 = _1427;
            _1317 = _1431;
            _1329 = _1423;
            _1311 = _1429;
            _1305 = _1425;
            _1373 = _1433;
            _1435 = true;
        }
        else
        {
            bool _1437 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1439 = isnan(_488);
            bool _1441 = _1437 || _1439;
            bool _1443 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1445 = _1441 || _1443;
            if (!_1445)
            {
                _1327 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1447 = _1327;
            _1329 = _1447;
            if (!_1445)
            {
                _1353 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1449 = _1353;
            _1355 = _1449;
            if (!_1445)
            {
                _1303 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1451 = _1303;
            _1305 = _1451;
            if (!_1445)
            {
                _1309 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1453 = _1309;
            _1311 = _1453;
            if (!_1445)
            {
                _1315 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1455 = _1315;
            _1317 = _1455;
            if (!_1445)
            {
                _1371 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1457 = _1371;
            bool _1459 = !_1445;
            _1373 = _1457;
            if (!_1459)
            {
                bool _1461 = _488 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1463 = isnan(_488);
                bool _1465 = _1461 || _1463;
                bool _1467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1469 = _1465 || _1467;
                if (!_1469)
                {
                    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1473 = _488 + _1471;
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1475;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1483 = 1.0 / _1477;
                    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1491 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1495 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1499 = _1497 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1501 = _1473 * _1483;
                    float _1503 = precise::clamp(_1501, 0.0, 1.0);
                    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1507 = _1505 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1509 = fma(_1503, _1481, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1511 = fma(_1503, _1507, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1513 = fma(_1503, _1487, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1515 = fma(_1503, _1491, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1517 = fma(_1503, _1495, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1519 = fma(_1503, _1499, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1355 = _1513;
                    _1317 = _1517;
                    _1329 = _1509;
                    _1311 = _1515;
                    _1305 = _1511;
                    _1373 = _1519;
                    _1435 = true;
                }
                else
                {
                    _1355 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1317 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1329 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1311 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1305 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1373 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1435 = false;
    float _1521 = _1355;
    float _1523 = _1317;
    float _1525 = _1329;
    float _1527 = _1311;
    float _1529 = _1305;
    float _1531 = _1373;
    float _1533 = fma(_1257, -0.5, 0.5);
    float _1535 = precise::clamp(_1533, 0.0, 1.0);
    float _1537 = -_1521;
    float _1539 = _1537 + _1523;
    float _1541 = -_1525;
    float _1543 = _1541 + _1527;
    float _1545 = -_1529;
    float _1547 = _1545 + _1531;
    bool _1549 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1551 = fma(_1535, _1539, _1521);
    float _1553 = fma(_1535, _1543, _1525);
    float _1555 = fma(_1535, _1547, _1529);
    float _1557 = _1323 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1559 = _1551 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _1561 = fma(_1553, 0.298911988735198974609375, _1559);
    out.m_86.w = _1557;
    float _1563 = fma(_1555, 0.114477999508380889892578125, _1561);
    out.m_56.x = 1.0;
    float _1565 = -_1563;
    float _1567 = _1553 + _1565;
    float _1569 = -_1563;
    float _1571 = _1551 + _1569;
    float _1573 = -_1563;
    float _1575 = _1555 + _1573;
    float _1577 = fma(_1567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    float _1579 = fma(_1571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    float _1581 = fma(_1575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1563);
    out.m_92.x = 0.0;
    out.m_94.x = _1577;
    out.m_94.y = _1579;
    out.m_94.z = _1581;
    if (!_1549)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1583 = -_450;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1587 = -_454;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1591 = -_462;
    float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1595 = _1585 * _1585;
    float _1597 = fma(_1589, _1589, _1595);
    float _1599 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1601 = precise::clamp(_1599, 0.0, 1.0);
    float _1603 = fma(_1593, _1593, _1597);
    float _1605 = _1601 * _1601;
    float _1607 = rsqrt(_1603);
    float _1609 = _1585 * _1607;
    float _1611 = _1589 * _1607;
    float _1613 = _1593 * _1607;
    float _1615 = sqrt(_1603);
    float _1617 = -_494;
    float _1619 = _1617 + _1609;
    float _1621 = -_490;
    float _1623 = _1621 + _1611;
    float _1625 = -_492;
    float _1627 = _1625 + _1613;
    float _1629 = _1619 * _1619;
    float _1631 = fma(_1623, _1623, _1629);
    float _1633 = fma(_1627, _1627, _1631);
    float _1635 = -_1615;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1639 = rsqrt(_1633);
    float _1641 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1643 = precise::clamp(_1641, 0.0, 1.0);
    float _1645 = abs(_1643);
    float _1647 = log2(_1645);
    float _1649 = _1605 + (-1.0);
    float _1651 = _1619 * _1639;
    float _1653 = _1623 * _1639;
    float _1655 = _1627 * _1639;
    float _1657 = _1257 * _1651;
    float _1659 = _1257 * _1609;
    float _1661 = fma(_1283, _1653, _1657);
    float _1663 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1665 = fma(_1283, _1611, _1659);
    float _1667 = fma(_1285, _1655, _1661);
    float _1669 = precise::clamp(_1667, 0.0, 1.0);
    float _1671 = fma(_1285, _1613, _1665);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = exp2(_1663);
    float _1677 = _1669 * _1669;
    float _1679 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1681 = fma(_1677, _1649, 1.0);
    float _1683 = -_1609;
    float _1685 = -_1679;
    float _1687 = fma(_1683, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1685);
    float _1689 = _1681 * _1681;
    float _1691 = -_1613;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1687);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1697 = _1693 + _1695;
    float _1699 = 1.0 / _1689;
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = _1675 * _1703;
    float _1707 = _1673 * _1705;
    float _1709 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1711 = _1605 * _1699;
    float _1713 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1715 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _1717 = _1707 * _1711;
    out.m_90.x = _1709;
    out.m_90.y = _1713;
    out.m_90.z = _1715;
    float _1719 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1721 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1723 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _1719;
    out.m_92.y = _1721;
    out.m_92.z = _1723;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

