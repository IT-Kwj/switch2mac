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
    float4 m_59 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_57 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_69 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1623 = false;
    bool _1006 = false;
    bool _310 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1856 = as_type<float>(_124);
        out.gl_Position.z = _1856;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_108);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1924 = as_type<float>(_160);
        out.gl_Position.z = _1924;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_57.x;
    float _170 = in.m_57.y;
    float _172 = in.m_57.z;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _184 = _182 != 0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _188 = _166 * _164;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _196 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _200 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _196 * 6.283185482025146484375;
    float _204 = floor(_196);
    float _206 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _208 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _210 = _202 * 0.15915493667125701904296875;
    float _212 = _186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _214 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _216 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _206);
    bool _218 = !_180;
    int _220 = _218 ? 0 : 1;
    float _222 = _210 * 6.283185482025146484375;
    float _224 = cos(_222);
    float _226 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _208);
    float _228 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _214);
    bool _230 = !_176;
    int _232 = _230 ? 0 : 1;
    out.m_59.x = _200;
    out.m_59.y = _198;
    out.m_59.z = _212;
    out.m_59.w = _192;
    int _234 = abs(_220);
    float _236 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _226);
    float _238 = -_204;
    float _240 = _196 + _238;
    bool _242 = !_184;
    int _244 = _242 ? 0 : 1;
    int _246 = abs(_232);
    float _248 = float(_234);
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _252 = fma(_224, 0.5, 0.5);
    int _254 = abs(_244);
    float _256 = -_240;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _260 = _240 < 0.5;
    float _262 = float(_260);
    float _264 = abs(_258);
    float _266 = _248 * _264;
    float _268 = -_252;
    float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _272 = float(_246);
    float _274 = -_262;
    float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _278 = float(_254);
    float _280 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _216);
    float _282 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _228);
    float _284 = fma(_272, _270, _266);
    float _286 = abs(_276);
    float _288 = fma(_278, _286, _284);
    bool _290 = !_250;
    bool _292 = false;
    float _308;
    if (!_290)
    {
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _296 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_108);
        float _314 = 1.0 / _312;
        float _316 = _142 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = in.m_61.x;
    float _322 = in.m_61.y;
    float _324 = in.m_61.z;
    float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _328 = in.m_63.x;
    float _330 = in.m_55.w;
    float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _336 = _334 != 0;
    float _338 = in.m_55.y;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _342 = _340 != 0;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _348 = _346 != 0;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _354 = _352 != 0;
    float _356 = in.m_65.y;
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = _322 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    out.m_67.x = _328;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_342)
    {
        bool _374 = _162 > 0.5;
        _292 = _374;
    }
    bool _376 = _292;
    float _378 = 0.0;
    if (_336)
    {
        float _380 = in.m_55.z;
        _378 = _380;
    }
    float _382 = _378;
    bool _384 = _330 > 0.5;
    float _386 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = 1.0 / _368;
    float _390 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _392 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _394 = in.m_48.x;
    float _396 = in.m_48.y;
    float _398 = in.m_48.z;
    float _400 = -_344;
    float _402 = fma(_386, 2.0, _400);
    float _404 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _390);
    float _406 = fma(_392, -2.0, _350);
    float _408 = 1.0 / _372;
    float _410 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _404);
    float _412 = _236 * _236;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _416 = _338 > 0.5;
    float _418 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _420 = fma(_280, _280, _412);
    float _422 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _414);
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _426 = in.m_69.x;
    float _428 = in.m_69.y;
    float _430 = in.m_69.z;
    float _432 = fma(_282, _282, _420);
    float _434 = rsqrt(_410);
    float _436 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].w, _424);
    float _438 = -_356;
    float _440 = _438 + 1.0;
    float _442 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _436);
    bool _444 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _446 = isnan(_318);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _458 = rsqrt(_432);
    float _460 = _396 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _462 = _396 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = _396 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _474 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].x, _460);
    float _476 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _478 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].x, _464);
    float _480 = _456 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _482 = _468 * _388;
    float _484 = _472 * _408;
    float _486 = _434 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _488 = _384 ? as_type<int>(_440) : as_type<int>(_356);
    float _490 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[191].y, _480);
    bool _492 = _384;
    float _494 = _356;
    float _496 = _476;
    if (_336)
    {
        bool _498 = _382 > 0.5;
        _492 = _498;
    }
    bool _500 = _492;
    float _502 = _280 * _458;
    float _504 = _282 * _458;
    float _506 = _236 * _458;
    float _508 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _422);
    float _510 = _486 * (-0.15915493667125701904296875);
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _514 = _504 * _512;
    float _516 = _490 * 0.15915493667125701904296875;
    float _518 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _406);
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _522 = _506 * _520;
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _526 = -_514;
    float _528 = fma(_502, _524, _526);
    float _530 = _516 * 6.283185482025146484375;
    float _532 = sin(_530);
    float _534 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _474);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _538 = _502 * _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _542 = -_522;
    float _544 = fma(_504, _540, _542);
    float _546 = -_142;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _552 = _318 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _556 = -_538;
    float _558 = fma(_506, _554, _556);
    float _560 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _476);
    float _562 = _510 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _528 * _528;
    float _568 = fma(_484, _552, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _570 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _478);
    float _572 = _534 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _574 = fma(_544, _544, _566);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _578 = _318 + _576;
    float _580 = _570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = _510 * 6.283185482025146484375;
    float _584 = cos(_582);
    float _586 = fma(_558, _558, _574);
    float _588 = fma(_482, _578, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _590 = _532 * _428;
    float _592 = in.m_65.x;
    float _594 = -_454;
    float _596 = _594 + 1.0;
    float _598 = _348 ? as_type<float>(_488) : _356;
    float _600 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[191].x, _426);
    float _602 = rsqrt(_586);
    float _604 = _564 * _430;
    float _606 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _600);
    if (_354)
    {
        float _610 = _416 ? _440 : _356;
        _494 = _610;
    }
    float _612 = _494;
    float _614 = _332 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _616 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _618 = _606 * _608;
    float _620 = _584 * _430;
    float _622 = -_604;
    float _624 = fma(_584, _428, _622);
    float _626 = fma(_358, _612, -0.5);
    float _628 = fma(_564, _428, _620);
    float _630 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    float _634 = -_518;
    float _636 = fma(_442, _626, _634);
    float _638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _628);
    float _640 = _558 * _602;
    float _642 = _630 * _632;
    float _644 = _528 * _602;
    float _646 = _418 * _638;
    float _648 = _544 * _602;
    float _650 = _642 * _502;
    float _652 = _506 * _640;
    float _654 = _502 * _644;
    float _656 = _642 * _504;
    float _658 = fma(_618, _648, _650);
    float _660 = -_652;
    float _662 = fma(_504, _644, _660);
    float _664 = -_654;
    float _666 = fma(_506, _648, _664);
    float _668 = fma(_618, _640, _656);
    float _670 = _642 * _506;
    float _672 = fma(_646, _662, _658);
    int _674 = 0;
    float _676 = _592;
    float _678 = _628;
    float _680 = _662;
    if (_342)
    {
        float _682 = -_592;
        float _684 = _682 + 1.0;
        _674 = as_type<int>(_684);
    }
    int _686 = _674;
    float _688 = fma(_646, _666, _668);
    bool _690 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _692 = isnan(_318);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = _572 + _672;
    float _704 = fma(_618, _644, _670);
    float _706 = _580 + _688;
    bool _708 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _710 = isnan(_318);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _722 = _702 + _720;
    float _724 = _702;
    float _726 = _706;
    if (!_342)
    {
        _496 = _592;
    }
    float _728 = _496;
    float _730 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _732 = _706 + _730;
    float _734 = _728;
    if (_342)
    {
        float _736 = _376 ? as_type<float>(_686) : _592;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = _722 * _722;
    float _742 = _718 * _596;
    float _744 = _732 * _732;
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = _504 * _648;
    bool _752 = _624 != 0.0;
    bool _754 = isnan(_624);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _740 + _744;
    float _764 = _700 * _748;
    float _766 = -_700;
    float _768 = _766 + 1.0;
    float _770 = -_750;
    float _772 = fma(_502, _640, _770);
    float _774 = sqrt(_762);
    float _776 = _588 * _764;
    int _778 = as_type<int>(_764);
    float _780 = _740;
    float _782 = _744;
    if (_336)
    {
        float _784 = -_592;
        float _786 = _784 + 1.0;
        _778 = as_type<int>(_786);
    }
    int _788 = _778;
    float _790 = fma(_614, _738, -0.5);
    float _792 = fma(_646, _772, _704);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[131].x, _776);
    bool _796 = _600 == 0.0;
    bool _798 = !_760;
    bool _800 = _796 && _798;
    float _802 = in.m_71.x;
    float _804 = in.m_71.y;
    float _806 = in.m_71.z;
    if (_336)
    {
        float _808 = _500 ? as_type<float>(_788) : _592;
        _676 = _808;
    }
    float _810 = _676;
    float _812 = fma(_568, _742, _794);
    float _814 = fma(_508, _790, _548);
    float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _818 = _628 == 0.0;
    bool _820 = _818 && _800;
    float _822 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[133].x, _812);
    float _824 = _616 + _792;
    bool _826 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _828 = !_826;
    float _830 = _824;
    float _832 = _804;
    float _834 = _802;
    float _836 = _806;
    float _838 = _814;
    float _840 = _816;
    if (!_828)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _774 + _844;
        float _848 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = rsqrt(_762);
        float _852 = _846 * _842;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _850 * _864;
        float _868 = _862 + (-1.0);
        float _870 = fma(_722, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _872 = fma(_732, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _878 = _870 + _876;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _882 = _872 + _880;
        float _884 = fma(_824, _862, _874);
        float _886 = _878 * _878;
        float _888 = _882 * _882;
        _830 = _884;
        _780 = _886;
        _782 = _888;
        _724 = _870;
        _726 = _872;
    }
    float _890 = _830;
    float _892 = _780;
    float _894 = _782;
    float _896 = _724;
    float _898 = _726;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _902 = _890 + _900;
    float _904 = in.m_63.y;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_820)
    {
        float _908 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[17].y, _804);
        _832 = _908;
    }
    float _910 = _832;
    float _912 = fma(_902, _902, _892);
    float _914 = in.m_63.z;
    if (!_820)
    {
        float _916 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _802);
        _834 = _916;
    }
    float _918 = _834;
    float _920 = _502 * _910;
    float _922 = _912 + _894;
    float _924 = _506 * _910;
    float _926 = _504 * _910;
    float _928 = fma(_648, _918, _920);
    if (!_820)
    {
        float _930 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _806);
        _836 = _930;
    }
    float _932 = _836;
    float _934 = fma(_644, _918, _924);
    float _936 = sqrt(_922);
    float _938 = fma(_640, _918, _926);
    float _940 = _598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _942 = _810 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _944 = fma(_662, _932, _928);
    float _946 = fma(_772, _932, _934);
    float _948 = _940 * _906;
    float _950 = _942 * _816;
    float _952 = _636 + 0.5;
    float _954 = _814 + 0.5;
    float _956 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _958 = fma(_666, _932, _938);
    out.m_67.y = _904;
    out.m_67.z = _914;
    bool _960 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _962 = isnan(_936);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _968 = _964 || _966;
    out.m_73.x = _954;
    out.m_73.y = _952;
    out.m_73.z = _950;
    out.m_73.w = _948;
    out.m_75.w = _956;
    out.m_77.x = _944;
    out.m_77.y = _946;
    out.m_77.z = _958;
    float _970 = _906;
    if (!_968)
    {
        _838 = 1.0;
    }
    float _972 = _838;
    bool _974 = !_968;
    float _976 = _972;
    if (!_974)
    {
        bool _978 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _980 = isnan(_936);
        bool _982 = _978 || _980;
        bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _986 = _982 || _984;
        if (!_986)
        {
            float _988 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _990 = _936 + _988;
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _998 = _996 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1000 = 1.0 / _994;
            float _1002 = _990 * _1000;
            float _1004 = fma(_1002, _998, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _976 = _1004;
            _1006 = true;
        }
        else
        {
            bool _1008 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1010 = isnan(_936);
            bool _1012 = _1008 || _1010;
            bool _1014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1016 = _1012 || _1014;
            if (!_1016)
            {
                float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1020 = _936 + _1018;
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _1022 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1030 = 1.0 / _1024;
                float _1032 = _1020 * _1030;
                float _1034 = fma(_1032, _1028, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _976 = _1034;
                _1006 = true;
            }
            else
            {
                _976 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1006 = false;
    float _1036 = _976;
    float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1040 = _890 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1044 = _896 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1048 = _898 + _1046;
    float _1050 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1052 = fma(_1044, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1054 = fma(_1048, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1050 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1052 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = _1058 * _1058;
    float _1070 = fma(_1062, _1062, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = rsqrt(_1072);
    float _1076 = sqrt(_1072);
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = _1062 * _1078;
    float _1082 = _1066 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = _1084 + _1086;
    float _1090 = sqrt(_1088);
    bool _1092 = _1090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1090 + _1094;
    float _1098 = _1066;
    float _1100 = _1096;
    float _1102 = _1058;
    if (_1092)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1104;
    }
    float _1106 = _1098;
    if (_1092)
    {
        float _1108 = rsqrt(_1088);
        _678 = _1108;
    }
    float _1110 = _678;
    float _1112 = _1110;
    if (_1092)
    {
        float _1114 = _1096 * _1106;
        _1100 = _1114;
    }
    float _1116 = _1100;
    if (_1092)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _970 = _1118;
    }
    float _1120 = _970;
    float _1122 = _1074;
    if (_1092)
    {
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1132 = precise::max(0.0, _1130);
    float _1134 = _1070;
    float _1136 = _1132;
    float _1138 = _1130;
    if (_1092)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = -_1078;
    float _1148 = -_1132;
    float _1150 = fma(_1058, _1146, _1148);
    float _1152 = _1150;
    if (!_1092)
    {
        _1136 = _1082;
    }
    float _1154 = _1136;
    float _1156 = _1154;
    if (_1092)
    {
        float _1158 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1138 = _1158;
    }
    float _1160 = _1138;
    float _1162 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = _1128;
    float _1166 = _1160;
    if (_1092)
    {
        float _1168 = fma(_1128, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1102 = _1168;
    }
    float _1170 = _1102;
    float _1172 = _1170;
    if (!_1092)
    {
        _1164 = _1080;
    }
    float _1174 = _1164;
    float _1176 = _1174;
    if (_1092)
    {
        float _1178 = _1144 + (-1.0);
        _1166 = _1178;
    }
    float _1180 = _1166;
    if (_1092)
    {
        float _1182 = _1110 * _1170;
        _840 = _1182;
    }
    float _1184 = _840;
    if (!_1092)
    {
        _1112 = _1084;
    }
    float _1186 = _1112;
    float _1188 = _1186;
    if (_1092)
    {
        float _1190 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _1190;
    }
    float _1192 = _680;
    if (_1092)
    {
        float _1194 = _1080 * _1184;
        _1176 = _1194;
    }
    float _1196 = _1176;
    if (_1092)
    {
        float _1198 = _1082 * _1184;
        _1156 = _1198;
    }
    float _1200 = _1156;
    if (!_1092)
    {
        _1172 = _1086;
    }
    float _1202 = _1172;
    float _1204 = _1202;
    if (_1092)
    {
        float _1206 = fma(_1150, _1144, _1192);
        _1152 = _1206;
    }
    float _1208 = _1152;
    if (_1092)
    {
        float _1210 = _1196 * _1196;
        _1188 = _1210;
    }
    float _1212 = _1188;
    if (_1092)
    {
        float _1214 = _1200 * _1200;
        _1204 = _1214;
    }
    float _1216 = _1204;
    float _1218 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1222 = fma(_1208, _1208, _1212);
    float _1224 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1226 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = _1222 + _1216;
    float _1230 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1232 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1234 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1220);
    float _1236 = rsqrt(_1228);
    float _1238 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1230);
    float _1240 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1242 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1224);
    float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1246 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1244);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1238);
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = -_1248;
    float _1258 = _1256 + 1.0;
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1262 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1234);
    float _1264 = fma(_580, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1266 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1252);
    float _1268 = abs(_1258);
    float _1270 = log2(_1268);
    float _1272 = fma(_572, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1274 = _1236 * _1208;
    float _1276 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1266);
    float _1278 = _1236 * _1196;
    float _1280 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1282 = _1236 * _1200;
    float _1284 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1286 = floor(_1272);
    float _1288 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1276);
    float _1290 = -_1284;
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1290);
    float _1294 = -_1282;
    float _1296 = fma(_1294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1292);
    float _1298 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1300 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1302 = fma(_1296, -0.5, 0.5);
    float _1304 = fma(_1296, 0.5, 0.5);
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1308 = floor(_1264);
    float _1310 = -_1286;
    float _1312 = _1272 + _1310;
    float _1314 = -_1298;
    float _1316 = fma(_1314, _1306, 1.0);
    float _1318 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1320 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1322 = exp2(_1300);
    float _1324 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1318);
    float _1326 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1324);
    float _1328 = 1.0 / _1288;
    float _1330 = fma(_1304, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1332 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1326);
    float _1334 = fma(_1304, _1330, -0.212114393711090087890625);
    float _1336 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1320);
    float _1338 = log2(_1316);
    float _1340 = fma(_1304, _1334, 1.570728778839111328125);
    float _1342 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1344 = _1274 + 1.0;
    float _1346 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1348 = -_1274;
    float _1350 = fma(_1322, _1344, _1348);
    float _1352 = sqrt(_1302);
    float _1354 = _1332 * _1328;
    float _1356 = _1346 * _1328;
    float _1358 = fma(_1354, 0.5, 0.5);
    float _1360 = fma(_1356, -0.5, 0.5);
    float _1362 = _1338 * 0.693147182464599609375;
    float _1364 = -_1308;
    float _1366 = _1264 + _1364;
    float _1368 = fma(_1350, 0.5, 0.5);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _3931 = float2(_1312, _1366);
    float _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3931, float2(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3931, float2(0.0), isnan(_3931)), level(0.0)).x;
    float _1374 = _1352 * 0.636619746685028076171875;
    float _1376 = -_1340;
    float _1378 = fma(_1374, _1376, 1.0);
    float3 _3950 = float3(_1358, _1360, _1370);
    float _1380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).x;
    float3 _3961 = float3(_1358, _1360, _1370);
    float4 _1383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3961, float3(0.0), isnan(_3961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3961, float3(0.0), isnan(_3961)), level(0.0)).xyzw;
    float _1385 = _1383.x;
    float _1387 = _1383.y;
    float _1389 = _1383.z;
    float _1391 = _1383.w;
    float2 _3977 = float2(_1378, _1368);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3977, float2(0.0), isnan(_3977)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3977, float2(0.0), isnan(_3977)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1405 = _616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1407 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1409 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1411 = isnan(_1076);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1417 = _1413 || _1415;
    float _1419 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1403);
    float _1421 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1405);
    float _1423 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1407);
    float _1425 = _1332 + _1288;
    float _1427 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1419);
    float _1429 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1421);
    float _1431 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1423);
    float _1433 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1435 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1437 = _1425 * 0.5;
    float _1439 = 1.0 / _1433;
    float _1441 = _1435 + _1433;
    float _1443 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1445 = _1441 * _1439;
    float _1447 = _1445 * 0.5;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1451 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1449);
    float _1453 = 1.0 / _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1457 = _1453 * _1455;
    float _1459 = abs(_1457);
    float _1461 = log2(_1459);
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1465 = exp2(_1463);
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = fma(_1469, -2.0, 3.0);
    float _1473 = _1469 * _1469;
    float _1475 = in.m_79.x;
    float _1477 = _1473 * _1471;
    float _1479 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1481 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1431);
    float _1483 = -_1477;
    float _1485 = _1483 + 1.0;
    float _1487 = _1481 + _1288;
    float _1489 = exp2(_1479);
    float _1491 = fma(_1485, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1477);
    bool _1493 = _1457 <= 8000.0;
    bool _1495 = isnan(_1457);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(8000.0);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = _1288 * 0.5;
    out.gl_Position.x = _1332;
    out.gl_Position.y = _1346;
    out.gl_Position.z = _1481;
    out.gl_Position.w = _1288;
    float _1507 = _1487 * 0.5;
    float _1509 = _1503 * _1491;
    float _1511 = fma(_1346, -0.5, _1505);
    float _1513 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _1437;
    out.m_81.y = _1511;
    out.m_81.z = _1507;
    out.m_81.w = _1288;
    float _1515 = -_1489;
    float _1517 = _1515 + 1.0;
    float _1519 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = -_1519;
    float _1523 = _1521 + 1.0;
    float _1525 = -_1372;
    float _1527 = _1525 + 1.0;
    float _1529 = _1527 * _1513;
    float _1531 = precise::clamp(_1529, 0.0, 1.0);
    float _1533 = -_1531;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1537 = _1519 * _1380;
    float _1539 = _1391 * _1523;
    float _1541 = _1535 * _1475;
    float _1543 = _1391 * _1537;
    float _1545 = _1401 * _1537;
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1549 = fma(_1397, _1543, _1385);
    float _1551 = fma(_1399, _1543, _1387);
    float _1553 = fma(_1391, _1545, _1389);
    float _1555 = _1541;
    float _1557 = _1543;
    float _1559 = _1545;
    if (!_1417)
    {
        _1555 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1561 = _1555;
    out.m_83.x = _1547;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1417)
    {
        _1557 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1567 = _1557;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1417)
    {
        _1559 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1573 = _1559;
    out.m_85.x = _1549;
    out.m_85.y = _1551;
    out.m_85.z = _1553;
    out.m_85.w = _1539;
    bool _1575 = !_1417;
    float _1577 = _1573;
    float _1579 = _1573;
    if (!_1575)
    {
        bool _1581 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1583 = isnan(_1076);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1593 = _1076 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1595;
            float _1599 = 1.0 / _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1609 = _1593 * _1599;
            float _1611 = precise::clamp(_1609, 0.0, 1.0);
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1617 = fma(_1611, _1603, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1619 = fma(_1611, _1615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1621 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1571 = _1617;
            _1565 = _1619;
            _1579 = _1621;
            _1623 = true;
        }
        else
        {
            bool _1625 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1627 = isnan(_1076);
            bool _1629 = _1625 || _1627;
            bool _1631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1633 = _1629 || _1631;
            if (!_1633)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1635 = _1563;
            _1565 = _1635;
            if (!_1633)
            {
                _1569 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1637 = _1569;
            _1571 = _1637;
            if (!_1633)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1639 = _1577;
            bool _1641 = !_1633;
            _1579 = _1639;
            if (!_1641)
            {
                bool _1643 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1645 = isnan(_1076);
                bool _1647 = _1643 || _1645;
                bool _1649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1651 = _1647 || _1649;
                if (!_1651)
                {
                    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1655 = _1076 + _1653;
                    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1657;
                    float _1661 = 1.0 / _1659;
                    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1665 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1669 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1671 = _1655 * _1661;
                    float _1673 = precise::clamp(_1671, 0.0, 1.0);
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1679 = fma(_1673, _1665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1681 = fma(_1673, _1677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1683 = fma(_1673, _1669, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1571 = _1679;
                    _1565 = _1681;
                    _1579 = _1683;
                    _1623 = true;
                }
                else
                {
                    _1571 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1623 = false;
    float _1685 = _1571;
    float _1687 = _1565;
    float _1689 = _1579;
    float _1691 = _1685 * 0.586610972881317138671875;
    bool _1693 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_87.x = 0.0;
    float _1695 = fma(_1687, 0.298911988735198974609375, _1691);
    float _1697 = _1443 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1699 = fma(_1689, 0.114477999508380889892578125, _1695);
    out.m_51.x = _1697;
    float _1701 = -_1699;
    float _1703 = _1701 + _1687;
    float _1705 = -_1699;
    float _1707 = _1705 + _1685;
    float _1709 = -_1699;
    float _1711 = _1709 + _1689;
    float _1713 = fma(_1703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    float _1715 = fma(_1707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    float _1717 = fma(_1711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    out.m_89.x = _1713;
    out.m_89.y = _1715;
    out.m_89.z = _1717;
    if (!_1693)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1719 = -_1050;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1723 = -_1052;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1727 = -_1054;
    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = sqrt(_1735);
    float _1739 = rsqrt(_1735);
    float _1741 = -_1737;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1745 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = _1725 * _1739;
    float _1751 = _1721 * _1739;
    float _1753 = abs(_1747);
    float _1755 = log2(_1753);
    float _1757 = _1729 * _1739;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1761 = _946 * _1751;
    float _1763 = -_1751;
    float _1765 = -_1759;
    float _1767 = fma(_1763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1765);
    float _1769 = fma(_944, _1749, _1761);
    float _1771 = -_1757;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1767);
    float _1775 = fma(_958, _1757, _1769);
    float _1777 = precise::clamp(_1775, 0.0, 1.0);
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1781 = _1773 + _1779;
    float _1783 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1785 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1787 = precise::clamp(_1785, 0.0, 1.0);
    float _1789 = exp2(_1783);
    float _1791 = _1789 * _1787;
    float _1793 = _1777 * _1791;
    float _1795 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1797 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1799 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1795;
    out.m_87.y = _1797;
    out.m_87.z = _1799;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1623 = false;
    bool _1006 = false;
    bool _310 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1856 = as_type<float>(_124);
        out.gl_Position.z = _1856;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_108);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1924 = as_type<float>(_160);
        out.gl_Position.z = _1924;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_57.x;
    float _170 = in.m_57.y;
    float _172 = in.m_57.z;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _184 = _182 != 0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _188 = _166 * _164;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _196 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _200 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _196 * 6.283185482025146484375;
    float _204 = floor(_196);
    float _206 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _208 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _210 = _202 * 0.15915493667125701904296875;
    float _212 = _186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _214 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _216 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _206);
    bool _218 = !_180;
    int _220 = _218 ? 0 : 1;
    float _222 = _210 * 6.283185482025146484375;
    float _224 = cos(_222);
    float _226 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _208);
    float _228 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _214);
    bool _230 = !_176;
    int _232 = _230 ? 0 : 1;
    out.m_59.x = _200;
    out.m_59.y = _198;
    out.m_59.z = _212;
    out.m_59.w = _192;
    int _234 = abs(_220);
    float _236 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _226);
    float _238 = -_204;
    float _240 = _196 + _238;
    bool _242 = !_184;
    int _244 = _242 ? 0 : 1;
    int _246 = abs(_232);
    float _248 = float(_234);
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _252 = fma(_224, 0.5, 0.5);
    int _254 = abs(_244);
    float _256 = -_240;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _260 = _240 < 0.5;
    float _262 = float(_260);
    float _264 = abs(_258);
    float _266 = _248 * _264;
    float _268 = -_252;
    float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _272 = float(_246);
    float _274 = -_262;
    float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _278 = float(_254);
    float _280 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _216);
    float _282 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _228);
    float _284 = fma(_272, _270, _266);
    float _286 = abs(_276);
    float _288 = fma(_278, _286, _284);
    bool _290 = !_250;
    bool _292 = false;
    float _308;
    if (!_290)
    {
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _296 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_108);
        float _314 = 1.0 / _312;
        float _316 = _142 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = in.m_61.x;
    float _322 = in.m_61.y;
    float _324 = in.m_61.z;
    float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _328 = in.m_63.x;
    float _330 = in.m_55.w;
    float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _336 = _334 != 0;
    float _338 = in.m_55.y;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _342 = _340 != 0;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _348 = _346 != 0;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _354 = _352 != 0;
    float _356 = in.m_65.y;
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = _322 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    out.m_67.x = _328;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_342)
    {
        bool _374 = _162 > 0.5;
        _292 = _374;
    }
    bool _376 = _292;
    float _378 = 0.0;
    if (_336)
    {
        float _380 = in.m_55.z;
        _378 = _380;
    }
    float _382 = _378;
    bool _384 = _330 > 0.5;
    float _386 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = 1.0 / _368;
    float _390 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _392 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _394 = in.m_48.x;
    float _396 = in.m_48.y;
    float _398 = in.m_48.z;
    float _400 = -_344;
    float _402 = fma(_386, 2.0, _400);
    float _404 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _390);
    float _406 = fma(_392, -2.0, _350);
    float _408 = 1.0 / _372;
    float _410 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _404);
    float _412 = _236 * _236;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _416 = _338 > 0.5;
    float _418 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _420 = fma(_280, _280, _412);
    float _422 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _414);
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _426 = in.m_69.x;
    float _428 = in.m_69.y;
    float _430 = in.m_69.z;
    float _432 = fma(_282, _282, _420);
    float _434 = rsqrt(_410);
    float _436 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].w, _424);
    float _438 = -_356;
    float _440 = _438 + 1.0;
    float _442 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _436);
    bool _444 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _446 = isnan(_318);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _458 = rsqrt(_432);
    float _460 = _396 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _462 = _396 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = _396 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _474 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].x, _460);
    float _476 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _478 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].x, _464);
    float _480 = _456 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _482 = _468 * _388;
    float _484 = _472 * _408;
    float _486 = _434 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _488 = _384 ? as_type<int>(_440) : as_type<int>(_356);
    float _490 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[191].y, _480);
    bool _492 = _384;
    float _494 = _356;
    float _496 = _476;
    if (_336)
    {
        bool _498 = _382 > 0.5;
        _492 = _498;
    }
    bool _500 = _492;
    float _502 = _280 * _458;
    float _504 = _282 * _458;
    float _506 = _236 * _458;
    float _508 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _422);
    float _510 = _486 * (-0.15915493667125701904296875);
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _514 = _504 * _512;
    float _516 = _490 * 0.15915493667125701904296875;
    float _518 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _406);
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _522 = _506 * _520;
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _526 = -_514;
    float _528 = fma(_502, _524, _526);
    float _530 = _516 * 6.283185482025146484375;
    float _532 = sin(_530);
    float _534 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _474);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _538 = _502 * _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _542 = -_522;
    float _544 = fma(_504, _540, _542);
    float _546 = -_142;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _552 = _318 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _556 = -_538;
    float _558 = fma(_506, _554, _556);
    float _560 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _476);
    float _562 = _510 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _528 * _528;
    float _568 = fma(_484, _552, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _570 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _478);
    float _572 = _534 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _574 = fma(_544, _544, _566);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _578 = _318 + _576;
    float _580 = _570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = _510 * 6.283185482025146484375;
    float _584 = cos(_582);
    float _586 = fma(_558, _558, _574);
    float _588 = fma(_482, _578, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _590 = _532 * _428;
    float _592 = in.m_65.x;
    float _594 = -_454;
    float _596 = _594 + 1.0;
    float _598 = _348 ? as_type<float>(_488) : _356;
    float _600 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[191].x, _426);
    float _602 = rsqrt(_586);
    float _604 = _564 * _430;
    float _606 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _600);
    if (_354)
    {
        float _610 = _416 ? _440 : _356;
        _494 = _610;
    }
    float _612 = _494;
    float _614 = _332 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _616 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _618 = _606 * _608;
    float _620 = _584 * _430;
    float _622 = -_604;
    float _624 = fma(_584, _428, _622);
    float _626 = fma(_358, _612, -0.5);
    float _628 = fma(_564, _428, _620);
    float _630 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    float _634 = -_518;
    float _636 = fma(_442, _626, _634);
    float _638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _628);
    float _640 = _558 * _602;
    float _642 = _630 * _632;
    float _644 = _528 * _602;
    float _646 = _418 * _638;
    float _648 = _544 * _602;
    float _650 = _642 * _502;
    float _652 = _506 * _640;
    float _654 = _502 * _644;
    float _656 = _642 * _504;
    float _658 = fma(_618, _648, _650);
    float _660 = -_652;
    float _662 = fma(_504, _644, _660);
    float _664 = -_654;
    float _666 = fma(_506, _648, _664);
    float _668 = fma(_618, _640, _656);
    float _670 = _642 * _506;
    float _672 = fma(_646, _662, _658);
    int _674 = 0;
    float _676 = _592;
    float _678 = _628;
    float _680 = _662;
    if (_342)
    {
        float _682 = -_592;
        float _684 = _682 + 1.0;
        _674 = as_type<int>(_684);
    }
    int _686 = _674;
    float _688 = fma(_646, _666, _668);
    bool _690 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _692 = isnan(_318);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = _572 + _672;
    float _704 = fma(_618, _644, _670);
    float _706 = _580 + _688;
    bool _708 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _710 = isnan(_318);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _722 = _702 + _720;
    float _724 = _702;
    float _726 = _706;
    if (!_342)
    {
        _496 = _592;
    }
    float _728 = _496;
    float _730 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _732 = _706 + _730;
    float _734 = _728;
    if (_342)
    {
        float _736 = _376 ? as_type<float>(_686) : _592;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = _722 * _722;
    float _742 = _718 * _596;
    float _744 = _732 * _732;
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = _504 * _648;
    bool _752 = _624 != 0.0;
    bool _754 = isnan(_624);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _740 + _744;
    float _764 = _700 * _748;
    float _766 = -_700;
    float _768 = _766 + 1.0;
    float _770 = -_750;
    float _772 = fma(_502, _640, _770);
    float _774 = sqrt(_762);
    float _776 = _588 * _764;
    int _778 = as_type<int>(_764);
    float _780 = _740;
    float _782 = _744;
    if (_336)
    {
        float _784 = -_592;
        float _786 = _784 + 1.0;
        _778 = as_type<int>(_786);
    }
    int _788 = _778;
    float _790 = fma(_614, _738, -0.5);
    float _792 = fma(_646, _772, _704);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[131].x, _776);
    bool _796 = _600 == 0.0;
    bool _798 = !_760;
    bool _800 = _796 && _798;
    float _802 = in.m_71.x;
    float _804 = in.m_71.y;
    float _806 = in.m_71.z;
    if (_336)
    {
        float _808 = _500 ? as_type<float>(_788) : _592;
        _676 = _808;
    }
    float _810 = _676;
    float _812 = fma(_568, _742, _794);
    float _814 = fma(_508, _790, _548);
    float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _818 = _628 == 0.0;
    bool _820 = _818 && _800;
    float _822 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[133].x, _812);
    float _824 = _616 + _792;
    bool _826 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _828 = !_826;
    float _830 = _824;
    float _832 = _804;
    float _834 = _802;
    float _836 = _806;
    float _838 = _814;
    float _840 = _816;
    if (!_828)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _774 + _844;
        float _848 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = rsqrt(_762);
        float _852 = _846 * _842;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _850 * _864;
        float _868 = _862 + (-1.0);
        float _870 = fma(_722, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _872 = fma(_732, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _878 = _870 + _876;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _882 = _872 + _880;
        float _884 = fma(_824, _862, _874);
        float _886 = _878 * _878;
        float _888 = _882 * _882;
        _830 = _884;
        _780 = _886;
        _782 = _888;
        _724 = _870;
        _726 = _872;
    }
    float _890 = _830;
    float _892 = _780;
    float _894 = _782;
    float _896 = _724;
    float _898 = _726;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _902 = _890 + _900;
    float _904 = in.m_63.y;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_820)
    {
        float _908 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[17].y, _804);
        _832 = _908;
    }
    float _910 = _832;
    float _912 = fma(_902, _902, _892);
    float _914 = in.m_63.z;
    if (!_820)
    {
        float _916 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _802);
        _834 = _916;
    }
    float _918 = _834;
    float _920 = _502 * _910;
    float _922 = _912 + _894;
    float _924 = _506 * _910;
    float _926 = _504 * _910;
    float _928 = fma(_648, _918, _920);
    if (!_820)
    {
        float _930 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _806);
        _836 = _930;
    }
    float _932 = _836;
    float _934 = fma(_644, _918, _924);
    float _936 = sqrt(_922);
    float _938 = fma(_640, _918, _926);
    float _940 = _598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _942 = _810 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _944 = fma(_662, _932, _928);
    float _946 = fma(_772, _932, _934);
    float _948 = _940 * _906;
    float _950 = _942 * _816;
    float _952 = _636 + 0.5;
    float _954 = _814 + 0.5;
    float _956 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _958 = fma(_666, _932, _938);
    out.m_67.y = _904;
    out.m_67.z = _914;
    bool _960 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _962 = isnan(_936);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _968 = _964 || _966;
    out.m_73.x = _954;
    out.m_73.y = _952;
    out.m_73.z = _950;
    out.m_73.w = _948;
    out.m_75.w = _956;
    out.m_77.x = _944;
    out.m_77.y = _946;
    out.m_77.z = _958;
    float _970 = _906;
    if (!_968)
    {
        _838 = 1.0;
    }
    float _972 = _838;
    bool _974 = !_968;
    float _976 = _972;
    if (!_974)
    {
        bool _978 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _980 = isnan(_936);
        bool _982 = _978 || _980;
        bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _986 = _982 || _984;
        if (!_986)
        {
            float _988 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _990 = _936 + _988;
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _998 = _996 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1000 = 1.0 / _994;
            float _1002 = _990 * _1000;
            float _1004 = fma(_1002, _998, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _976 = _1004;
            _1006 = true;
        }
        else
        {
            bool _1008 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1010 = isnan(_936);
            bool _1012 = _1008 || _1010;
            bool _1014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1016 = _1012 || _1014;
            if (!_1016)
            {
                float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1020 = _936 + _1018;
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _1022 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1030 = 1.0 / _1024;
                float _1032 = _1020 * _1030;
                float _1034 = fma(_1032, _1028, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _976 = _1034;
                _1006 = true;
            }
            else
            {
                _976 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1006 = false;
    float _1036 = _976;
    float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1040 = _890 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1044 = _896 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1048 = _898 + _1046;
    float _1050 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1052 = fma(_1044, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1054 = fma(_1048, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1050 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1052 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = _1058 * _1058;
    float _1070 = fma(_1062, _1062, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = rsqrt(_1072);
    float _1076 = sqrt(_1072);
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = _1062 * _1078;
    float _1082 = _1066 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = _1084 + _1086;
    float _1090 = sqrt(_1088);
    bool _1092 = _1090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1090 + _1094;
    float _1098 = _1066;
    float _1100 = _1096;
    float _1102 = _1058;
    if (_1092)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1104;
    }
    float _1106 = _1098;
    if (_1092)
    {
        float _1108 = rsqrt(_1088);
        _678 = _1108;
    }
    float _1110 = _678;
    float _1112 = _1110;
    if (_1092)
    {
        float _1114 = _1096 * _1106;
        _1100 = _1114;
    }
    float _1116 = _1100;
    if (_1092)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _970 = _1118;
    }
    float _1120 = _970;
    float _1122 = _1074;
    if (_1092)
    {
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1132 = precise::max(0.0, _1130);
    float _1134 = _1070;
    float _1136 = _1132;
    float _1138 = _1130;
    if (_1092)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = -_1078;
    float _1148 = -_1132;
    float _1150 = fma(_1058, _1146, _1148);
    float _1152 = _1150;
    if (!_1092)
    {
        _1136 = _1082;
    }
    float _1154 = _1136;
    float _1156 = _1154;
    if (_1092)
    {
        float _1158 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1138 = _1158;
    }
    float _1160 = _1138;
    float _1162 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = _1128;
    float _1166 = _1160;
    if (_1092)
    {
        float _1168 = fma(_1128, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1102 = _1168;
    }
    float _1170 = _1102;
    float _1172 = _1170;
    if (!_1092)
    {
        _1164 = _1080;
    }
    float _1174 = _1164;
    float _1176 = _1174;
    if (_1092)
    {
        float _1178 = _1144 + (-1.0);
        _1166 = _1178;
    }
    float _1180 = _1166;
    if (_1092)
    {
        float _1182 = _1110 * _1170;
        _840 = _1182;
    }
    float _1184 = _840;
    if (!_1092)
    {
        _1112 = _1084;
    }
    float _1186 = _1112;
    float _1188 = _1186;
    if (_1092)
    {
        float _1190 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _1190;
    }
    float _1192 = _680;
    if (_1092)
    {
        float _1194 = _1080 * _1184;
        _1176 = _1194;
    }
    float _1196 = _1176;
    if (_1092)
    {
        float _1198 = _1082 * _1184;
        _1156 = _1198;
    }
    float _1200 = _1156;
    if (!_1092)
    {
        _1172 = _1086;
    }
    float _1202 = _1172;
    float _1204 = _1202;
    if (_1092)
    {
        float _1206 = fma(_1150, _1144, _1192);
        _1152 = _1206;
    }
    float _1208 = _1152;
    if (_1092)
    {
        float _1210 = _1196 * _1196;
        _1188 = _1210;
    }
    float _1212 = _1188;
    if (_1092)
    {
        float _1214 = _1200 * _1200;
        _1204 = _1214;
    }
    float _1216 = _1204;
    float _1218 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1222 = fma(_1208, _1208, _1212);
    float _1224 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1226 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = _1222 + _1216;
    float _1230 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1232 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1234 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1220);
    float _1236 = rsqrt(_1228);
    float _1238 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1230);
    float _1240 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1242 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1224);
    float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1246 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1244);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1238);
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = -_1248;
    float _1258 = _1256 + 1.0;
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1262 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1234);
    float _1264 = fma(_580, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1266 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1252);
    float _1268 = abs(_1258);
    float _1270 = log2(_1268);
    float _1272 = fma(_572, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1274 = _1236 * _1208;
    float _1276 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1266);
    float _1278 = _1236 * _1196;
    float _1280 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1282 = _1236 * _1200;
    float _1284 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1286 = floor(_1272);
    float _1288 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1276);
    float _1290 = -_1284;
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1290);
    float _1294 = -_1282;
    float _1296 = fma(_1294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1292);
    float _1298 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1300 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1302 = fma(_1296, -0.5, 0.5);
    float _1304 = fma(_1296, 0.5, 0.5);
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1308 = floor(_1264);
    float _1310 = -_1286;
    float _1312 = _1272 + _1310;
    float _1314 = -_1298;
    float _1316 = fma(_1314, _1306, 1.0);
    float _1318 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1320 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1322 = exp2(_1300);
    float _1324 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1318);
    float _1326 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1324);
    float _1328 = 1.0 / _1288;
    float _1330 = fma(_1304, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1332 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1326);
    float _1334 = fma(_1304, _1330, -0.212114393711090087890625);
    float _1336 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1320);
    float _1338 = log2(_1316);
    float _1340 = fma(_1304, _1334, 1.570728778839111328125);
    float _1342 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1344 = _1274 + 1.0;
    float _1346 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1348 = -_1274;
    float _1350 = fma(_1322, _1344, _1348);
    float _1352 = sqrt(_1302);
    float _1354 = _1332 * _1328;
    float _1356 = _1346 * _1328;
    float _1358 = fma(_1354, 0.5, 0.5);
    float _1360 = fma(_1356, -0.5, 0.5);
    float _1362 = _1338 * 0.693147182464599609375;
    float _1364 = -_1308;
    float _1366 = _1264 + _1364;
    float _1368 = fma(_1350, 0.5, 0.5);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _3931 = float2(_1312, _1366);
    float _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3931, float2(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3931, float2(0.0), isnan(_3931)), level(0.0)).x;
    float _1374 = _1352 * 0.636619746685028076171875;
    float _1376 = -_1340;
    float _1378 = fma(_1374, _1376, 1.0);
    float3 _3950 = float3(_1358, _1360, _1370);
    float _1380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).x;
    float3 _3961 = float3(_1358, _1360, _1370);
    float4 _1383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3961, float3(0.0), isnan(_3961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3961, float3(0.0), isnan(_3961)), level(0.0)).xyzw;
    float _1385 = _1383.x;
    float _1387 = _1383.y;
    float _1389 = _1383.z;
    float _1391 = _1383.w;
    float2 _3977 = float2(_1378, _1368);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3977, float2(0.0), isnan(_3977)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3977, float2(0.0), isnan(_3977)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1405 = _616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1407 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1409 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1411 = isnan(_1076);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1417 = _1413 || _1415;
    float _1419 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1403);
    float _1421 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1405);
    float _1423 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1407);
    float _1425 = _1332 + _1288;
    float _1427 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1419);
    float _1429 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1421);
    float _1431 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1423);
    float _1433 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1435 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1437 = _1425 * 0.5;
    float _1439 = 1.0 / _1433;
    float _1441 = _1435 + _1433;
    float _1443 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1445 = _1441 * _1439;
    float _1447 = _1445 * 0.5;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1451 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1449);
    float _1453 = 1.0 / _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1457 = _1453 * _1455;
    float _1459 = abs(_1457);
    float _1461 = log2(_1459);
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1465 = exp2(_1463);
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = fma(_1469, -2.0, 3.0);
    float _1473 = _1469 * _1469;
    float _1475 = in.m_79.x;
    float _1477 = _1473 * _1471;
    float _1479 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1481 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1431);
    float _1483 = -_1477;
    float _1485 = _1483 + 1.0;
    float _1487 = _1481 + _1288;
    float _1489 = exp2(_1479);
    float _1491 = fma(_1485, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1477);
    bool _1493 = _1457 <= 8000.0;
    bool _1495 = isnan(_1457);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(8000.0);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = _1288 * 0.5;
    out.gl_Position.x = _1332;
    out.gl_Position.y = _1346;
    out.gl_Position.z = _1481;
    out.gl_Position.w = _1288;
    float _1507 = _1487 * 0.5;
    float _1509 = _1503 * _1491;
    float _1511 = fma(_1346, -0.5, _1505);
    float _1513 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _1437;
    out.m_81.y = _1511;
    out.m_81.z = _1507;
    out.m_81.w = _1288;
    float _1515 = -_1489;
    float _1517 = _1515 + 1.0;
    float _1519 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = -_1519;
    float _1523 = _1521 + 1.0;
    float _1525 = -_1372;
    float _1527 = _1525 + 1.0;
    float _1529 = _1527 * _1513;
    float _1531 = precise::clamp(_1529, 0.0, 1.0);
    float _1533 = -_1531;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1537 = _1519 * _1380;
    float _1539 = _1391 * _1523;
    float _1541 = _1535 * _1475;
    float _1543 = _1391 * _1537;
    float _1545 = _1401 * _1537;
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1549 = fma(_1397, _1543, _1385);
    float _1551 = fma(_1399, _1543, _1387);
    float _1553 = fma(_1391, _1545, _1389);
    float _1555 = _1541;
    float _1557 = _1543;
    float _1559 = _1545;
    if (!_1417)
    {
        _1555 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1561 = _1555;
    out.m_83.x = _1547;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1417)
    {
        _1557 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1567 = _1557;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1417)
    {
        _1559 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1573 = _1559;
    out.m_85.x = _1549;
    out.m_85.y = _1551;
    out.m_85.z = _1553;
    out.m_85.w = _1539;
    bool _1575 = !_1417;
    float _1577 = _1573;
    float _1579 = _1573;
    if (!_1575)
    {
        bool _1581 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1583 = isnan(_1076);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1593 = _1076 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1595;
            float _1599 = 1.0 / _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1609 = _1593 * _1599;
            float _1611 = precise::clamp(_1609, 0.0, 1.0);
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1617 = fma(_1611, _1603, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1619 = fma(_1611, _1615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1621 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1571 = _1617;
            _1565 = _1619;
            _1579 = _1621;
            _1623 = true;
        }
        else
        {
            bool _1625 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1627 = isnan(_1076);
            bool _1629 = _1625 || _1627;
            bool _1631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1633 = _1629 || _1631;
            if (!_1633)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1635 = _1563;
            _1565 = _1635;
            if (!_1633)
            {
                _1569 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1637 = _1569;
            _1571 = _1637;
            if (!_1633)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1639 = _1577;
            bool _1641 = !_1633;
            _1579 = _1639;
            if (!_1641)
            {
                bool _1643 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1645 = isnan(_1076);
                bool _1647 = _1643 || _1645;
                bool _1649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1651 = _1647 || _1649;
                if (!_1651)
                {
                    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1655 = _1076 + _1653;
                    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1657;
                    float _1661 = 1.0 / _1659;
                    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1665 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1669 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1671 = _1655 * _1661;
                    float _1673 = precise::clamp(_1671, 0.0, 1.0);
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1679 = fma(_1673, _1665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1681 = fma(_1673, _1677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1683 = fma(_1673, _1669, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1571 = _1679;
                    _1565 = _1681;
                    _1579 = _1683;
                    _1623 = true;
                }
                else
                {
                    _1571 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1623 = false;
    float _1685 = _1571;
    float _1687 = _1565;
    float _1689 = _1579;
    float _1691 = _1685 * 0.586610972881317138671875;
    bool _1693 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_87.x = 0.0;
    float _1695 = fma(_1687, 0.298911988735198974609375, _1691);
    float _1697 = _1443 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1699 = fma(_1689, 0.114477999508380889892578125, _1695);
    out.m_51.x = _1697;
    float _1701 = -_1699;
    float _1703 = _1701 + _1687;
    float _1705 = -_1699;
    float _1707 = _1705 + _1685;
    float _1709 = -_1699;
    float _1711 = _1709 + _1689;
    float _1713 = fma(_1703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    float _1715 = fma(_1707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    float _1717 = fma(_1711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    out.m_89.x = _1713;
    out.m_89.y = _1715;
    out.m_89.z = _1717;
    if (!_1693)
    {
        return out;
    }
    float _1719 = -_1050;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1723 = -_1052;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1727 = -_1054;
    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = sqrt(_1735);
    float _1739 = rsqrt(_1735);
    float _1741 = -_1737;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1745 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = _1725 * _1739;
    float _1751 = _1721 * _1739;
    float _1753 = abs(_1747);
    float _1755 = log2(_1753);
    float _1757 = _1729 * _1739;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1761 = _946 * _1751;
    float _1763 = -_1751;
    float _1765 = -_1759;
    float _1767 = fma(_1763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1765);
    float _1769 = fma(_944, _1749, _1761);
    float _1771 = -_1757;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1767);
    float _1775 = fma(_958, _1757, _1769);
    float _1777 = precise::clamp(_1775, 0.0, 1.0);
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1781 = _1773 + _1779;
    float _1783 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1785 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1787 = precise::clamp(_1785, 0.0, 1.0);
    float _1789 = exp2(_1783);
    float _1791 = _1789 * _1787;
    float _1793 = _1777 * _1791;
    float _1795 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1797 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1799 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1795;
    out.m_87.y = _1797;
    out.m_87.z = _1799;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1623 = false;
    bool _1006 = false;
    bool _310 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1856 = as_type<float>(_124);
        out.gl_Position.z = _1856;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_108);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1924 = as_type<float>(_160);
        out.gl_Position.z = _1924;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_57.x;
    float _170 = in.m_57.y;
    float _172 = in.m_57.z;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _184 = _182 != 0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _188 = _166 * _164;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _196 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _200 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _196 * 6.283185482025146484375;
    float _204 = floor(_196);
    float _206 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _208 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _210 = _202 * 0.15915493667125701904296875;
    float _212 = _186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _214 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _216 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _206);
    bool _218 = !_180;
    int _220 = _218 ? 0 : 1;
    float _222 = _210 * 6.283185482025146484375;
    float _224 = cos(_222);
    float _226 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _208);
    float _228 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _214);
    bool _230 = !_176;
    int _232 = _230 ? 0 : 1;
    out.m_59.x = _200;
    out.m_59.y = _198;
    out.m_59.z = _212;
    out.m_59.w = _192;
    int _234 = abs(_220);
    float _236 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _226);
    float _238 = -_204;
    float _240 = _196 + _238;
    bool _242 = !_184;
    int _244 = _242 ? 0 : 1;
    int _246 = abs(_232);
    float _248 = float(_234);
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _252 = fma(_224, 0.5, 0.5);
    int _254 = abs(_244);
    float _256 = -_240;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _260 = _240 < 0.5;
    float _262 = float(_260);
    float _264 = abs(_258);
    float _266 = _248 * _264;
    float _268 = -_252;
    float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _272 = float(_246);
    float _274 = -_262;
    float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _278 = float(_254);
    float _280 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _216);
    float _282 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _228);
    float _284 = fma(_272, _270, _266);
    float _286 = abs(_276);
    float _288 = fma(_278, _286, _284);
    bool _290 = !_250;
    bool _292 = false;
    float _308;
    if (!_290)
    {
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _296 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_108);
        float _314 = 1.0 / _312;
        float _316 = _142 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = in.m_61.x;
    float _322 = in.m_61.y;
    float _324 = in.m_61.z;
    float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _328 = in.m_63.x;
    float _330 = in.m_55.w;
    float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _336 = _334 != 0;
    float _338 = in.m_55.y;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _342 = _340 != 0;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _348 = _346 != 0;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _354 = _352 != 0;
    float _356 = in.m_65.y;
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = _322 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    out.m_67.x = _328;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_342)
    {
        bool _374 = _162 > 0.5;
        _292 = _374;
    }
    bool _376 = _292;
    float _378 = 0.0;
    if (_336)
    {
        float _380 = in.m_55.z;
        _378 = _380;
    }
    float _382 = _378;
    bool _384 = _330 > 0.5;
    float _386 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = 1.0 / _368;
    float _390 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _392 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _394 = in.m_48.x;
    float _396 = in.m_48.y;
    float _398 = in.m_48.z;
    float _400 = -_344;
    float _402 = fma(_386, 2.0, _400);
    float _404 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _390);
    float _406 = fma(_392, -2.0, _350);
    float _408 = 1.0 / _372;
    float _410 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _404);
    float _412 = _236 * _236;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _416 = _338 > 0.5;
    float _418 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _420 = fma(_280, _280, _412);
    float _422 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _414);
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _426 = in.m_69.x;
    float _428 = in.m_69.y;
    float _430 = in.m_69.z;
    float _432 = fma(_282, _282, _420);
    float _434 = rsqrt(_410);
    float _436 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].w, _424);
    float _438 = -_356;
    float _440 = _438 + 1.0;
    float _442 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _436);
    bool _444 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _446 = isnan(_318);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _458 = rsqrt(_432);
    float _460 = _396 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _462 = _396 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = _396 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _474 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].x, _460);
    float _476 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _478 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].x, _464);
    float _480 = _456 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _482 = _468 * _388;
    float _484 = _472 * _408;
    float _486 = _434 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _488 = _384 ? as_type<int>(_440) : as_type<int>(_356);
    float _490 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[191].y, _480);
    bool _492 = _384;
    float _494 = _356;
    float _496 = _476;
    if (_336)
    {
        bool _498 = _382 > 0.5;
        _492 = _498;
    }
    bool _500 = _492;
    float _502 = _280 * _458;
    float _504 = _282 * _458;
    float _506 = _236 * _458;
    float _508 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _422);
    float _510 = _486 * (-0.15915493667125701904296875);
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _514 = _504 * _512;
    float _516 = _490 * 0.15915493667125701904296875;
    float _518 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _406);
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _522 = _506 * _520;
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _526 = -_514;
    float _528 = fma(_502, _524, _526);
    float _530 = _516 * 6.283185482025146484375;
    float _532 = sin(_530);
    float _534 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _474);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _538 = _502 * _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _542 = -_522;
    float _544 = fma(_504, _540, _542);
    float _546 = -_142;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _552 = _318 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _556 = -_538;
    float _558 = fma(_506, _554, _556);
    float _560 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _476);
    float _562 = _510 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _528 * _528;
    float _568 = fma(_484, _552, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _570 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _478);
    float _572 = _534 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _574 = fma(_544, _544, _566);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _578 = _318 + _576;
    float _580 = _570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = _510 * 6.283185482025146484375;
    float _584 = cos(_582);
    float _586 = fma(_558, _558, _574);
    float _588 = fma(_482, _578, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _590 = _532 * _428;
    float _592 = in.m_65.x;
    float _594 = -_454;
    float _596 = _594 + 1.0;
    float _598 = _348 ? as_type<float>(_488) : _356;
    float _600 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[191].x, _426);
    float _602 = rsqrt(_586);
    float _604 = _564 * _430;
    float _606 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _600);
    if (_354)
    {
        float _610 = _416 ? _440 : _356;
        _494 = _610;
    }
    float _612 = _494;
    float _614 = _332 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _616 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _618 = _606 * _608;
    float _620 = _584 * _430;
    float _622 = -_604;
    float _624 = fma(_584, _428, _622);
    float _626 = fma(_358, _612, -0.5);
    float _628 = fma(_564, _428, _620);
    float _630 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    float _634 = -_518;
    float _636 = fma(_442, _626, _634);
    float _638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _628);
    float _640 = _558 * _602;
    float _642 = _630 * _632;
    float _644 = _528 * _602;
    float _646 = _418 * _638;
    float _648 = _544 * _602;
    float _650 = _642 * _502;
    float _652 = _506 * _640;
    float _654 = _502 * _644;
    float _656 = _642 * _504;
    float _658 = fma(_618, _648, _650);
    float _660 = -_652;
    float _662 = fma(_504, _644, _660);
    float _664 = -_654;
    float _666 = fma(_506, _648, _664);
    float _668 = fma(_618, _640, _656);
    float _670 = _642 * _506;
    float _672 = fma(_646, _662, _658);
    int _674 = 0;
    float _676 = _592;
    float _678 = _628;
    float _680 = _662;
    if (_342)
    {
        float _682 = -_592;
        float _684 = _682 + 1.0;
        _674 = as_type<int>(_684);
    }
    int _686 = _674;
    float _688 = fma(_646, _666, _668);
    bool _690 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _692 = isnan(_318);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = _572 + _672;
    float _704 = fma(_618, _644, _670);
    float _706 = _580 + _688;
    bool _708 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _710 = isnan(_318);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _722 = _702 + _720;
    float _724 = _702;
    float _726 = _706;
    if (!_342)
    {
        _496 = _592;
    }
    float _728 = _496;
    float _730 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _732 = _706 + _730;
    float _734 = _728;
    if (_342)
    {
        float _736 = _376 ? as_type<float>(_686) : _592;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = _722 * _722;
    float _742 = _718 * _596;
    float _744 = _732 * _732;
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = _504 * _648;
    bool _752 = _624 != 0.0;
    bool _754 = isnan(_624);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _740 + _744;
    float _764 = _700 * _748;
    float _766 = -_700;
    float _768 = _766 + 1.0;
    float _770 = -_750;
    float _772 = fma(_502, _640, _770);
    float _774 = sqrt(_762);
    float _776 = _588 * _764;
    int _778 = as_type<int>(_764);
    float _780 = _740;
    float _782 = _744;
    if (_336)
    {
        float _784 = -_592;
        float _786 = _784 + 1.0;
        _778 = as_type<int>(_786);
    }
    int _788 = _778;
    float _790 = fma(_614, _738, -0.5);
    float _792 = fma(_646, _772, _704);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[131].x, _776);
    bool _796 = _600 == 0.0;
    bool _798 = !_760;
    bool _800 = _796 && _798;
    float _802 = in.m_71.x;
    float _804 = in.m_71.y;
    float _806 = in.m_71.z;
    if (_336)
    {
        float _808 = _500 ? as_type<float>(_788) : _592;
        _676 = _808;
    }
    float _810 = _676;
    float _812 = fma(_568, _742, _794);
    float _814 = fma(_508, _790, _548);
    float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _818 = _628 == 0.0;
    bool _820 = _818 && _800;
    float _822 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[133].x, _812);
    float _824 = _616 + _792;
    bool _826 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _828 = !_826;
    float _830 = _824;
    float _832 = _804;
    float _834 = _802;
    float _836 = _806;
    float _838 = _814;
    float _840 = _816;
    if (!_828)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _774 + _844;
        float _848 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = rsqrt(_762);
        float _852 = _846 * _842;
        float _854 = _852 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _850 * _864;
        float _868 = _862 + (-1.0);
        float _870 = fma(_722, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _872 = fma(_732, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _878 = _870 + _876;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _882 = _872 + _880;
        float _884 = fma(_824, _862, _874);
        float _886 = _878 * _878;
        float _888 = _882 * _882;
        _830 = _884;
        _780 = _886;
        _782 = _888;
        _724 = _870;
        _726 = _872;
    }
    float _890 = _830;
    float _892 = _780;
    float _894 = _782;
    float _896 = _724;
    float _898 = _726;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _902 = _890 + _900;
    float _904 = in.m_63.y;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_820)
    {
        float _908 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[17].y, _804);
        _832 = _908;
    }
    float _910 = _832;
    float _912 = fma(_902, _902, _892);
    float _914 = in.m_63.z;
    if (!_820)
    {
        float _916 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _802);
        _834 = _916;
    }
    float _918 = _834;
    float _920 = _502 * _910;
    float _922 = _912 + _894;
    float _924 = _506 * _910;
    float _926 = _504 * _910;
    float _928 = fma(_648, _918, _920);
    if (!_820)
    {
        float _930 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _806);
        _836 = _930;
    }
    float _932 = _836;
    float _934 = fma(_644, _918, _924);
    float _936 = sqrt(_922);
    float _938 = fma(_640, _918, _926);
    float _940 = _598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _942 = _810 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _944 = fma(_662, _932, _928);
    float _946 = fma(_772, _932, _934);
    float _948 = _940 * _906;
    float _950 = _942 * _816;
    float _952 = _636 + 0.5;
    float _954 = _814 + 0.5;
    float _956 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _958 = fma(_666, _932, _938);
    out.m_67.y = _904;
    out.m_67.z = _914;
    bool _960 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _962 = isnan(_936);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _968 = _964 || _966;
    out.m_73.x = _954;
    out.m_73.y = _952;
    out.m_73.z = _950;
    out.m_73.w = _948;
    out.m_75.w = _956;
    out.m_77.x = _944;
    out.m_77.y = _946;
    out.m_77.z = _958;
    float _970 = _906;
    if (!_968)
    {
        _838 = 1.0;
    }
    float _972 = _838;
    bool _974 = !_968;
    float _976 = _972;
    if (!_974)
    {
        bool _978 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _980 = isnan(_936);
        bool _982 = _978 || _980;
        bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _986 = _982 || _984;
        if (!_986)
        {
            float _988 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _990 = _936 + _988;
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _998 = _996 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1000 = 1.0 / _994;
            float _1002 = _990 * _1000;
            float _1004 = fma(_1002, _998, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _976 = _1004;
            _1006 = true;
        }
        else
        {
            bool _1008 = _936 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1010 = isnan(_936);
            bool _1012 = _1008 || _1010;
            bool _1014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1016 = _1012 || _1014;
            if (!_1016)
            {
                float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1020 = _936 + _1018;
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _1022 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1030 = 1.0 / _1024;
                float _1032 = _1020 * _1030;
                float _1034 = fma(_1032, _1028, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _976 = _1034;
                _1006 = true;
            }
            else
            {
                _976 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1006 = false;
    float _1036 = _976;
    float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1040 = _890 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1044 = _896 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1048 = _898 + _1046;
    float _1050 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1052 = fma(_1044, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1054 = fma(_1048, _1036, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1050 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1052 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = _1058 * _1058;
    float _1070 = fma(_1062, _1062, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = rsqrt(_1072);
    float _1076 = sqrt(_1072);
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = _1062 * _1078;
    float _1082 = _1066 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = _1084 + _1086;
    float _1090 = sqrt(_1088);
    bool _1092 = _1090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1090 + _1094;
    float _1098 = _1066;
    float _1100 = _1096;
    float _1102 = _1058;
    if (_1092)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1104;
    }
    float _1106 = _1098;
    if (_1092)
    {
        float _1108 = rsqrt(_1088);
        _678 = _1108;
    }
    float _1110 = _678;
    float _1112 = _1110;
    if (_1092)
    {
        float _1114 = _1096 * _1106;
        _1100 = _1114;
    }
    float _1116 = _1100;
    if (_1092)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _970 = _1118;
    }
    float _1120 = _970;
    float _1122 = _1074;
    if (_1092)
    {
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1132 = precise::max(0.0, _1130);
    float _1134 = _1070;
    float _1136 = _1132;
    float _1138 = _1130;
    if (_1092)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = -_1078;
    float _1148 = -_1132;
    float _1150 = fma(_1058, _1146, _1148);
    float _1152 = _1150;
    if (!_1092)
    {
        _1136 = _1082;
    }
    float _1154 = _1136;
    float _1156 = _1154;
    if (_1092)
    {
        float _1158 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1138 = _1158;
    }
    float _1160 = _1138;
    float _1162 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1164 = _1128;
    float _1166 = _1160;
    if (_1092)
    {
        float _1168 = fma(_1128, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1102 = _1168;
    }
    float _1170 = _1102;
    float _1172 = _1170;
    if (!_1092)
    {
        _1164 = _1080;
    }
    float _1174 = _1164;
    float _1176 = _1174;
    if (_1092)
    {
        float _1178 = _1144 + (-1.0);
        _1166 = _1178;
    }
    float _1180 = _1166;
    if (_1092)
    {
        float _1182 = _1110 * _1170;
        _840 = _1182;
    }
    float _1184 = _840;
    if (!_1092)
    {
        _1112 = _1084;
    }
    float _1186 = _1112;
    float _1188 = _1186;
    if (_1092)
    {
        float _1190 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _1190;
    }
    float _1192 = _680;
    if (_1092)
    {
        float _1194 = _1080 * _1184;
        _1176 = _1194;
    }
    float _1196 = _1176;
    if (_1092)
    {
        float _1198 = _1082 * _1184;
        _1156 = _1198;
    }
    float _1200 = _1156;
    if (!_1092)
    {
        _1172 = _1086;
    }
    float _1202 = _1172;
    float _1204 = _1202;
    if (_1092)
    {
        float _1206 = fma(_1150, _1144, _1192);
        _1152 = _1206;
    }
    float _1208 = _1152;
    if (_1092)
    {
        float _1210 = _1196 * _1196;
        _1188 = _1210;
    }
    float _1212 = _1188;
    if (_1092)
    {
        float _1214 = _1200 * _1200;
        _1204 = _1214;
    }
    float _1216 = _1204;
    float _1218 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1222 = fma(_1208, _1208, _1212);
    float _1224 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1162);
    float _1226 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = _1222 + _1216;
    float _1230 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1232 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1234 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1220);
    float _1236 = rsqrt(_1228);
    float _1238 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1230);
    float _1240 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1242 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1224);
    float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1246 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1244);
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1238);
    float _1252 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = -_1248;
    float _1258 = _1256 + 1.0;
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1262 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1234);
    float _1264 = fma(_580, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1266 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1252);
    float _1268 = abs(_1258);
    float _1270 = log2(_1268);
    float _1272 = fma(_572, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1274 = _1236 * _1208;
    float _1276 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1266);
    float _1278 = _1236 * _1196;
    float _1280 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1282 = _1236 * _1200;
    float _1284 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1286 = floor(_1272);
    float _1288 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1276);
    float _1290 = -_1284;
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1290);
    float _1294 = -_1282;
    float _1296 = fma(_1294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1292);
    float _1298 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1300 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1302 = fma(_1296, -0.5, 0.5);
    float _1304 = fma(_1296, 0.5, 0.5);
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1308 = floor(_1264);
    float _1310 = -_1286;
    float _1312 = _1272 + _1310;
    float _1314 = -_1298;
    float _1316 = fma(_1314, _1306, 1.0);
    float _1318 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1320 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1322 = exp2(_1300);
    float _1324 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1318);
    float _1326 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1324);
    float _1328 = 1.0 / _1288;
    float _1330 = fma(_1304, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1332 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1326);
    float _1334 = fma(_1304, _1330, -0.212114393711090087890625);
    float _1336 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1320);
    float _1338 = log2(_1316);
    float _1340 = fma(_1304, _1334, 1.570728778839111328125);
    float _1342 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1344 = _1274 + 1.0;
    float _1346 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1348 = -_1274;
    float _1350 = fma(_1322, _1344, _1348);
    float _1352 = sqrt(_1302);
    float _1354 = _1332 * _1328;
    float _1356 = _1346 * _1328;
    float _1358 = fma(_1354, 0.5, 0.5);
    float _1360 = fma(_1356, -0.5, 0.5);
    float _1362 = _1338 * 0.693147182464599609375;
    float _1364 = -_1308;
    float _1366 = _1264 + _1364;
    float _1368 = fma(_1350, 0.5, 0.5);
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _3931 = float2(_1312, _1366);
    float _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3931, float2(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3931, float2(0.0), isnan(_3931)), level(0.0)).x;
    float _1374 = _1352 * 0.636619746685028076171875;
    float _1376 = -_1340;
    float _1378 = fma(_1374, _1376, 1.0);
    float3 _3950 = float3(_1358, _1360, _1370);
    float _1380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).x;
    float3 _3961 = float3(_1358, _1360, _1370);
    float4 _1383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3961, float3(0.0), isnan(_3961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3961, float3(0.0), isnan(_3961)), level(0.0)).xyzw;
    float _1385 = _1383.x;
    float _1387 = _1383.y;
    float _1389 = _1383.z;
    float _1391 = _1383.w;
    float2 _3977 = float2(_1378, _1368);
    float3 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3977, float2(0.0), isnan(_3977)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3977, float2(0.0), isnan(_3977)), level(0.0)).xyz;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1405 = _616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1407 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1409 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1411 = isnan(_1076);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1417 = _1413 || _1415;
    float _1419 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1403);
    float _1421 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1405);
    float _1423 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1407);
    float _1425 = _1332 + _1288;
    float _1427 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1419);
    float _1429 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1421);
    float _1431 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1423);
    float _1433 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1435 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1437 = _1425 * 0.5;
    float _1439 = 1.0 / _1433;
    float _1441 = _1435 + _1433;
    float _1443 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1445 = _1441 * _1439;
    float _1447 = _1445 * 0.5;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1451 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1449);
    float _1453 = 1.0 / _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1457 = _1453 * _1455;
    float _1459 = abs(_1457);
    float _1461 = log2(_1459);
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1465 = exp2(_1463);
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = fma(_1469, -2.0, 3.0);
    float _1473 = _1469 * _1469;
    float _1475 = in.m_79.x;
    float _1477 = _1473 * _1471;
    float _1479 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1481 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1431);
    float _1483 = -_1477;
    float _1485 = _1483 + 1.0;
    float _1487 = _1481 + _1288;
    float _1489 = exp2(_1479);
    float _1491 = fma(_1485, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1477);
    bool _1493 = _1457 <= 8000.0;
    bool _1495 = isnan(_1457);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(8000.0);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = _1288 * 0.5;
    out.gl_Position.x = _1332;
    out.gl_Position.y = _1346;
    out.gl_Position.z = _1481;
    out.gl_Position.w = _1288;
    float _1507 = _1487 * 0.5;
    float _1509 = _1503 * _1491;
    float _1511 = fma(_1346, -0.5, _1505);
    float _1513 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _1437;
    out.m_81.y = _1511;
    out.m_81.z = _1507;
    out.m_81.w = _1288;
    float _1515 = -_1489;
    float _1517 = _1515 + 1.0;
    float _1519 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = -_1519;
    float _1523 = _1521 + 1.0;
    float _1525 = -_1372;
    float _1527 = _1525 + 1.0;
    float _1529 = _1527 * _1513;
    float _1531 = precise::clamp(_1529, 0.0, 1.0);
    float _1533 = -_1531;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1537 = _1519 * _1380;
    float _1539 = _1391 * _1523;
    float _1541 = _1535 * _1475;
    float _1543 = _1391 * _1537;
    float _1545 = _1401 * _1537;
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1549 = fma(_1397, _1543, _1385);
    float _1551 = fma(_1399, _1543, _1387);
    float _1553 = fma(_1391, _1545, _1389);
    float _1555 = _1541;
    float _1557 = _1543;
    float _1559 = _1545;
    if (!_1417)
    {
        _1555 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1561 = _1555;
    out.m_83.x = _1547;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1417)
    {
        _1557 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1567 = _1557;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1417)
    {
        _1559 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1573 = _1559;
    out.m_85.x = _1549;
    out.m_85.y = _1551;
    out.m_85.z = _1553;
    out.m_85.w = _1539;
    bool _1575 = !_1417;
    float _1577 = _1573;
    float _1579 = _1573;
    if (!_1575)
    {
        bool _1581 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1583 = isnan(_1076);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1593 = _1076 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1595;
            float _1599 = 1.0 / _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1609 = _1593 * _1599;
            float _1611 = precise::clamp(_1609, 0.0, 1.0);
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1617 = fma(_1611, _1603, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1619 = fma(_1611, _1615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1621 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1571 = _1617;
            _1565 = _1619;
            _1579 = _1621;
            _1623 = true;
        }
        else
        {
            bool _1625 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1627 = isnan(_1076);
            bool _1629 = _1625 || _1627;
            bool _1631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1633 = _1629 || _1631;
            if (!_1633)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1635 = _1563;
            _1565 = _1635;
            if (!_1633)
            {
                _1569 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1637 = _1569;
            _1571 = _1637;
            if (!_1633)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1639 = _1577;
            bool _1641 = !_1633;
            _1579 = _1639;
            if (!_1641)
            {
                bool _1643 = _1076 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1645 = isnan(_1076);
                bool _1647 = _1643 || _1645;
                bool _1649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1651 = _1647 || _1649;
                if (!_1651)
                {
                    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1655 = _1076 + _1653;
                    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1657;
                    float _1661 = 1.0 / _1659;
                    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1665 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1669 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1671 = _1655 * _1661;
                    float _1673 = precise::clamp(_1671, 0.0, 1.0);
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1677 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1679 = fma(_1673, _1665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1681 = fma(_1673, _1677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1683 = fma(_1673, _1669, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1571 = _1679;
                    _1565 = _1681;
                    _1579 = _1683;
                    _1623 = true;
                }
                else
                {
                    _1571 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1623 = false;
    float _1685 = _1571;
    float _1687 = _1565;
    float _1689 = _1579;
    float _1691 = _1685 * 0.586610972881317138671875;
    bool _1693 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_87.x = 0.0;
    float _1695 = fma(_1687, 0.298911988735198974609375, _1691);
    float _1697 = _1443 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1699 = fma(_1689, 0.114477999508380889892578125, _1695);
    out.m_51.x = _1697;
    float _1701 = -_1699;
    float _1703 = _1701 + _1687;
    float _1705 = -_1699;
    float _1707 = _1705 + _1685;
    float _1709 = -_1699;
    float _1711 = _1709 + _1689;
    float _1713 = fma(_1703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    float _1715 = fma(_1707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    float _1717 = fma(_1711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1699);
    out.m_89.x = _1713;
    out.m_89.y = _1715;
    out.m_89.z = _1717;
    if (!_1693)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1719 = -_1050;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1723 = -_1052;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1727 = -_1054;
    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = sqrt(_1735);
    float _1739 = rsqrt(_1735);
    float _1741 = -_1737;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1745 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = _1725 * _1739;
    float _1751 = _1721 * _1739;
    float _1753 = abs(_1747);
    float _1755 = log2(_1753);
    float _1757 = _1729 * _1739;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1761 = _946 * _1751;
    float _1763 = -_1751;
    float _1765 = -_1759;
    float _1767 = fma(_1763, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1765);
    float _1769 = fma(_944, _1749, _1761);
    float _1771 = -_1757;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1767);
    float _1775 = fma(_958, _1757, _1769);
    float _1777 = precise::clamp(_1775, 0.0, 1.0);
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1781 = _1773 + _1779;
    float _1783 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1785 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1787 = precise::clamp(_1785, 0.0, 1.0);
    float _1789 = exp2(_1783);
    float _1791 = _1789 * _1787;
    float _1793 = _1777 * _1791;
    float _1795 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1797 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1799 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1795;
    out.m_87.y = _1797;
    out.m_87.z = _1799;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

