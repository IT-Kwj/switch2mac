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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_22 [[id(7)]];
    sampler vp_t_tcb_22Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_22Smplr_w [[id(17)]];
    sampler vp_t_tcb_14Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_63 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1684 = false;
    bool _606 = false;
    bool _594 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_53.w;
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
    if (!_112)
    {
        out.m_56.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1918 = as_type<float>(_124);
        out.gl_Position.z = _1918;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_58.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1987 = as_type<float>(_160);
        out.gl_Position.z = _1987;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = as_type<float>(int(gl_VertexIndex));
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_63.x;
    float _170 = in.m_63.y;
    float _172 = in.m_63.z;
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = in.m_67.x;
    float _196 = in.m_67.y;
    float _198 = in.m_67.z;
    float _200 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _212 = in.m_67.w;
    int _214 = as_type<int>(_162) & 1;
    bool _216 = _214 != 0;
    int _218 = as_type<int>(_162) & 2;
    bool _220 = _218 != 0;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _224 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _226 = _224 != 0;
    float _228 = _166 * _164;
    float _230 = in.m_65.w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _234 = _170 * _176;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = _176 * _186;
    float _244 = fma(_168, _174, _234);
    float _246 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _250 = fma(_174, _184, _242);
    float _252 = _170 * _196;
    float _254 = in.m_71.x;
    float _256 = _196 * _186;
    float _258 = _170 * _206;
    float _260 = _206 * _186;
    float _262 = fma(_168, _194, _252);
    float _264 = fma(_194, _184, _256);
    float _266 = in.m_69.w;
    float _268 = fma(_168, _204, _258);
    float _270 = fma(_204, _184, _260);
    float _272 = fma(_172, _198, _262);
    float _274 = in.m_73.x;
    float _276 = in.m_73.y;
    float _278 = fma(_172, _178, _244);
    float _280 = fma(_178, _188, _250);
    float _282 = fma(_198, _188, _264);
    float _284 = fma(_172, _208, _268);
    float _286 = fma(_208, _188, _270);
    float _288 = _282 + _212;
    float _290 = _280 + _230;
    bool _292 = !_220;
    float _294 = _292 ? (-0.5) : 0.5;
    float _296 = _288 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _304 = _302 != 0;
    float _306 = _290 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _308 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[20].x, _228);
    bool _310 = !_216;
    float _312 = _310 ? (-0.5) : 0.5;
    float _314 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _316 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _294);
    out.m_75.x = _248;
    out.m_75.y = _200;
    out.m_75.z = _202;
    out.m_75.w = _192;
    float _320 = _286 + _266;
    float _322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _312);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].x, _314);
    out.m_77.x = _312;
    out.m_77.y = _294;
    float _326 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = floor(_308);
    float _330 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = _320 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _336 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _338 = _330 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _340 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].x, _324);
    float _342 = _334 * _322;
    float _344 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _346 = _338 * _318;
    float _348 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].y, _336);
    float _350 = _340 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _352 = _294 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _354 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].z, _344);
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].y, _348);
    float _360 = -_328;
    float _362 = _308 + _360;
    float _364 = _308 * 6.283185482025146484375;
    float _366 = _350 * _180;
    float _368 = _312 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _370 = _352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _372 = _364 * 0.15915493667125701904296875;
    float _374 = _358 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _376 = _352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _378 = _352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _370);
    float _382 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].z, _354);
    float _384 = _372 * 6.283185482025146484375;
    float _386 = cos(_384);
    float _388 = _346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _390 = _374 * _316;
    float _392 = _232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _382 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _388);
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _376);
    float _400 = fma(_390, 0.5, 0.5);
    bool _402 = !_300;
    int _404 = _402 ? 0 : 1;
    float _406 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _378);
    float _408 = fma(_366, 0.5, 0.5);
    bool _410 = !_226;
    int _412 = _410 ? 0 : 1;
    float _414 = _394 * _356;
    out.m_79.x = _238;
    out.m_79.y = _246;
    out.m_79.z = _392;
    out.m_79.w = _236;
    float _416 = _346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _418 = floor(_400);
    int _420 = abs(_404);
    float _422 = _346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _424 = _362 < 0.5;
    float _426 = float(_424);
    float _428 = fma(_414, 0.5, 0.5);
    int _430 = abs(_412);
    float _432 = fma(_386, 0.5, 0.5);
    float _434 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _416);
    float _436 = floor(_408);
    float _438 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _422);
    float _440 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _442 = _398 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _444 = _406 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _446 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _396);
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _434);
    float _450 = floor(_428);
    float _452 = -_426;
    float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _456 = -_432;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = float(_420);
    float _462 = -_362;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _466 = -_418;
    float _468 = _400 + _466;
    float _470 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _438);
    float _472 = abs(_464);
    float _474 = _460 * _472;
    float _476 = float(_430);
    float _478 = -_436;
    float _480 = _408 + _478;
    float _482 = _446 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _484 = fma(_476, _458, _474);
    float _486 = _380 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _488 = fma(_468, 2.0, -1.0);
    float _490 = -_450;
    float _492 = _428 + _490;
    float _494 = fma(_480, 2.0, -1.0);
    float _496 = _488 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_81.x = _486;
    out.m_81.y = _442;
    out.m_81.z = _444;
    float _498 = fma(_492, 2.0, -1.0);
    float _500 = _494 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _502 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _506 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    bool _508 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _510 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _512 = _508 || _510;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].x, _502);
    bool _520 = !_304;
    int _522 = _520 ? 0 : 1;
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].y, _504);
    float _526 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].z, _506);
    float _528 = _498 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _530 = abs(_522);
    float _532 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].x, _518);
    float _534 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].y, _524);
    float _536 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].z, _526);
    float _538 = _448 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _540 = float(_530);
    float _542 = _470 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _544 = _532 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _546 = _534 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _548 = _536 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _550 = abs(_454);
    float _552 = fma(_540, _550, _484);
    float _554 = _482 + _544;
    float _556 = _538 + _546;
    float _558 = _542 + _548;
    float _560 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _562 = _534;
    float _564 = _540;
    float _566 = _484;
    float _568 = _534;
    float _570 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _572 = _540;
    float _574 = _484;
    float _576 = _494;
    float _578 = _488;
    float _580 = _482;
    float _582 = _498;
    float _584 = _488;
    float _586 = _236;
    float _588 = _284;
    float _598;
    float _600;
    float _602;
    float _604;
    if (!_516)
    {
        bool _590 = _546 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _592 = !_590;
        _594 = _592;
        if (!_594)
        {
            float _596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _598 = _596;
            _600 = 0.0;
            _602 = 0.0;
            _604 = 0.0;
            _606 = true;
        }
    }
    if ((!_606) || _594)
    {
        bool _642;
        if (!_594)
        {
            bool _608 = _546 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _610 = isnan(_546);
            bool _612 = _608 || _610;
            bool _614 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _616 = _612 || _614;
            bool _618 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _620 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _622 = !_616;
            bool _624 = _620 && _622;
            if (_624)
            {
                _560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _626 = _560;
            float _628 = _626;
            if (_624)
            {
                _562 = 0.0;
            }
            float _630 = _562;
            _568 = _630;
            _600 = _630;
            if (_624)
            {
                _564 = 0.0;
            }
            float _632 = _564;
            _572 = _632;
            _602 = _632;
            if (_624)
            {
                float _634 = _626 * 5.0;
                _628 = _634;
            }
            float _636 = _628;
            _570 = _636;
            _598 = _636;
            if (_624)
            {
                _566 = 0.0;
            }
            float _638 = _566;
            bool _640 = !_616;
            _642 = _640 && _618;
            _574 = _638;
            _604 = _638;
        }
        if ((!_642) || _594)
        {
            _594 = false;
            float _644 = _568;
            float _646 = _570;
            float _648 = _572;
            float _650 = _574;
            bool _652 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _654 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _656 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _658 = _644;
            float _660 = _648;
            float _662 = _650;
            if (_652)
            {
                float _664 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _658 = _664;
            }
            float _666 = _658;
            if (_652)
            {
                float _668 = abs(_494);
                float _670 = -_668;
                float _672 = _670 + 1.0;
                _576 = _672;
            }
            float _674 = _576;
            if (_654)
            {
                float _676 = abs(_488);
                float _678 = -_676;
                float _680 = _678 + 1.0;
                _578 = _680;
            }
            float _682 = _578;
            _584 = _682;
            if (!_652)
            {
                _580 = 1.0;
            }
            float _684 = _580;
            float _686 = _684;
            if (_656)
            {
                float _688 = abs(_498);
                float _690 = -_688;
                float _692 = _690 + 1.0;
                _582 = _692;
            }
            float _694 = _582;
            if (!_654)
            {
                _660 = 1.0;
            }
            float _696 = _660;
            float _698 = _696;
            if (!_656)
            {
                _662 = 1.0;
            }
            float _700 = _662;
            float _702 = as_type<float>(_430);
            float _704 = _700;
            if (_654)
            {
                float _706 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _702 = _706;
            }
            float _708 = _702;
            float _710 = _646;
            if (_656)
            {
                float _712 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _710 = _712;
            }
            float _714 = _710;
            if (_652)
            {
                float _716 = _674 * _666;
                float _718 = precise::clamp(_716, 0.0, 1.0);
                _686 = _718;
            }
            float _720 = _686;
            _600 = _554;
            if (_654)
            {
                float _722 = _682 * _708;
                float _724 = precise::clamp(_722, 0.0, 1.0);
                _698 = _724;
            }
            float _726 = _698;
            if (_656)
            {
                float _728 = _694 * _714;
                float _730 = precise::clamp(_728, 0.0, 1.0);
                _704 = _730;
            }
            float _732 = _704;
            float _734 = _720 * _726;
            float _736 = _734 * _732;
            _598 = _558;
            _602 = _556;
            _604 = _736;
        }
    }
    _606 = false;
    float _738 = _584;
    float _740 = _598;
    float _742 = _600;
    float _744 = _602;
    float _746 = _604;
    float _748 = _546 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _750 = _748 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _752 = _748 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _754 = fma(_548, 6.2500002968590706586837768554688e-05, 0.5);
    float _756 = fma(_544, (*spvDescriptorSet0.vp_c15)._m0[126].x, _750);
    float _758 = fma(_544, (*spvDescriptorSet0.vp_c15)._m0[127].x, _752);
    float _760 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[126].z, _756);
    float _762 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[127].z, _758);
    float _764 = _760 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _766 = _762 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _768 = trunc(_764);
    int _770 = int(_768);
    float _772 = trunc(_766);
    int _774 = int(_772);
    int _776 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _778 = _770 + _776;
    int _780 = _778 + 1;
    bool _782 = _780 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _784 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _786 = _774 + _784;
    int _788 = _786 + 1;
    int _790 = _780 | _788;
    bool _792 = _790 < 0;
    bool _794 = _792 || _782;
    bool _796 = _788 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _798 = _796 || _794;
    int _800 = _780;
    int _802 = _788;
    int _804 = _790;
    float _806 = _738;
    float _808 = _744;
    float _810 = _742;
    float _812 = _740;
    if (!_798)
    {
        int _814 = _788 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _816 = _814 + _780;
        _800 = _816;
    }
    int _818 = _800;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    if (!_798)
    {
        float _822 = floor(_764);
        _820 = _822;
    }
    float _824 = _820;
    if (!_798)
    {
        int _826 = _818 << 2;
        _802 = _826;
    }
    int _828 = _802;
    int _830 = _828;
    if (!_798)
    {
        uint _833 = uint(int(uint(_818) >> uint(2)));
        _804 = int(_833);
    }
    int _835 = _804;
    if (!_798)
    {
        int _837 = 12 & _828;
        _830 = _837;
    }
    int _839 = _830;
    if (!_798)
    {
        int _841 = _835 << 4;
        int _843 = _841 + _839;
        _806 = as_type<float>(_843);
    }
    float _845 = _806;
    float _847 = fma(_544, 6.2500002968590706586837768554688e-05, 0.5);
    float _849 = as_type<float>(_835);
    if (!_798)
    {
        float _851 = floor(_766);
        _849 = _851;
    }
    float _853 = _849;
    if (!_798)
    {
        float _855 = -_824;
        float _857 = _764 + _855;
        _586 = _857;
    }
    float _859 = _586;
    float _861 = _845;
    if (!_798)
    {
        int _863 = as_type<int>(_845) + 400;
        uint _865 = uint(int(uint(_863) >> uint(2)));
        uint _867 = uint(int(uint(int(_865)) >> uint(2)));
        int _869 = int(_865) & 3;
        float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
        _861 = _871;
    }
    float _873 = _861;
    float2 _3171 = float2(_847, _754);
    float _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_3171, float2(0.0), isnan(_3171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_3171, float2(0.0), isnan(_3171)), level(0.0)).x;
    float _877 = _853;
    if (!_798)
    {
        float _879 = -_853;
        float _881 = _766 + _879;
        _877 = _881;
    }
    float _883 = _877;
    float _885 = _392;
    if (!_798)
    {
        float _887 = rint(_873);
        float _889 = precise::max(_887, 0.0);
        uint _891 = uint(_889);
        uint _893 = clamp(_891, 0u, 65535u);
        _885 = as_type<float>(_893);
    }
    float _895 = _885;
    float _897 = _883;
    if (!_798)
    {
        float3 _3218 = float3(_859, _883, float(as_type<int>(_895)));
        float3 _3222 = select(_3218, float3(0.0), isnan(_3218));
        float _899 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3222.xy, uint(rint(_3222.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3222.xy, uint(rint(_3222.z)), level(0.0)).x;
        _897 = _899;
    }
    float _901 = _897;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _740 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _742 + _907;
    float _911 = _905 * _905;
    float _913 = fma(_909, _909, _911);
    float _915 = sqrt(_913);
    bool _917 = _915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _919 = !_917;
    float _921 = _905;
    float _923 = _875;
    if (!_919)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _929 = _915 + _927;
        float _931 = _744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = rsqrt(_913);
        float _935 = _929 * _925;
        float _937 = _935 * 0.15915493667125701904296875;
        float _939 = _937 * 6.283185482025146484375;
        float _941 = cos(_939);
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 + (-1.0);
        float _949 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _951 = fma(_945, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = fma(_941, _744, _949);
        float _955 = _933 * _951;
        float _957 = fma(_909, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_905, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _808 = _953;
        _810 = _957;
        _812 = _959;
    }
    float _961 = _808;
    float _963 = _810;
    float _965 = _812;
    float _967 = -_546;
    float _969 = _967 + _961;
    float _971 = -_544;
    float _973 = _971 + _963;
    float _975 = -_548;
    float _977 = _975 + _965;
    float _979 = _969 * _969;
    float _981 = fma(_973, _973, _979);
    float _983 = fma(_977, _977, _981);
    float _985 = sqrt(_983);
    bool _987 = _985 > 0.0;
    bool _989 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.5);
    bool _997 = _993 || _995;
    bool _999 = !_987;
    float _1001 = _961;
    float _1003 = _965;
    float _1005 = _963;
    if (!_999)
    {
        float _1007 = _272 * _272;
        float _1009 = fma(_278, _278, _1007);
        float _1011 = fma(_284, _284, _1009);
        float _1013 = rsqrt(_983);
        float _1015 = sqrt(_1011);
        float _1017 = _973 * _1013;
        float _1019 = _969 * _1013;
        float _1021 = _977 * _1013;
        bool _1023 = _1015 > 0.0;
        bool _1025 = !_1023;
        _921 = _1015;
        if (!_1025)
        {
            float _1027 = rsqrt(_1011);
            float _1029 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1031 = _272 * _1027;
            float _1033 = _278 * _1027;
            float _1035 = _284 * _1027;
            float _1037 = _1019 * _1031;
            float _1039 = fma(_1017, _1033, _1037);
            float _1041 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1043 = fma(_1021, _1035, _1039);
            float _1045 = _1043 * _1041;
            float _1047 = fma(_278, _1045, _963);
            float _1049 = fma(_272, _1045, _961);
            float _1051 = fma(_284, _1045, _965);
            _1001 = _1049;
            _1003 = _1051;
            _1005 = _1047;
            _921 = _1029;
        }
    }
    float _1053 = _1001;
    float _1055 = _1003;
    float _1057 = _1005;
    float _1059 = _921;
    float _1061 = _1057;
    float _1063 = _1055;
    float _1065 = _1059;
    if (_997)
    {
        _588 = _1053;
    }
    float _1067 = _588;
    float _1069 = _1067;
    if (!_997)
    {
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1073 = _546 + _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1077 = _544 + _1075;
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1081 = -_546;
        float _1083 = _1081 + _1053;
        float _1085 = _1073 * _1073;
        float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1089 = _548 + _1087;
        float _1091 = -_548;
        float _1093 = _1091 + _1055;
        float _1095 = fma(_1077, _1077, _1085);
        float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1099 = fma(_1089, _1089, _1095);
        float _1101 = sqrt(_1099);
        float _1103 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1105 = -_544;
        float _1107 = _1105 + _1057;
        float _1109 = precise::min(_1101, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1111 = _1109 * _1097;
        float _1113 = _1103 * _1111;
        float _1115 = fma(_1083, _1113, _546);
        float _1117 = fma(_1107, _1113, _544);
        float _1119 = fma(_1093, _1113, _548);
        _1069 = _1115;
        _1061 = _1117;
        _1063 = _1119;
    }
    float _1121 = _1069;
    float _1123 = _1061;
    float _1125 = _1063;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = abs(_875);
    bool _1135 = _1133 != 0.0;
    bool _1137 = isnan(_1133);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan(0.0);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1147 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1149 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1145);
    float _1155 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1147);
    float _1157 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1149);
    float _1159 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1157);
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1169 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1173 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1177 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1171);
    float _1181 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1173);
    float _1183 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1175);
    float _1185 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1187 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1189 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1179);
    float _1191 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1181);
    float _1193 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1183);
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1187);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1189);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1191);
    float _1201 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1193);
    out.gl_Position.x = _1197;
    out.gl_Position.y = _1195;
    out.gl_Position.z = _1199;
    out.gl_Position.w = _1201;
    if (_1143)
    {
        _923 = _1201;
    }
    float _1203 = _923;
    float _1205 = _1203;
    if (!_1143)
    {
        _1205 = 0.0;
    }
    float _1207 = _1205;
    float _1209 = _1207;
    if (!_1143)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_798)
    {
        int _1211 = _818 << 4;
        int _1213 = _1211 + 2048;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
        int _1219 = int(_1215) & 3;
        float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
        int _1223 = int(_1215) + 1;
        uint _1225 = uint(int(uint(_1223) >> uint(2)));
        int _1227 = _1223 & 3;
        float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
        int _1231 = _1213 + 8;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        uint _1235 = uint(int(uint(int(_1233)) >> uint(2)));
        int _1237 = int(_1233) & 3;
        float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
        int _1241 = int(_1233) + 1;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        int _1245 = _1241 & 3;
        float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
        float _1249 = _748 * _1229;
        float _1251 = fma(_544, _1221, _1249);
        float _1253 = fma(_548, _1239, _1251);
        float _1255 = _1253 + _1247;
        float _1257 = precise::clamp(_1255, 0.0, 1.0);
        float _1259 = -_1257;
        float _1261 = _1259 + _901;
        float _1263 = fma(_1261, 500.0, 1.5);
        float _1265 = exp2(_1263);
        float _1267 = 0.0 + _1265;
        float _1269 = precise::clamp(_1267, 0.0, 1.0);
        bool _1271 = _1269 >= 1.0;
        bool _1273 = isnan(_1269);
        bool _1275 = _1271 || _1273;
        bool _1277 = isnan(1.0);
        bool _1279 = _1275 || _1277;
        _1065 = _1247;
        if (!_1279)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1279)
        {
            _1209 = 0.0;
        }
    }
    float _1281 = _1065;
    float _1283 = _1209;
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1287 = _1121 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1291 = _1123 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1295 = _1125 + _1293;
    float _1297 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1299 = _1287 * _1287;
    float _1301 = fma(_1291, _1291, _1299);
    float _1303 = fma(_1295, _1295, _1301);
    float _1305 = rsqrt(_1303);
    float _1307 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1309 = _1291 * _1307;
    float _1311 = _1295 * _1307;
    float _1313 = _1309 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 + _1315;
    float _1319 = sqrt(_1317);
    bool _1321 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1319 + _1323;
    float _1327 = _1305;
    float _1329 = _1317;
    float _1331 = _1325;
    float _1333 = _1281;
    float _1335 = _1287;
    float _1337 = _1307;
    if (_1321)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1339;
    }
    float _1341 = _1327;
    if (_1321)
    {
        float _1343 = rsqrt(_1317);
        _1329 = _1343;
    }
    float _1345 = _1329;
    if (_1321)
    {
        float _1347 = _1325 * _1341;
        _1331 = _1347;
    }
    float _1349 = _1331;
    if (_1321)
    {
        float _1351 = _1349 * 0.15915493667125701904296875;
        _1333 = _1351;
    }
    float _1353 = _1333;
    float _1355 = _901;
    float _1357 = _1353;
    if (_1321)
    {
        float _1359 = _1353 * 6.283185482025146484375;
        float _1361 = sin(_1359);
        _1355 = _1361;
    }
    float _1363 = _1355;
    float _1365 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1367 = precise::max(0.0, _1365);
    float _1369 = _1295;
    float _1371 = _1367;
    float _1373 = _1365;
    if (_1321)
    {
        float _1375 = _1353 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        _1369 = _1377;
    }
    float _1379 = _1369;
    float _1381 = -_1307;
    float _1383 = -_1367;
    float _1385 = fma(_1287, _1381, _1383);
    if (_1321)
    {
        float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1387;
    }
    float _1389 = _1371;
    float _1391 = _1363;
    float _1393 = _1389;
    if (_1321)
    {
        float _1395 = fma(_1363, _1389, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1335 = _1395;
    }
    float _1397 = _1335;
    float _1399 = _1397;
    if (!_1321)
    {
        _1391 = _1309;
    }
    float _1401 = _1391;
    float _1403 = _1401;
    if (!_1321)
    {
        _1393 = _1385;
    }
    float _1405 = _1393;
    float _1407 = _1405;
    float _1409 = _1379;
    if (_1321)
    {
        float _1411 = _1379 + (-1.0);
        _1373 = _1411;
    }
    float _1413 = _1373;
    if (_1321)
    {
        float _1415 = _1345 * _1397;
        _1357 = _1415;
    }
    float _1417 = _1357;
    if (!_1321)
    {
        _1399 = _1313;
    }
    float _1419 = _1399;
    float _1421 = _1419;
    if (_1321)
    {
        float _1423 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1423;
    }
    float _1425 = _1337;
    float _1427 = _1425;
    if (_1321)
    {
        float _1429 = _1309 * _1417;
        _1403 = _1429;
    }
    float _1431 = _1403;
    float _1433 = sqrt(_1303);
    if (_1321)
    {
        float _1435 = fma(_1385, _1379, _1425);
        _1407 = _1435;
    }
    float _1437 = _1407;
    if (!_1321)
    {
        _1409 = _1311;
    }
    float _1439 = _1409;
    float _1441 = _1439;
    if (_1321)
    {
        float _1443 = _1311 * _1417;
        _1441 = _1443;
    }
    float _1445 = _1441;
    if (_1321)
    {
        float _1447 = _1431 * _1431;
        _1421 = _1447;
    }
    float _1449 = _1421;
    if (!_1321)
    {
        _1427 = _1315;
    }
    float _1451 = _1427;
    float _1453 = _1451;
    if (_1321)
    {
        float _1455 = _1445 * _1445;
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = fma(_1437, _1437, _1449);
    float _1461 = 1.0 / _1283;
    float _1463 = _1459 + _1457;
    float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1467 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1465);
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = rsqrt(_1463);
    float _1473 = -_1469;
    float _1475 = _1473 + 1.0;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1479 = -_1297;
    float _1481 = fma(_1479, _1477, 1.0);
    float _1483 = _1197 * _1461;
    float _1485 = abs(_1475);
    float _1487 = log2(_1485);
    float _1489 = _1471 * _1431;
    float _1491 = _1471 * _1437;
    float _1493 = _1471 * _1445;
    float _1495 = log2(_1481);
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1499 = -_1497;
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1499);
    float _1503 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1505 = -_1493;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1501);
    float _1509 = _1491 + 1.0;
    float _1511 = exp2(_1503);
    float _1513 = fma(_1507, -0.5, 0.5);
    float _1515 = fma(_1507, 0.5, 0.5);
    float _1517 = _1495 * 0.693147182464599609375;
    float _1519 = fma(_1515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1521 = fma(_1483, 0.5, 0.5);
    float _1523 = sqrt(_1513);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1527 = fma(_1515, _1519, -0.212114393711090087890625);
    float _1529 = _1195 * _1461;
    float _1531 = fma(_1515, _1527, 1.570728778839111328125);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = -_1491;
    float _1537 = fma(_1511, _1509, _1535);
    float3 _4255 = float3(_1521, _1533, _1525);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4255, float3(0.0), isnan(_4255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4255, float3(0.0), isnan(_4255)), level(0.0)).x;
    float _1541 = fma(_1537, 0.5, 0.5);
    float _1543 = _1523 * 0.636619746685028076171875;
    float _1545 = -_1531;
    float _1547 = fma(_1543, _1545, 1.0);
    float3 _4274 = float3(_1521, _1533, _1525);
    float4 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4274, float3(0.0), isnan(_4274)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4274, float3(0.0), isnan(_4274)), level(0.0)).xyzw;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = _1550.w;
    float2 _4290 = float2(_1547, _1541);
    float3 _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4290, float2(0.0), isnan(_4290)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4290, float2(0.0), isnan(_4290)), level(0.0)).xyz;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1572 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1574 = _1199 + _1201;
    bool _1576 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1578 = isnan(_1433);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1584 = _1580 || _1582;
    float _1586 = _552 * _1572;
    float _1588 = exp2(_1570);
    float _1590 = _1574 * 0.5;
    out.m_83.z = _1590;
    out.m_83.w = _1201;
    float _1592 = -_1588;
    float _1594 = _1592 + 1.0;
    float _1596 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1598 = -_1596;
    float _1600 = _1598 + 1.0;
    float _1602 = _1596 * _1539;
    float _1604 = _1596;
    if (!_1584)
    {
        _1604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1606 = _1604;
    float _1608 = _1558 * _1602;
    float _1610 = _1568 * _1602;
    float _1612 = fma(_1564, _1608, _1552);
    float _1614 = fma(_1566, _1608, _1554);
    float _1616 = _1558 * _1600;
    float _1618 = fma(_1558, _1610, _1556);
    float _1620 = _1608;
    float _1622 = _1610;
    float _1624 = _1606;
    float _1626 = _1606;
    if (!_1584)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1628 = _1620;
    float _1630 = _1628;
    float _1632 = _1628;
    if (!_1584)
    {
        _1622 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1634 = _1622;
    out.m_85.x = _1612;
    out.m_85.y = _1614;
    out.m_85.z = _1618;
    out.m_85.w = _1616;
    bool _1636 = !_1584;
    float _1638 = _1634;
    float _1640 = _1634;
    if (!_1636)
    {
        bool _1642 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1644 = isnan(_1433);
        bool _1646 = _1642 || _1644;
        bool _1648 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1650 = _1646 || _1648;
        if (!_1650)
        {
            float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1654 = _1433 + _1652;
            float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1658 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1656;
            float _1660 = 1.0 / _1658;
            float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1668 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1670 = _1654 * _1660;
            float _1672 = precise::clamp(_1670, 0.0, 1.0);
            float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1678 = fma(_1672, _1668, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1680 = fma(_1672, _1676, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1682 = fma(_1672, _1664, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1640 = _1682;
            _1632 = _1680;
            _1626 = _1678;
            _1684 = true;
        }
        else
        {
            bool _1686 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1688 = isnan(_1433);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1694 = _1690 || _1692;
            if (!_1694)
            {
                _1630 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1696 = _1630;
            _1632 = _1696;
            if (!_1694)
            {
                _1638 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1698 = _1638;
            _1640 = _1698;
            if (!_1694)
            {
                _1624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1700 = _1624;
            bool _1702 = !_1694;
            _1626 = _1700;
            if (!_1702)
            {
                bool _1704 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1706 = isnan(_1433);
                bool _1708 = _1704 || _1706;
                bool _1710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1712 = _1708 || _1710;
                if (!_1712)
                {
                    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1716 = _1433 + _1714;
                    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1718;
                    float _1722 = 1.0 / _1720;
                    float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1726 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1730 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1732 = _1716 * _1722;
                    float _1734 = precise::clamp(_1732, 0.0, 1.0);
                    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1740 = fma(_1734, _1730, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1742 = fma(_1734, _1738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1744 = fma(_1734, _1726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1640 = _1744;
                    _1632 = _1742;
                    _1626 = _1740;
                    _1684 = true;
                }
                else
                {
                    _1640 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1632 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1684 = false;
    float _1746 = _1640;
    float _1748 = _1632;
    float _1750 = _1626;
    float _1752 = _1746 * 0.586610972881317138671875;
    bool _1754 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1756 = _1586 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1758 = fma(_1748, 0.298911988735198974609375, _1752);
    out.m_87.x = 0.0;
    float _1760 = fma(_1750, 0.114477999508380889892578125, _1758);
    out.m_56.x = _1756;
    float _1762 = -_1760;
    float _1764 = _1762 + _1748;
    float _1766 = -_1760;
    float _1768 = _1766 + _1746;
    float _1770 = -_1760;
    float _1772 = _1770 + _1750;
    float _1774 = fma(_1764, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    float _1776 = fma(_1768, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    float _1778 = fma(_1772, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    out.m_89.x = _1774;
    out.m_89.y = _1776;
    out.m_89.z = _1778;
    if (!_1754)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1780 = -_1121;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1784 = -_1123;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1788 = -_1125;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1792 = _1782 * _1782;
    float _1794 = fma(_1786, _1786, _1792);
    float _1796 = fma(_1790, _1790, _1794);
    float _1798 = sqrt(_1796);
    float _1800 = rsqrt(_1796);
    float _1802 = -_1798;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1806 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1808 = precise::clamp(_1806, 0.0, 1.0);
    float _1810 = _1786 * _1800;
    float _1812 = _1782 * _1800;
    float _1814 = abs(_1808);
    float _1816 = log2(_1814);
    float _1818 = _1790 * _1800;
    float _1820 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1822 = _442 * _1812;
    float _1824 = -_1812;
    float _1826 = -_1820;
    float _1828 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1826);
    float _1830 = fma(_486, _1810, _1822);
    float _1832 = -_1818;
    float _1834 = fma(_1832, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1828);
    float _1836 = fma(_444, _1818, _1830);
    float _1838 = precise::clamp(_1836, 0.0, 1.0);
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1842 = _1834 + _1840;
    float _1844 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1846 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = exp2(_1844);
    float _1852 = _1850 * _1848;
    float _1854 = _1838 * _1852;
    float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1858 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1860 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1856;
    out.m_87.y = _1858;
    out.m_87.z = _1860;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1684 = false;
    bool _606 = false;
    bool _594 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_53.w;
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
    if (!_112)
    {
        out.m_56.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1918 = as_type<float>(_124);
        out.gl_Position.z = _1918;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_58.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1987 = as_type<float>(_160);
        out.gl_Position.z = _1987;
    }
    if (_152)
    {
        return out;
    }
    float _162 = as_type<float>(int(gl_VertexIndex));
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_63.x;
    float _170 = in.m_63.y;
    float _172 = in.m_63.z;
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = in.m_67.x;
    float _196 = in.m_67.y;
    float _198 = in.m_67.z;
    float _200 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _212 = in.m_67.w;
    int _214 = as_type<int>(_162) & 1;
    bool _216 = _214 != 0;
    int _218 = as_type<int>(_162) & 2;
    bool _220 = _218 != 0;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _224 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _226 = _224 != 0;
    float _228 = _166 * _164;
    float _230 = in.m_65.w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _234 = _170 * _176;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = _176 * _186;
    float _244 = fma(_168, _174, _234);
    float _246 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _250 = fma(_174, _184, _242);
    float _252 = _170 * _196;
    float _254 = in.m_71.x;
    float _256 = _196 * _186;
    float _258 = _170 * _206;
    float _260 = _206 * _186;
    float _262 = fma(_168, _194, _252);
    float _264 = fma(_194, _184, _256);
    float _266 = in.m_69.w;
    float _268 = fma(_168, _204, _258);
    float _270 = fma(_204, _184, _260);
    float _272 = fma(_172, _198, _262);
    float _274 = in.m_73.x;
    float _276 = in.m_73.y;
    float _278 = fma(_172, _178, _244);
    float _280 = fma(_178, _188, _250);
    float _282 = fma(_198, _188, _264);
    float _284 = fma(_172, _208, _268);
    float _286 = fma(_208, _188, _270);
    float _288 = _282 + _212;
    float _290 = _280 + _230;
    bool _292 = !_220;
    float _294 = _292 ? (-0.5) : 0.5;
    float _296 = _288 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _304 = _302 != 0;
    float _306 = _290 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _308 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[20].x, _228);
    bool _310 = !_216;
    float _312 = _310 ? (-0.5) : 0.5;
    float _314 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _316 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _294);
    out.m_75.x = _248;
    out.m_75.y = _200;
    out.m_75.z = _202;
    out.m_75.w = _192;
    float _320 = _286 + _266;
    float _322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _312);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].x, _314);
    out.m_77.x = _312;
    out.m_77.y = _294;
    float _326 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = floor(_308);
    float _330 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = _320 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _336 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _338 = _330 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _340 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].x, _324);
    float _342 = _334 * _322;
    float _344 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _346 = _338 * _318;
    float _348 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].y, _336);
    float _350 = _340 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _352 = _294 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _354 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].z, _344);
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].y, _348);
    float _360 = -_328;
    float _362 = _308 + _360;
    float _364 = _308 * 6.283185482025146484375;
    float _366 = _350 * _180;
    float _368 = _312 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _370 = _352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _372 = _364 * 0.15915493667125701904296875;
    float _374 = _358 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _376 = _352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _378 = _352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _370);
    float _382 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].z, _354);
    float _384 = _372 * 6.283185482025146484375;
    float _386 = cos(_384);
    float _388 = _346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _390 = _374 * _316;
    float _392 = _232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _382 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _388);
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _376);
    float _400 = fma(_390, 0.5, 0.5);
    bool _402 = !_300;
    int _404 = _402 ? 0 : 1;
    float _406 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _378);
    float _408 = fma(_366, 0.5, 0.5);
    bool _410 = !_226;
    int _412 = _410 ? 0 : 1;
    float _414 = _394 * _356;
    out.m_79.x = _238;
    out.m_79.y = _246;
    out.m_79.z = _392;
    out.m_79.w = _236;
    float _416 = _346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _418 = floor(_400);
    int _420 = abs(_404);
    float _422 = _346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _424 = _362 < 0.5;
    float _426 = float(_424);
    float _428 = fma(_414, 0.5, 0.5);
    int _430 = abs(_412);
    float _432 = fma(_386, 0.5, 0.5);
    float _434 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _416);
    float _436 = floor(_408);
    float _438 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _422);
    float _440 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _442 = _398 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _444 = _406 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _446 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _396);
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _434);
    float _450 = floor(_428);
    float _452 = -_426;
    float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _456 = -_432;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = float(_420);
    float _462 = -_362;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _466 = -_418;
    float _468 = _400 + _466;
    float _470 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _438);
    float _472 = abs(_464);
    float _474 = _460 * _472;
    float _476 = float(_430);
    float _478 = -_436;
    float _480 = _408 + _478;
    float _482 = _446 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _484 = fma(_476, _458, _474);
    float _486 = _380 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _488 = fma(_468, 2.0, -1.0);
    float _490 = -_450;
    float _492 = _428 + _490;
    float _494 = fma(_480, 2.0, -1.0);
    float _496 = _488 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_81.x = _486;
    out.m_81.y = _442;
    out.m_81.z = _444;
    float _498 = fma(_492, 2.0, -1.0);
    float _500 = _494 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _502 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _506 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    bool _508 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _510 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _512 = _508 || _510;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].x, _502);
    bool _520 = !_304;
    int _522 = _520 ? 0 : 1;
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].y, _504);
    float _526 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].z, _506);
    float _528 = _498 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _530 = abs(_522);
    float _532 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].x, _518);
    float _534 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].y, _524);
    float _536 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].z, _526);
    float _538 = _448 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _540 = float(_530);
    float _542 = _470 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _544 = _532 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _546 = _534 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _548 = _536 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _550 = abs(_454);
    float _552 = fma(_540, _550, _484);
    float _554 = _482 + _544;
    float _556 = _538 + _546;
    float _558 = _542 + _548;
    float _560 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _562 = _534;
    float _564 = _540;
    float _566 = _484;
    float _568 = _534;
    float _570 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _572 = _540;
    float _574 = _484;
    float _576 = _494;
    float _578 = _488;
    float _580 = _482;
    float _582 = _498;
    float _584 = _488;
    float _586 = _236;
    float _588 = _284;
    float _598;
    float _600;
    float _602;
    float _604;
    if (!_516)
    {
        bool _590 = _546 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _592 = !_590;
        _594 = _592;
        if (!_594)
        {
            float _596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _598 = _596;
            _600 = 0.0;
            _602 = 0.0;
            _604 = 0.0;
            _606 = true;
        }
    }
    if ((!_606) || _594)
    {
        bool _642;
        if (!_594)
        {
            bool _608 = _546 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _610 = isnan(_546);
            bool _612 = _608 || _610;
            bool _614 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _616 = _612 || _614;
            bool _618 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _620 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _622 = !_616;
            bool _624 = _620 && _622;
            if (_624)
            {
                _560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _626 = _560;
            float _628 = _626;
            if (_624)
            {
                _562 = 0.0;
            }
            float _630 = _562;
            _568 = _630;
            _600 = _630;
            if (_624)
            {
                _564 = 0.0;
            }
            float _632 = _564;
            _572 = _632;
            _602 = _632;
            if (_624)
            {
                float _634 = _626 * 5.0;
                _628 = _634;
            }
            float _636 = _628;
            _570 = _636;
            _598 = _636;
            if (_624)
            {
                _566 = 0.0;
            }
            float _638 = _566;
            bool _640 = !_616;
            _642 = _640 && _618;
            _574 = _638;
            _604 = _638;
        }
        if ((!_642) || _594)
        {
            _594 = false;
            float _644 = _568;
            float _646 = _570;
            float _648 = _572;
            float _650 = _574;
            bool _652 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _654 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _656 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _658 = _644;
            float _660 = _648;
            float _662 = _650;
            if (_652)
            {
                float _664 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _658 = _664;
            }
            float _666 = _658;
            if (_652)
            {
                float _668 = abs(_494);
                float _670 = -_668;
                float _672 = _670 + 1.0;
                _576 = _672;
            }
            float _674 = _576;
            if (_654)
            {
                float _676 = abs(_488);
                float _678 = -_676;
                float _680 = _678 + 1.0;
                _578 = _680;
            }
            float _682 = _578;
            _584 = _682;
            if (!_652)
            {
                _580 = 1.0;
            }
            float _684 = _580;
            float _686 = _684;
            if (_656)
            {
                float _688 = abs(_498);
                float _690 = -_688;
                float _692 = _690 + 1.0;
                _582 = _692;
            }
            float _694 = _582;
            if (!_654)
            {
                _660 = 1.0;
            }
            float _696 = _660;
            float _698 = _696;
            if (!_656)
            {
                _662 = 1.0;
            }
            float _700 = _662;
            float _702 = as_type<float>(_430);
            float _704 = _700;
            if (_654)
            {
                float _706 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _702 = _706;
            }
            float _708 = _702;
            float _710 = _646;
            if (_656)
            {
                float _712 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _710 = _712;
            }
            float _714 = _710;
            if (_652)
            {
                float _716 = _674 * _666;
                float _718 = precise::clamp(_716, 0.0, 1.0);
                _686 = _718;
            }
            float _720 = _686;
            _600 = _554;
            if (_654)
            {
                float _722 = _682 * _708;
                float _724 = precise::clamp(_722, 0.0, 1.0);
                _698 = _724;
            }
            float _726 = _698;
            if (_656)
            {
                float _728 = _694 * _714;
                float _730 = precise::clamp(_728, 0.0, 1.0);
                _704 = _730;
            }
            float _732 = _704;
            float _734 = _720 * _726;
            float _736 = _734 * _732;
            _598 = _558;
            _602 = _556;
            _604 = _736;
        }
    }
    _606 = false;
    float _738 = _584;
    float _740 = _598;
    float _742 = _600;
    float _744 = _602;
    float _746 = _604;
    float _748 = _546 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _750 = _748 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _752 = _748 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _754 = fma(_548, 6.2500002968590706586837768554688e-05, 0.5);
    float _756 = fma(_544, (*spvDescriptorSet0.vp_c15)._m0[126].x, _750);
    float _758 = fma(_544, (*spvDescriptorSet0.vp_c15)._m0[127].x, _752);
    float _760 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[126].z, _756);
    float _762 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[127].z, _758);
    float _764 = _760 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _766 = _762 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _768 = trunc(_764);
    int _770 = int(_768);
    float _772 = trunc(_766);
    int _774 = int(_772);
    int _776 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _778 = _770 + _776;
    int _780 = _778 + 1;
    bool _782 = _780 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _784 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _786 = _774 + _784;
    int _788 = _786 + 1;
    int _790 = _780 | _788;
    bool _792 = _790 < 0;
    bool _794 = _792 || _782;
    bool _796 = _788 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _798 = _796 || _794;
    int _800 = _780;
    int _802 = _788;
    int _804 = _790;
    float _806 = _738;
    float _808 = _744;
    float _810 = _742;
    float _812 = _740;
    if (!_798)
    {
        int _814 = _788 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _816 = _814 + _780;
        _800 = _816;
    }
    int _818 = _800;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    if (!_798)
    {
        float _822 = floor(_764);
        _820 = _822;
    }
    float _824 = _820;
    if (!_798)
    {
        int _826 = _818 << 2;
        _802 = _826;
    }
    int _828 = _802;
    int _830 = _828;
    if (!_798)
    {
        uint _833 = uint(int(uint(_818) >> uint(2)));
        _804 = int(_833);
    }
    int _835 = _804;
    if (!_798)
    {
        int _837 = 12 & _828;
        _830 = _837;
    }
    int _839 = _830;
    if (!_798)
    {
        int _841 = _835 << 4;
        int _843 = _841 + _839;
        _806 = as_type<float>(_843);
    }
    float _845 = _806;
    float _847 = fma(_544, 6.2500002968590706586837768554688e-05, 0.5);
    float _849 = as_type<float>(_835);
    if (!_798)
    {
        float _851 = floor(_766);
        _849 = _851;
    }
    float _853 = _849;
    if (!_798)
    {
        float _855 = -_824;
        float _857 = _764 + _855;
        _586 = _857;
    }
    float _859 = _586;
    float _861 = _845;
    if (!_798)
    {
        int _863 = as_type<int>(_845) + 400;
        uint _865 = uint(int(uint(_863) >> uint(2)));
        uint _867 = uint(int(uint(int(_865)) >> uint(2)));
        int _869 = int(_865) & 3;
        float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
        _861 = _871;
    }
    float _873 = _861;
    float2 _3171 = float2(_847, _754);
    float _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_3171, float2(0.0), isnan(_3171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_3171, float2(0.0), isnan(_3171)), level(0.0)).x;
    float _877 = _853;
    if (!_798)
    {
        float _879 = -_853;
        float _881 = _766 + _879;
        _877 = _881;
    }
    float _883 = _877;
    float _885 = _392;
    if (!_798)
    {
        float _887 = rint(_873);
        float _889 = precise::max(_887, 0.0);
        uint _891 = uint(_889);
        uint _893 = clamp(_891, 0u, 65535u);
        _885 = as_type<float>(_893);
    }
    float _895 = _885;
    float _897 = _883;
    if (!_798)
    {
        float3 _3218 = float3(_859, _883, float(as_type<int>(_895)));
        float3 _3222 = select(_3218, float3(0.0), isnan(_3218));
        float _899 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3222.xy, uint(rint(_3222.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3222.xy, uint(rint(_3222.z)), level(0.0)).x;
        _897 = _899;
    }
    float _901 = _897;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _740 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _742 + _907;
    float _911 = _905 * _905;
    float _913 = fma(_909, _909, _911);
    float _915 = sqrt(_913);
    bool _917 = _915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _919 = !_917;
    float _921 = _905;
    float _923 = _875;
    if (!_919)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _929 = _915 + _927;
        float _931 = _744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = rsqrt(_913);
        float _935 = _929 * _925;
        float _937 = _935 * 0.15915493667125701904296875;
        float _939 = _937 * 6.283185482025146484375;
        float _941 = cos(_939);
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 + (-1.0);
        float _949 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _951 = fma(_945, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = fma(_941, _744, _949);
        float _955 = _933 * _951;
        float _957 = fma(_909, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_905, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _808 = _953;
        _810 = _957;
        _812 = _959;
    }
    float _961 = _808;
    float _963 = _810;
    float _965 = _812;
    float _967 = -_546;
    float _969 = _967 + _961;
    float _971 = -_544;
    float _973 = _971 + _963;
    float _975 = -_548;
    float _977 = _975 + _965;
    float _979 = _969 * _969;
    float _981 = fma(_973, _973, _979);
    float _983 = fma(_977, _977, _981);
    float _985 = sqrt(_983);
    bool _987 = _985 > 0.0;
    bool _989 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.5);
    bool _997 = _993 || _995;
    bool _999 = !_987;
    float _1001 = _961;
    float _1003 = _965;
    float _1005 = _963;
    if (!_999)
    {
        float _1007 = _272 * _272;
        float _1009 = fma(_278, _278, _1007);
        float _1011 = fma(_284, _284, _1009);
        float _1013 = rsqrt(_983);
        float _1015 = sqrt(_1011);
        float _1017 = _973 * _1013;
        float _1019 = _969 * _1013;
        float _1021 = _977 * _1013;
        bool _1023 = _1015 > 0.0;
        bool _1025 = !_1023;
        _921 = _1015;
        if (!_1025)
        {
            float _1027 = rsqrt(_1011);
            float _1029 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1031 = _272 * _1027;
            float _1033 = _278 * _1027;
            float _1035 = _284 * _1027;
            float _1037 = _1019 * _1031;
            float _1039 = fma(_1017, _1033, _1037);
            float _1041 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1043 = fma(_1021, _1035, _1039);
            float _1045 = _1043 * _1041;
            float _1047 = fma(_278, _1045, _963);
            float _1049 = fma(_272, _1045, _961);
            float _1051 = fma(_284, _1045, _965);
            _1001 = _1049;
            _1003 = _1051;
            _1005 = _1047;
            _921 = _1029;
        }
    }
    float _1053 = _1001;
    float _1055 = _1003;
    float _1057 = _1005;
    float _1059 = _921;
    float _1061 = _1057;
    float _1063 = _1055;
    float _1065 = _1059;
    if (_997)
    {
        _588 = _1053;
    }
    float _1067 = _588;
    float _1069 = _1067;
    if (!_997)
    {
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1073 = _546 + _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1077 = _544 + _1075;
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1081 = -_546;
        float _1083 = _1081 + _1053;
        float _1085 = _1073 * _1073;
        float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1089 = _548 + _1087;
        float _1091 = -_548;
        float _1093 = _1091 + _1055;
        float _1095 = fma(_1077, _1077, _1085);
        float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1099 = fma(_1089, _1089, _1095);
        float _1101 = sqrt(_1099);
        float _1103 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1105 = -_544;
        float _1107 = _1105 + _1057;
        float _1109 = precise::min(_1101, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1111 = _1109 * _1097;
        float _1113 = _1103 * _1111;
        float _1115 = fma(_1083, _1113, _546);
        float _1117 = fma(_1107, _1113, _544);
        float _1119 = fma(_1093, _1113, _548);
        _1069 = _1115;
        _1061 = _1117;
        _1063 = _1119;
    }
    float _1121 = _1069;
    float _1123 = _1061;
    float _1125 = _1063;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = abs(_875);
    bool _1135 = _1133 != 0.0;
    bool _1137 = isnan(_1133);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan(0.0);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1147 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1149 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1145);
    float _1155 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1147);
    float _1157 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1149);
    float _1159 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1157);
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1169 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1173 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1177 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1171);
    float _1181 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1173);
    float _1183 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1175);
    float _1185 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1187 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1189 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1179);
    float _1191 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1181);
    float _1193 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1183);
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1187);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1189);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1191);
    float _1201 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1193);
    out.gl_Position.x = _1197;
    out.gl_Position.y = _1195;
    out.gl_Position.z = _1199;
    out.gl_Position.w = _1201;
    if (_1143)
    {
        _923 = _1201;
    }
    float _1203 = _923;
    float _1205 = _1203;
    if (!_1143)
    {
        _1205 = 0.0;
    }
    float _1207 = _1205;
    float _1209 = _1207;
    if (!_1143)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_798)
    {
        int _1211 = _818 << 4;
        int _1213 = _1211 + 2048;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
        int _1219 = int(_1215) & 3;
        float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
        int _1223 = int(_1215) + 1;
        uint _1225 = uint(int(uint(_1223) >> uint(2)));
        int _1227 = _1223 & 3;
        float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
        int _1231 = _1213 + 8;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        uint _1235 = uint(int(uint(int(_1233)) >> uint(2)));
        int _1237 = int(_1233) & 3;
        float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
        int _1241 = int(_1233) + 1;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        int _1245 = _1241 & 3;
        float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
        float _1249 = _748 * _1229;
        float _1251 = fma(_544, _1221, _1249);
        float _1253 = fma(_548, _1239, _1251);
        float _1255 = _1253 + _1247;
        float _1257 = precise::clamp(_1255, 0.0, 1.0);
        float _1259 = -_1257;
        float _1261 = _1259 + _901;
        float _1263 = fma(_1261, 500.0, 1.5);
        float _1265 = exp2(_1263);
        float _1267 = 0.0 + _1265;
        float _1269 = precise::clamp(_1267, 0.0, 1.0);
        bool _1271 = _1269 >= 1.0;
        bool _1273 = isnan(_1269);
        bool _1275 = _1271 || _1273;
        bool _1277 = isnan(1.0);
        bool _1279 = _1275 || _1277;
        _1065 = _1247;
        if (!_1279)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1279)
        {
            _1209 = 0.0;
        }
    }
    float _1281 = _1065;
    float _1283 = _1209;
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1287 = _1121 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1291 = _1123 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1295 = _1125 + _1293;
    float _1297 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1299 = _1287 * _1287;
    float _1301 = fma(_1291, _1291, _1299);
    float _1303 = fma(_1295, _1295, _1301);
    float _1305 = rsqrt(_1303);
    float _1307 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1309 = _1291 * _1307;
    float _1311 = _1295 * _1307;
    float _1313 = _1309 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 + _1315;
    float _1319 = sqrt(_1317);
    bool _1321 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1319 + _1323;
    float _1327 = _1305;
    float _1329 = _1317;
    float _1331 = _1325;
    float _1333 = _1281;
    float _1335 = _1287;
    float _1337 = _1307;
    if (_1321)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1339;
    }
    float _1341 = _1327;
    if (_1321)
    {
        float _1343 = rsqrt(_1317);
        _1329 = _1343;
    }
    float _1345 = _1329;
    if (_1321)
    {
        float _1347 = _1325 * _1341;
        _1331 = _1347;
    }
    float _1349 = _1331;
    if (_1321)
    {
        float _1351 = _1349 * 0.15915493667125701904296875;
        _1333 = _1351;
    }
    float _1353 = _1333;
    float _1355 = _901;
    float _1357 = _1353;
    if (_1321)
    {
        float _1359 = _1353 * 6.283185482025146484375;
        float _1361 = sin(_1359);
        _1355 = _1361;
    }
    float _1363 = _1355;
    float _1365 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1367 = precise::max(0.0, _1365);
    float _1369 = _1295;
    float _1371 = _1367;
    float _1373 = _1365;
    if (_1321)
    {
        float _1375 = _1353 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        _1369 = _1377;
    }
    float _1379 = _1369;
    float _1381 = -_1307;
    float _1383 = -_1367;
    float _1385 = fma(_1287, _1381, _1383);
    if (_1321)
    {
        float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1387;
    }
    float _1389 = _1371;
    float _1391 = _1363;
    float _1393 = _1389;
    if (_1321)
    {
        float _1395 = fma(_1363, _1389, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1335 = _1395;
    }
    float _1397 = _1335;
    float _1399 = _1397;
    if (!_1321)
    {
        _1391 = _1309;
    }
    float _1401 = _1391;
    float _1403 = _1401;
    if (!_1321)
    {
        _1393 = _1385;
    }
    float _1405 = _1393;
    float _1407 = _1405;
    float _1409 = _1379;
    if (_1321)
    {
        float _1411 = _1379 + (-1.0);
        _1373 = _1411;
    }
    float _1413 = _1373;
    if (_1321)
    {
        float _1415 = _1345 * _1397;
        _1357 = _1415;
    }
    float _1417 = _1357;
    if (!_1321)
    {
        _1399 = _1313;
    }
    float _1419 = _1399;
    float _1421 = _1419;
    if (_1321)
    {
        float _1423 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1423;
    }
    float _1425 = _1337;
    float _1427 = _1425;
    if (_1321)
    {
        float _1429 = _1309 * _1417;
        _1403 = _1429;
    }
    float _1431 = _1403;
    float _1433 = sqrt(_1303);
    if (_1321)
    {
        float _1435 = fma(_1385, _1379, _1425);
        _1407 = _1435;
    }
    float _1437 = _1407;
    if (!_1321)
    {
        _1409 = _1311;
    }
    float _1439 = _1409;
    float _1441 = _1439;
    if (_1321)
    {
        float _1443 = _1311 * _1417;
        _1441 = _1443;
    }
    float _1445 = _1441;
    if (_1321)
    {
        float _1447 = _1431 * _1431;
        _1421 = _1447;
    }
    float _1449 = _1421;
    if (!_1321)
    {
        _1427 = _1315;
    }
    float _1451 = _1427;
    float _1453 = _1451;
    if (_1321)
    {
        float _1455 = _1445 * _1445;
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = fma(_1437, _1437, _1449);
    float _1461 = 1.0 / _1283;
    float _1463 = _1459 + _1457;
    float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1467 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1465);
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = rsqrt(_1463);
    float _1473 = -_1469;
    float _1475 = _1473 + 1.0;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1479 = -_1297;
    float _1481 = fma(_1479, _1477, 1.0);
    float _1483 = _1197 * _1461;
    float _1485 = abs(_1475);
    float _1487 = log2(_1485);
    float _1489 = _1471 * _1431;
    float _1491 = _1471 * _1437;
    float _1493 = _1471 * _1445;
    float _1495 = log2(_1481);
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1499 = -_1497;
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1499);
    float _1503 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1505 = -_1493;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1501);
    float _1509 = _1491 + 1.0;
    float _1511 = exp2(_1503);
    float _1513 = fma(_1507, -0.5, 0.5);
    float _1515 = fma(_1507, 0.5, 0.5);
    float _1517 = _1495 * 0.693147182464599609375;
    float _1519 = fma(_1515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1521 = fma(_1483, 0.5, 0.5);
    float _1523 = sqrt(_1513);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1527 = fma(_1515, _1519, -0.212114393711090087890625);
    float _1529 = _1195 * _1461;
    float _1531 = fma(_1515, _1527, 1.570728778839111328125);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = -_1491;
    float _1537 = fma(_1511, _1509, _1535);
    float3 _4255 = float3(_1521, _1533, _1525);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4255, float3(0.0), isnan(_4255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4255, float3(0.0), isnan(_4255)), level(0.0)).x;
    float _1541 = fma(_1537, 0.5, 0.5);
    float _1543 = _1523 * 0.636619746685028076171875;
    float _1545 = -_1531;
    float _1547 = fma(_1543, _1545, 1.0);
    float3 _4274 = float3(_1521, _1533, _1525);
    float4 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4274, float3(0.0), isnan(_4274)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4274, float3(0.0), isnan(_4274)), level(0.0)).xyzw;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = _1550.w;
    float2 _4290 = float2(_1547, _1541);
    float3 _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4290, float2(0.0), isnan(_4290)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4290, float2(0.0), isnan(_4290)), level(0.0)).xyz;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1572 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1574 = _1199 + _1201;
    bool _1576 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1578 = isnan(_1433);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1584 = _1580 || _1582;
    float _1586 = _552 * _1572;
    float _1588 = exp2(_1570);
    float _1590 = _1574 * 0.5;
    out.m_83.z = _1590;
    out.m_83.w = _1201;
    float _1592 = -_1588;
    float _1594 = _1592 + 1.0;
    float _1596 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1598 = -_1596;
    float _1600 = _1598 + 1.0;
    float _1602 = _1596 * _1539;
    float _1604 = _1596;
    if (!_1584)
    {
        _1604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1606 = _1604;
    float _1608 = _1558 * _1602;
    float _1610 = _1568 * _1602;
    float _1612 = fma(_1564, _1608, _1552);
    float _1614 = fma(_1566, _1608, _1554);
    float _1616 = _1558 * _1600;
    float _1618 = fma(_1558, _1610, _1556);
    float _1620 = _1608;
    float _1622 = _1610;
    float _1624 = _1606;
    float _1626 = _1606;
    if (!_1584)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1628 = _1620;
    float _1630 = _1628;
    float _1632 = _1628;
    if (!_1584)
    {
        _1622 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1634 = _1622;
    out.m_85.x = _1612;
    out.m_85.y = _1614;
    out.m_85.z = _1618;
    out.m_85.w = _1616;
    bool _1636 = !_1584;
    float _1638 = _1634;
    float _1640 = _1634;
    if (!_1636)
    {
        bool _1642 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1644 = isnan(_1433);
        bool _1646 = _1642 || _1644;
        bool _1648 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1650 = _1646 || _1648;
        if (!_1650)
        {
            float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1654 = _1433 + _1652;
            float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1658 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1656;
            float _1660 = 1.0 / _1658;
            float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1668 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1670 = _1654 * _1660;
            float _1672 = precise::clamp(_1670, 0.0, 1.0);
            float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1678 = fma(_1672, _1668, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1680 = fma(_1672, _1676, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1682 = fma(_1672, _1664, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1640 = _1682;
            _1632 = _1680;
            _1626 = _1678;
            _1684 = true;
        }
        else
        {
            bool _1686 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1688 = isnan(_1433);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1694 = _1690 || _1692;
            if (!_1694)
            {
                _1630 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1696 = _1630;
            _1632 = _1696;
            if (!_1694)
            {
                _1638 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1698 = _1638;
            _1640 = _1698;
            if (!_1694)
            {
                _1624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1700 = _1624;
            bool _1702 = !_1694;
            _1626 = _1700;
            if (!_1702)
            {
                bool _1704 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1706 = isnan(_1433);
                bool _1708 = _1704 || _1706;
                bool _1710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1712 = _1708 || _1710;
                if (!_1712)
                {
                    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1716 = _1433 + _1714;
                    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1718;
                    float _1722 = 1.0 / _1720;
                    float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1726 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1730 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1732 = _1716 * _1722;
                    float _1734 = precise::clamp(_1732, 0.0, 1.0);
                    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1740 = fma(_1734, _1730, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1742 = fma(_1734, _1738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1744 = fma(_1734, _1726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1640 = _1744;
                    _1632 = _1742;
                    _1626 = _1740;
                    _1684 = true;
                }
                else
                {
                    _1640 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1632 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1684 = false;
    float _1746 = _1640;
    float _1748 = _1632;
    float _1750 = _1626;
    float _1752 = _1746 * 0.586610972881317138671875;
    bool _1754 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1756 = _1586 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1758 = fma(_1748, 0.298911988735198974609375, _1752);
    out.m_87.x = 0.0;
    float _1760 = fma(_1750, 0.114477999508380889892578125, _1758);
    out.m_56.x = _1756;
    float _1762 = -_1760;
    float _1764 = _1762 + _1748;
    float _1766 = -_1760;
    float _1768 = _1766 + _1746;
    float _1770 = -_1760;
    float _1772 = _1770 + _1750;
    float _1774 = fma(_1764, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    float _1776 = fma(_1768, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    float _1778 = fma(_1772, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    out.m_89.x = _1774;
    out.m_89.y = _1776;
    out.m_89.z = _1778;
    if (!_1754)
    {
        return out;
    }
    float _1780 = -_1121;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1784 = -_1123;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1788 = -_1125;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1792 = _1782 * _1782;
    float _1794 = fma(_1786, _1786, _1792);
    float _1796 = fma(_1790, _1790, _1794);
    float _1798 = sqrt(_1796);
    float _1800 = rsqrt(_1796);
    float _1802 = -_1798;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1806 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1808 = precise::clamp(_1806, 0.0, 1.0);
    float _1810 = _1786 * _1800;
    float _1812 = _1782 * _1800;
    float _1814 = abs(_1808);
    float _1816 = log2(_1814);
    float _1818 = _1790 * _1800;
    float _1820 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1822 = _442 * _1812;
    float _1824 = -_1812;
    float _1826 = -_1820;
    float _1828 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1826);
    float _1830 = fma(_486, _1810, _1822);
    float _1832 = -_1818;
    float _1834 = fma(_1832, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1828);
    float _1836 = fma(_444, _1818, _1830);
    float _1838 = precise::clamp(_1836, 0.0, 1.0);
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1842 = _1834 + _1840;
    float _1844 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1846 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = exp2(_1844);
    float _1852 = _1850 * _1848;
    float _1854 = _1838 * _1852;
    float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1858 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1860 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1856;
    out.m_87.y = _1858;
    out.m_87.z = _1860;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1684 = false;
    bool _606 = false;
    bool _594 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_53.w;
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
    if (!_112)
    {
        out.m_56.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1918 = as_type<float>(_124);
        out.gl_Position.z = _1918;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_58.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1987 = as_type<float>(_160);
        out.gl_Position.z = _1987;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = as_type<float>(int(gl_VertexIndex));
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_63.x;
    float _170 = in.m_63.y;
    float _172 = in.m_63.z;
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = in.m_67.x;
    float _196 = in.m_67.y;
    float _198 = in.m_67.z;
    float _200 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _212 = in.m_67.w;
    int _214 = as_type<int>(_162) & 1;
    bool _216 = _214 != 0;
    int _218 = as_type<int>(_162) & 2;
    bool _220 = _218 != 0;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _224 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _226 = _224 != 0;
    float _228 = _166 * _164;
    float _230 = in.m_65.w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _234 = _170 * _176;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = _176 * _186;
    float _244 = fma(_168, _174, _234);
    float _246 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _250 = fma(_174, _184, _242);
    float _252 = _170 * _196;
    float _254 = in.m_71.x;
    float _256 = _196 * _186;
    float _258 = _170 * _206;
    float _260 = _206 * _186;
    float _262 = fma(_168, _194, _252);
    float _264 = fma(_194, _184, _256);
    float _266 = in.m_69.w;
    float _268 = fma(_168, _204, _258);
    float _270 = fma(_204, _184, _260);
    float _272 = fma(_172, _198, _262);
    float _274 = in.m_73.x;
    float _276 = in.m_73.y;
    float _278 = fma(_172, _178, _244);
    float _280 = fma(_178, _188, _250);
    float _282 = fma(_198, _188, _264);
    float _284 = fma(_172, _208, _268);
    float _286 = fma(_208, _188, _270);
    float _288 = _282 + _212;
    float _290 = _280 + _230;
    bool _292 = !_220;
    float _294 = _292 ? (-0.5) : 0.5;
    float _296 = _288 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _304 = _302 != 0;
    float _306 = _290 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _308 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[20].x, _228);
    bool _310 = !_216;
    float _312 = _310 ? (-0.5) : 0.5;
    float _314 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _316 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _294);
    out.m_75.x = _248;
    out.m_75.y = _200;
    out.m_75.z = _202;
    out.m_75.w = _192;
    float _320 = _286 + _266;
    float _322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _312);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].x, _314);
    out.m_77.x = _312;
    out.m_77.y = _294;
    float _326 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = floor(_308);
    float _330 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = _320 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _336 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _338 = _330 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _340 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].x, _324);
    float _342 = _334 * _322;
    float _344 = _296 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _346 = _338 * _318;
    float _348 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].y, _336);
    float _350 = _340 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _352 = _294 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _354 = fma(_306, (*spvDescriptorSet0.vp_c12)._m0[6].z, _344);
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].y, _348);
    float _360 = -_328;
    float _362 = _308 + _360;
    float _364 = _308 * 6.283185482025146484375;
    float _366 = _350 * _180;
    float _368 = _312 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _370 = _352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _372 = _364 * 0.15915493667125701904296875;
    float _374 = _358 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _376 = _352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _378 = _352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _370);
    float _382 = fma(_332, (*spvDescriptorSet0.vp_c12)._m0[8].z, _354);
    float _384 = _372 * 6.283185482025146484375;
    float _386 = cos(_384);
    float _388 = _346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _390 = _374 * _316;
    float _392 = _232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _382 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _388);
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _376);
    float _400 = fma(_390, 0.5, 0.5);
    bool _402 = !_300;
    int _404 = _402 ? 0 : 1;
    float _406 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _378);
    float _408 = fma(_366, 0.5, 0.5);
    bool _410 = !_226;
    int _412 = _410 ? 0 : 1;
    float _414 = _394 * _356;
    out.m_79.x = _238;
    out.m_79.y = _246;
    out.m_79.z = _392;
    out.m_79.w = _236;
    float _416 = _346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _418 = floor(_400);
    int _420 = abs(_404);
    float _422 = _346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _424 = _362 < 0.5;
    float _426 = float(_424);
    float _428 = fma(_414, 0.5, 0.5);
    int _430 = abs(_412);
    float _432 = fma(_386, 0.5, 0.5);
    float _434 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _416);
    float _436 = floor(_408);
    float _438 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _422);
    float _440 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _442 = _398 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _444 = _406 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _446 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _396);
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _434);
    float _450 = floor(_428);
    float _452 = -_426;
    float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _456 = -_432;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = float(_420);
    float _462 = -_362;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _466 = -_418;
    float _468 = _400 + _466;
    float _470 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _438);
    float _472 = abs(_464);
    float _474 = _460 * _472;
    float _476 = float(_430);
    float _478 = -_436;
    float _480 = _408 + _478;
    float _482 = _446 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _484 = fma(_476, _458, _474);
    float _486 = _380 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _488 = fma(_468, 2.0, -1.0);
    float _490 = -_450;
    float _492 = _428 + _490;
    float _494 = fma(_480, 2.0, -1.0);
    float _496 = _488 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    out.m_81.x = _486;
    out.m_81.y = _442;
    out.m_81.z = _444;
    float _498 = fma(_492, 2.0, -1.0);
    float _500 = _494 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _502 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _506 = _496 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    bool _508 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _510 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _512 = _508 || _510;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].x, _502);
    bool _520 = !_304;
    int _522 = _520 ? 0 : 1;
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].y, _504);
    float _526 = fma(_500, (*spvDescriptorSet0.vp_c12)._m0[2].z, _506);
    float _528 = _498 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _530 = abs(_522);
    float _532 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].x, _518);
    float _534 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].y, _524);
    float _536 = fma(_528, (*spvDescriptorSet0.vp_c12)._m0[4].z, _526);
    float _538 = _448 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _540 = float(_530);
    float _542 = _470 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _544 = _532 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _546 = _534 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _548 = _536 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _550 = abs(_454);
    float _552 = fma(_540, _550, _484);
    float _554 = _482 + _544;
    float _556 = _538 + _546;
    float _558 = _542 + _548;
    float _560 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _562 = _534;
    float _564 = _540;
    float _566 = _484;
    float _568 = _534;
    float _570 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _572 = _540;
    float _574 = _484;
    float _576 = _494;
    float _578 = _488;
    float _580 = _482;
    float _582 = _498;
    float _584 = _488;
    float _586 = _236;
    float _588 = _284;
    float _598;
    float _600;
    float _602;
    float _604;
    if (!_516)
    {
        bool _590 = _546 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _592 = !_590;
        _594 = _592;
        if (!_594)
        {
            float _596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _598 = _596;
            _600 = 0.0;
            _602 = 0.0;
            _604 = 0.0;
            _606 = true;
        }
    }
    if ((!_606) || _594)
    {
        bool _642;
        if (!_594)
        {
            bool _608 = _546 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _610 = isnan(_546);
            bool _612 = _608 || _610;
            bool _614 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _616 = _612 || _614;
            bool _618 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _620 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _622 = !_616;
            bool _624 = _620 && _622;
            if (_624)
            {
                _560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _626 = _560;
            float _628 = _626;
            if (_624)
            {
                _562 = 0.0;
            }
            float _630 = _562;
            _568 = _630;
            _600 = _630;
            if (_624)
            {
                _564 = 0.0;
            }
            float _632 = _564;
            _572 = _632;
            _602 = _632;
            if (_624)
            {
                float _634 = _626 * 5.0;
                _628 = _634;
            }
            float _636 = _628;
            _570 = _636;
            _598 = _636;
            if (_624)
            {
                _566 = 0.0;
            }
            float _638 = _566;
            bool _640 = !_616;
            _642 = _640 && _618;
            _574 = _638;
            _604 = _638;
        }
        if ((!_642) || _594)
        {
            _594 = false;
            float _644 = _568;
            float _646 = _570;
            float _648 = _572;
            float _650 = _574;
            bool _652 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _654 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _656 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _658 = _644;
            float _660 = _648;
            float _662 = _650;
            if (_652)
            {
                float _664 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _658 = _664;
            }
            float _666 = _658;
            if (_652)
            {
                float _668 = abs(_494);
                float _670 = -_668;
                float _672 = _670 + 1.0;
                _576 = _672;
            }
            float _674 = _576;
            if (_654)
            {
                float _676 = abs(_488);
                float _678 = -_676;
                float _680 = _678 + 1.0;
                _578 = _680;
            }
            float _682 = _578;
            _584 = _682;
            if (!_652)
            {
                _580 = 1.0;
            }
            float _684 = _580;
            float _686 = _684;
            if (_656)
            {
                float _688 = abs(_498);
                float _690 = -_688;
                float _692 = _690 + 1.0;
                _582 = _692;
            }
            float _694 = _582;
            if (!_654)
            {
                _660 = 1.0;
            }
            float _696 = _660;
            float _698 = _696;
            if (!_656)
            {
                _662 = 1.0;
            }
            float _700 = _662;
            float _702 = as_type<float>(_430);
            float _704 = _700;
            if (_654)
            {
                float _706 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _702 = _706;
            }
            float _708 = _702;
            float _710 = _646;
            if (_656)
            {
                float _712 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _710 = _712;
            }
            float _714 = _710;
            if (_652)
            {
                float _716 = _674 * _666;
                float _718 = precise::clamp(_716, 0.0, 1.0);
                _686 = _718;
            }
            float _720 = _686;
            _600 = _554;
            if (_654)
            {
                float _722 = _682 * _708;
                float _724 = precise::clamp(_722, 0.0, 1.0);
                _698 = _724;
            }
            float _726 = _698;
            if (_656)
            {
                float _728 = _694 * _714;
                float _730 = precise::clamp(_728, 0.0, 1.0);
                _704 = _730;
            }
            float _732 = _704;
            float _734 = _720 * _726;
            float _736 = _734 * _732;
            _598 = _558;
            _602 = _556;
            _604 = _736;
        }
    }
    _606 = false;
    float _738 = _584;
    float _740 = _598;
    float _742 = _600;
    float _744 = _602;
    float _746 = _604;
    float _748 = _546 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _750 = _748 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _752 = _748 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _754 = fma(_548, 6.2500002968590706586837768554688e-05, 0.5);
    float _756 = fma(_544, (*spvDescriptorSet0.vp_c15)._m0[126].x, _750);
    float _758 = fma(_544, (*spvDescriptorSet0.vp_c15)._m0[127].x, _752);
    float _760 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[126].z, _756);
    float _762 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[127].z, _758);
    float _764 = _760 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _766 = _762 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _768 = trunc(_764);
    int _770 = int(_768);
    float _772 = trunc(_766);
    int _774 = int(_772);
    int _776 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _778 = _770 + _776;
    int _780 = _778 + 1;
    bool _782 = _780 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _784 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _786 = _774 + _784;
    int _788 = _786 + 1;
    int _790 = _780 | _788;
    bool _792 = _790 < 0;
    bool _794 = _792 || _782;
    bool _796 = _788 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _798 = _796 || _794;
    int _800 = _780;
    int _802 = _788;
    int _804 = _790;
    float _806 = _738;
    float _808 = _744;
    float _810 = _742;
    float _812 = _740;
    if (!_798)
    {
        int _814 = _788 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _816 = _814 + _780;
        _800 = _816;
    }
    int _818 = _800;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    if (!_798)
    {
        float _822 = floor(_764);
        _820 = _822;
    }
    float _824 = _820;
    if (!_798)
    {
        int _826 = _818 << 2;
        _802 = _826;
    }
    int _828 = _802;
    int _830 = _828;
    if (!_798)
    {
        uint _833 = uint(int(uint(_818) >> uint(2)));
        _804 = int(_833);
    }
    int _835 = _804;
    if (!_798)
    {
        int _837 = 12 & _828;
        _830 = _837;
    }
    int _839 = _830;
    if (!_798)
    {
        int _841 = _835 << 4;
        int _843 = _841 + _839;
        _806 = as_type<float>(_843);
    }
    float _845 = _806;
    float _847 = fma(_544, 6.2500002968590706586837768554688e-05, 0.5);
    float _849 = as_type<float>(_835);
    if (!_798)
    {
        float _851 = floor(_766);
        _849 = _851;
    }
    float _853 = _849;
    if (!_798)
    {
        float _855 = -_824;
        float _857 = _764 + _855;
        _586 = _857;
    }
    float _859 = _586;
    float _861 = _845;
    if (!_798)
    {
        int _863 = as_type<int>(_845) + 400;
        uint _865 = uint(int(uint(_863) >> uint(2)));
        uint _867 = uint(int(uint(int(_865)) >> uint(2)));
        int _869 = int(_865) & 3;
        float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
        _861 = _871;
    }
    float _873 = _861;
    float2 _3171 = float2(_847, _754);
    float _875 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_3171, float2(0.0), isnan(_3171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_3171, float2(0.0), isnan(_3171)), level(0.0)).x;
    float _877 = _853;
    if (!_798)
    {
        float _879 = -_853;
        float _881 = _766 + _879;
        _877 = _881;
    }
    float _883 = _877;
    float _885 = _392;
    if (!_798)
    {
        float _887 = rint(_873);
        float _889 = precise::max(_887, 0.0);
        uint _891 = uint(_889);
        uint _893 = clamp(_891, 0u, 65535u);
        _885 = as_type<float>(_893);
    }
    float _895 = _885;
    float _897 = _883;
    if (!_798)
    {
        float3 _3218 = float3(_859, _883, float(as_type<int>(_895)));
        float3 _3222 = select(_3218, float3(0.0), isnan(_3218));
        float _899 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3222.xy, uint(rint(_3222.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3222.xy, uint(rint(_3222.z)), level(0.0)).x;
        _897 = _899;
    }
    float _901 = _897;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _740 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _742 + _907;
    float _911 = _905 * _905;
    float _913 = fma(_909, _909, _911);
    float _915 = sqrt(_913);
    bool _917 = _915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _919 = !_917;
    float _921 = _905;
    float _923 = _875;
    if (!_919)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _929 = _915 + _927;
        float _931 = _744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = rsqrt(_913);
        float _935 = _929 * _925;
        float _937 = _935 * 0.15915493667125701904296875;
        float _939 = _937 * 6.283185482025146484375;
        float _941 = cos(_939);
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 + (-1.0);
        float _949 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _951 = fma(_945, _931, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = fma(_941, _744, _949);
        float _955 = _933 * _951;
        float _957 = fma(_909, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_905, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _808 = _953;
        _810 = _957;
        _812 = _959;
    }
    float _961 = _808;
    float _963 = _810;
    float _965 = _812;
    float _967 = -_546;
    float _969 = _967 + _961;
    float _971 = -_544;
    float _973 = _971 + _963;
    float _975 = -_548;
    float _977 = _975 + _965;
    float _979 = _969 * _969;
    float _981 = fma(_973, _973, _979);
    float _983 = fma(_977, _977, _981);
    float _985 = sqrt(_983);
    bool _987 = _985 > 0.0;
    bool _989 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.5);
    bool _997 = _993 || _995;
    bool _999 = !_987;
    float _1001 = _961;
    float _1003 = _965;
    float _1005 = _963;
    if (!_999)
    {
        float _1007 = _272 * _272;
        float _1009 = fma(_278, _278, _1007);
        float _1011 = fma(_284, _284, _1009);
        float _1013 = rsqrt(_983);
        float _1015 = sqrt(_1011);
        float _1017 = _973 * _1013;
        float _1019 = _969 * _1013;
        float _1021 = _977 * _1013;
        bool _1023 = _1015 > 0.0;
        bool _1025 = !_1023;
        _921 = _1015;
        if (!_1025)
        {
            float _1027 = rsqrt(_1011);
            float _1029 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1031 = _272 * _1027;
            float _1033 = _278 * _1027;
            float _1035 = _284 * _1027;
            float _1037 = _1019 * _1031;
            float _1039 = fma(_1017, _1033, _1037);
            float _1041 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1043 = fma(_1021, _1035, _1039);
            float _1045 = _1043 * _1041;
            float _1047 = fma(_278, _1045, _963);
            float _1049 = fma(_272, _1045, _961);
            float _1051 = fma(_284, _1045, _965);
            _1001 = _1049;
            _1003 = _1051;
            _1005 = _1047;
            _921 = _1029;
        }
    }
    float _1053 = _1001;
    float _1055 = _1003;
    float _1057 = _1005;
    float _1059 = _921;
    float _1061 = _1057;
    float _1063 = _1055;
    float _1065 = _1059;
    if (_997)
    {
        _588 = _1053;
    }
    float _1067 = _588;
    float _1069 = _1067;
    if (!_997)
    {
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1073 = _546 + _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1077 = _544 + _1075;
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1081 = -_546;
        float _1083 = _1081 + _1053;
        float _1085 = _1073 * _1073;
        float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1089 = _548 + _1087;
        float _1091 = -_548;
        float _1093 = _1091 + _1055;
        float _1095 = fma(_1077, _1077, _1085);
        float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1099 = fma(_1089, _1089, _1095);
        float _1101 = sqrt(_1099);
        float _1103 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1105 = -_544;
        float _1107 = _1105 + _1057;
        float _1109 = precise::min(_1101, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1111 = _1109 * _1097;
        float _1113 = _1103 * _1111;
        float _1115 = fma(_1083, _1113, _546);
        float _1117 = fma(_1107, _1113, _544);
        float _1119 = fma(_1093, _1113, _548);
        _1069 = _1115;
        _1061 = _1117;
        _1063 = _1119;
    }
    float _1121 = _1069;
    float _1123 = _1061;
    float _1125 = _1063;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = abs(_875);
    bool _1135 = _1133 != 0.0;
    bool _1137 = isnan(_1133);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan(0.0);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1147 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1129);
    float _1149 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1151 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1145);
    float _1155 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1147);
    float _1157 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1149);
    float _1159 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1157);
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1169 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1173 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1177 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1171);
    float _1181 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1173);
    float _1183 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1175);
    float _1185 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1187 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1189 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1179);
    float _1191 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1181);
    float _1193 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1183);
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1187);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1189);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1191);
    float _1201 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1193);
    out.gl_Position.x = _1197;
    out.gl_Position.y = _1195;
    out.gl_Position.z = _1199;
    out.gl_Position.w = _1201;
    if (_1143)
    {
        _923 = _1201;
    }
    float _1203 = _923;
    float _1205 = _1203;
    if (!_1143)
    {
        _1205 = 0.0;
    }
    float _1207 = _1205;
    float _1209 = _1207;
    if (!_1143)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_798)
    {
        int _1211 = _818 << 4;
        int _1213 = _1211 + 2048;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
        int _1219 = int(_1215) & 3;
        float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
        int _1223 = int(_1215) + 1;
        uint _1225 = uint(int(uint(_1223) >> uint(2)));
        int _1227 = _1223 & 3;
        float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
        int _1231 = _1213 + 8;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        uint _1235 = uint(int(uint(int(_1233)) >> uint(2)));
        int _1237 = int(_1233) & 3;
        float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
        int _1241 = int(_1233) + 1;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        int _1245 = _1241 & 3;
        float _1247 = (*spvDescriptorSet0.vp_c15)._m0[int(_1243)][_1245];
        float _1249 = _748 * _1229;
        float _1251 = fma(_544, _1221, _1249);
        float _1253 = fma(_548, _1239, _1251);
        float _1255 = _1253 + _1247;
        float _1257 = precise::clamp(_1255, 0.0, 1.0);
        float _1259 = -_1257;
        float _1261 = _1259 + _901;
        float _1263 = fma(_1261, 500.0, 1.5);
        float _1265 = exp2(_1263);
        float _1267 = 0.0 + _1265;
        float _1269 = precise::clamp(_1267, 0.0, 1.0);
        bool _1271 = _1269 >= 1.0;
        bool _1273 = isnan(_1269);
        bool _1275 = _1271 || _1273;
        bool _1277 = isnan(1.0);
        bool _1279 = _1275 || _1277;
        _1065 = _1247;
        if (!_1279)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1279)
        {
            _1209 = 0.0;
        }
    }
    float _1281 = _1065;
    float _1283 = _1209;
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1287 = _1121 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1291 = _1123 + _1289;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1295 = _1125 + _1293;
    float _1297 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1299 = _1287 * _1287;
    float _1301 = fma(_1291, _1291, _1299);
    float _1303 = fma(_1295, _1295, _1301);
    float _1305 = rsqrt(_1303);
    float _1307 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1309 = _1291 * _1307;
    float _1311 = _1295 * _1307;
    float _1313 = _1309 * _1309;
    float _1315 = _1311 * _1311;
    float _1317 = _1313 + _1315;
    float _1319 = sqrt(_1317);
    bool _1321 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1319 + _1323;
    float _1327 = _1305;
    float _1329 = _1317;
    float _1331 = _1325;
    float _1333 = _1281;
    float _1335 = _1287;
    float _1337 = _1307;
    if (_1321)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1339;
    }
    float _1341 = _1327;
    if (_1321)
    {
        float _1343 = rsqrt(_1317);
        _1329 = _1343;
    }
    float _1345 = _1329;
    if (_1321)
    {
        float _1347 = _1325 * _1341;
        _1331 = _1347;
    }
    float _1349 = _1331;
    if (_1321)
    {
        float _1351 = _1349 * 0.15915493667125701904296875;
        _1333 = _1351;
    }
    float _1353 = _1333;
    float _1355 = _901;
    float _1357 = _1353;
    if (_1321)
    {
        float _1359 = _1353 * 6.283185482025146484375;
        float _1361 = sin(_1359);
        _1355 = _1361;
    }
    float _1363 = _1355;
    float _1365 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1367 = precise::max(0.0, _1365);
    float _1369 = _1295;
    float _1371 = _1367;
    float _1373 = _1365;
    if (_1321)
    {
        float _1375 = _1353 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        _1369 = _1377;
    }
    float _1379 = _1369;
    float _1381 = -_1307;
    float _1383 = -_1367;
    float _1385 = fma(_1287, _1381, _1383);
    if (_1321)
    {
        float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1387;
    }
    float _1389 = _1371;
    float _1391 = _1363;
    float _1393 = _1389;
    if (_1321)
    {
        float _1395 = fma(_1363, _1389, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1335 = _1395;
    }
    float _1397 = _1335;
    float _1399 = _1397;
    if (!_1321)
    {
        _1391 = _1309;
    }
    float _1401 = _1391;
    float _1403 = _1401;
    if (!_1321)
    {
        _1393 = _1385;
    }
    float _1405 = _1393;
    float _1407 = _1405;
    float _1409 = _1379;
    if (_1321)
    {
        float _1411 = _1379 + (-1.0);
        _1373 = _1411;
    }
    float _1413 = _1373;
    if (_1321)
    {
        float _1415 = _1345 * _1397;
        _1357 = _1415;
    }
    float _1417 = _1357;
    if (!_1321)
    {
        _1399 = _1313;
    }
    float _1419 = _1399;
    float _1421 = _1419;
    if (_1321)
    {
        float _1423 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1423;
    }
    float _1425 = _1337;
    float _1427 = _1425;
    if (_1321)
    {
        float _1429 = _1309 * _1417;
        _1403 = _1429;
    }
    float _1431 = _1403;
    float _1433 = sqrt(_1303);
    if (_1321)
    {
        float _1435 = fma(_1385, _1379, _1425);
        _1407 = _1435;
    }
    float _1437 = _1407;
    if (!_1321)
    {
        _1409 = _1311;
    }
    float _1439 = _1409;
    float _1441 = _1439;
    if (_1321)
    {
        float _1443 = _1311 * _1417;
        _1441 = _1443;
    }
    float _1445 = _1441;
    if (_1321)
    {
        float _1447 = _1431 * _1431;
        _1421 = _1447;
    }
    float _1449 = _1421;
    if (!_1321)
    {
        _1427 = _1315;
    }
    float _1451 = _1427;
    float _1453 = _1451;
    if (_1321)
    {
        float _1455 = _1445 * _1445;
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = fma(_1437, _1437, _1449);
    float _1461 = 1.0 / _1283;
    float _1463 = _1459 + _1457;
    float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1467 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1465);
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = rsqrt(_1463);
    float _1473 = -_1469;
    float _1475 = _1473 + 1.0;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1479 = -_1297;
    float _1481 = fma(_1479, _1477, 1.0);
    float _1483 = _1197 * _1461;
    float _1485 = abs(_1475);
    float _1487 = log2(_1485);
    float _1489 = _1471 * _1431;
    float _1491 = _1471 * _1437;
    float _1493 = _1471 * _1445;
    float _1495 = log2(_1481);
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1499 = -_1497;
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1499);
    float _1503 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1505 = -_1493;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1501);
    float _1509 = _1491 + 1.0;
    float _1511 = exp2(_1503);
    float _1513 = fma(_1507, -0.5, 0.5);
    float _1515 = fma(_1507, 0.5, 0.5);
    float _1517 = _1495 * 0.693147182464599609375;
    float _1519 = fma(_1515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1521 = fma(_1483, 0.5, 0.5);
    float _1523 = sqrt(_1513);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1527 = fma(_1515, _1519, -0.212114393711090087890625);
    float _1529 = _1195 * _1461;
    float _1531 = fma(_1515, _1527, 1.570728778839111328125);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = -_1491;
    float _1537 = fma(_1511, _1509, _1535);
    float3 _4255 = float3(_1521, _1533, _1525);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4255, float3(0.0), isnan(_4255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4255, float3(0.0), isnan(_4255)), level(0.0)).x;
    float _1541 = fma(_1537, 0.5, 0.5);
    float _1543 = _1523 * 0.636619746685028076171875;
    float _1545 = -_1531;
    float _1547 = fma(_1543, _1545, 1.0);
    float3 _4274 = float3(_1521, _1533, _1525);
    float4 _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4274, float3(0.0), isnan(_4274)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4274, float3(0.0), isnan(_4274)), level(0.0)).xyzw;
    float _1552 = _1550.x;
    float _1554 = _1550.y;
    float _1556 = _1550.z;
    float _1558 = _1550.w;
    float2 _4290 = float2(_1547, _1541);
    float3 _1562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4290, float2(0.0), isnan(_4290)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4290, float2(0.0), isnan(_4290)), level(0.0)).xyz;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1572 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1574 = _1199 + _1201;
    bool _1576 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1578 = isnan(_1433);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1584 = _1580 || _1582;
    float _1586 = _552 * _1572;
    float _1588 = exp2(_1570);
    float _1590 = _1574 * 0.5;
    out.m_83.z = _1590;
    out.m_83.w = _1201;
    float _1592 = -_1588;
    float _1594 = _1592 + 1.0;
    float _1596 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1598 = -_1596;
    float _1600 = _1598 + 1.0;
    float _1602 = _1596 * _1539;
    float _1604 = _1596;
    if (!_1584)
    {
        _1604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1606 = _1604;
    float _1608 = _1558 * _1602;
    float _1610 = _1568 * _1602;
    float _1612 = fma(_1564, _1608, _1552);
    float _1614 = fma(_1566, _1608, _1554);
    float _1616 = _1558 * _1600;
    float _1618 = fma(_1558, _1610, _1556);
    float _1620 = _1608;
    float _1622 = _1610;
    float _1624 = _1606;
    float _1626 = _1606;
    if (!_1584)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1628 = _1620;
    float _1630 = _1628;
    float _1632 = _1628;
    if (!_1584)
    {
        _1622 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1634 = _1622;
    out.m_85.x = _1612;
    out.m_85.y = _1614;
    out.m_85.z = _1618;
    out.m_85.w = _1616;
    bool _1636 = !_1584;
    float _1638 = _1634;
    float _1640 = _1634;
    if (!_1636)
    {
        bool _1642 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1644 = isnan(_1433);
        bool _1646 = _1642 || _1644;
        bool _1648 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1650 = _1646 || _1648;
        if (!_1650)
        {
            float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1654 = _1433 + _1652;
            float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1658 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1656;
            float _1660 = 1.0 / _1658;
            float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1668 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1670 = _1654 * _1660;
            float _1672 = precise::clamp(_1670, 0.0, 1.0);
            float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1678 = fma(_1672, _1668, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1680 = fma(_1672, _1676, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1682 = fma(_1672, _1664, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1640 = _1682;
            _1632 = _1680;
            _1626 = _1678;
            _1684 = true;
        }
        else
        {
            bool _1686 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1688 = isnan(_1433);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1694 = _1690 || _1692;
            if (!_1694)
            {
                _1630 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1696 = _1630;
            _1632 = _1696;
            if (!_1694)
            {
                _1638 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1698 = _1638;
            _1640 = _1698;
            if (!_1694)
            {
                _1624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1700 = _1624;
            bool _1702 = !_1694;
            _1626 = _1700;
            if (!_1702)
            {
                bool _1704 = _1433 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1706 = isnan(_1433);
                bool _1708 = _1704 || _1706;
                bool _1710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1712 = _1708 || _1710;
                if (!_1712)
                {
                    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1716 = _1433 + _1714;
                    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1718;
                    float _1722 = 1.0 / _1720;
                    float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1726 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1730 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1732 = _1716 * _1722;
                    float _1734 = precise::clamp(_1732, 0.0, 1.0);
                    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1740 = fma(_1734, _1730, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1742 = fma(_1734, _1738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1744 = fma(_1734, _1726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1640 = _1744;
                    _1632 = _1742;
                    _1626 = _1740;
                    _1684 = true;
                }
                else
                {
                    _1640 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1632 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1684 = false;
    float _1746 = _1640;
    float _1748 = _1632;
    float _1750 = _1626;
    float _1752 = _1746 * 0.586610972881317138671875;
    bool _1754 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1756 = _1586 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1758 = fma(_1748, 0.298911988735198974609375, _1752);
    out.m_87.x = 0.0;
    float _1760 = fma(_1750, 0.114477999508380889892578125, _1758);
    out.m_56.x = _1756;
    float _1762 = -_1760;
    float _1764 = _1762 + _1748;
    float _1766 = -_1760;
    float _1768 = _1766 + _1746;
    float _1770 = -_1760;
    float _1772 = _1770 + _1750;
    float _1774 = fma(_1764, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    float _1776 = fma(_1768, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    float _1778 = fma(_1772, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1760);
    out.m_89.x = _1774;
    out.m_89.y = _1776;
    out.m_89.z = _1778;
    if (!_1754)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1780 = -_1121;
    float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1784 = -_1123;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1788 = -_1125;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1792 = _1782 * _1782;
    float _1794 = fma(_1786, _1786, _1792);
    float _1796 = fma(_1790, _1790, _1794);
    float _1798 = sqrt(_1796);
    float _1800 = rsqrt(_1796);
    float _1802 = -_1798;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1806 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1808 = precise::clamp(_1806, 0.0, 1.0);
    float _1810 = _1786 * _1800;
    float _1812 = _1782 * _1800;
    float _1814 = abs(_1808);
    float _1816 = log2(_1814);
    float _1818 = _1790 * _1800;
    float _1820 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1822 = _442 * _1812;
    float _1824 = -_1812;
    float _1826 = -_1820;
    float _1828 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1826);
    float _1830 = fma(_486, _1810, _1822);
    float _1832 = -_1818;
    float _1834 = fma(_1832, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1828);
    float _1836 = fma(_444, _1818, _1830);
    float _1838 = precise::clamp(_1836, 0.0, 1.0);
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1842 = _1834 + _1840;
    float _1844 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1846 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = exp2(_1844);
    float _1852 = _1850 * _1848;
    float _1854 = _1838 * _1852;
    float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1858 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1860 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1856;
    out.m_87.y = _1858;
    out.m_87.z = _1860;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

