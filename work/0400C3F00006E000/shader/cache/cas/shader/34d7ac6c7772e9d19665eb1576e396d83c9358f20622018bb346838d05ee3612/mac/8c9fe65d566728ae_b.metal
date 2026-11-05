#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_56 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(1)]];
    float4 m_43 [[attribute(2)]];
    float4 m_45 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
    float4 m_47 [[attribute(8)]];
    float4 m_49 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = as_type<float>(in.m_36.x);
    float _74 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _76 = in.m_39.x;
    float _78 = in.m_39.y;
    float _80 = in.m_39.z;
    float _82 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _84 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _82;
    float _86 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _88 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _86;
    float _90 = in.m_41.x;
    float _92 = in.m_41.y;
    float _94 = in.m_41.z;
    float _96 = _84 * _84;
    float _98 = in.m_43.x;
    float _100 = in.m_43.y;
    float _102 = in.m_43.z;
    float _104 = in.m_45.x;
    int _107 = as_type<int>(_74) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _109 = _107 + as_type<int>(_72);
    int _111 = _109 * 48;
    int _113 = _111 + 16;
    int _115 = _111 + 32;
    int _117 = _111 + 48;
    uint _120 = uint(int(uint(_113) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw0.x);
    int _124 = _113 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.y);
    int _130 = _113 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.z);
    int _136 = _113 + 12;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.w);
    uint _142 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw1.x);
    int _146 = _115 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw1.y);
    int _152 = _115 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.z);
    int _158 = _115 + 12;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw1.w);
    uint _164 = uint(int(uint(_117) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_164)];
    float _166 = as_type<float>(_dmw2.x);
    int _168 = _117 + 4;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw2.y);
    int _174 = _117 + 8;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    float _178 = as_type<float>(_dmw2.z);
    int _180 = _117 + 12;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>(_dmw2.w);
    float _186 = fma(_88, _88, _96);
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _190 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _188;
    float _192 = fma(_190, _190, _186);
    float _194 = sqrt(_192);
    bool _198 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _200 = isnan(_194);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _206 = _202 || _204;
    float _208 = _128 * _78;
    float _210 = _128 * _92;
    float _212 = _128 * _100;
    float _214 = _150 * _78;
    float _216 = _150 * _92;
    float _218 = _150 * _100;
    float _220 = fma(_122, _76, _208);
    float _222 = _172 * _78;
    float _224 = _172 * _92;
    float _226 = _172 * _100;
    float _228 = fma(_144, _76, _214);
    float _230 = fma(_166, _76, _222);
    float _232 = fma(_144, _90, _216);
    float _234 = fma(_166, _90, _224);
    float _236 = fma(_144, _98, _218);
    float _238 = fma(_166, _98, _226);
    float _240 = fma(_134, _80, _220);
    float _242 = fma(_156, _80, _228);
    float _244 = fma(_122, _90, _210);
    float _246 = fma(_122, _98, _212);
    float _248 = fma(_178, _80, _230);
    float _250 = fma(_178, _94, _234);
    float _252 = fma(_156, _102, _236);
    float _254 = fma(_178, _102, _238);
    float _256 = _140 + _240;
    float _258 = fma(_134, _94, _244);
    float _260 = fma(_134, _102, _246);
    float _262 = fma(_156, _94, _232);
    float _264 = _162 + _242;
    float _266 = _184 + _248;
    float _268 = _252 * _104;
    float _270 = _256 * _104;
    float _272 = _258 * _104;
    float _274 = _262 * _104;
    float _276 = _250 * _104;
    float _278 = _260 * _104;
    float _280 = _254 * _104;
    float _282 = _264 * _104;
    float _284 = _266 * _104;
    float _286 = _256;
    if (!_206)
    {
        _286 = 1.0;
    }
    float _288 = _286;
    bool _290 = !_206;
    float _292 = _288;
    if (!_290)
    {
        bool _294 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _296 = isnan(_194);
        bool _298 = _294 || _296;
        bool _300 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _302 = _298 || _300;
        if (!_302)
        {
            float _304 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _306 = _194 + _304;
            float _308 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _310 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _308;
            float _312 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _314 = _312 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _316 = 1.0 / _310;
            float _318 = _306 * _316;
            float _320 = fma(_318, _314, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _292 = _320;
            _322 = true;
        }
        else
        {
            bool _324 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _326 = isnan(_194);
            bool _328 = _324 || _326;
            bool _330 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _332 = _328 || _330;
            if (!_332)
            {
                float _334 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _336 = _194 + _334;
                float _338 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _340 = _338 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _342 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _344 = _342 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _346 = 1.0 / _340;
                float _348 = _336 * _346;
                float _350 = fma(_348, _344, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _292 = _350;
                _322 = true;
            }
            else
            {
                _292 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _322 = false;
    float _352 = _292;
    float _354 = _352 + (-1.0);
    float _356 = in.m_47.y;
    float _358 = _274 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _360 = _268 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _362 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _364 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _366 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _368 = in.m_47.x;
    float _370 = fma(_282, _352, _362);
    float _372 = fma(_270, _352, _364);
    float _374 = fma(_284, _352, _366);
    float _376 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[2].x, _358);
    float _378 = _370 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _380 = _370 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _382 = _268 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _384 = _268 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[2].x, _378);
    float _388 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[0].x, _380);
    float _390 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[0].x, _382);
    float _392 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[1].x, _360);
    float _394 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[2].z, _386);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[0].z, _388);
    float _398 = _370 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _400 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[2].x, _384);
    float _402 = _394 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _404 = _396 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _406 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[1].x, _398);
    float _408 = _274 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _412 = _402 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _416 = _404 + _414;
    float _418 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[0].x, _408);
    float _420 = _412 * _412;
    float _422 = in.m_43.w;
    float _424 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[0].z, _418);
    float _426 = fma(_416, _416, _420);
    float _428 = _274 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _430 = sqrt(_426);
    float _432 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[1].x, _428);
    float _434 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[1].z, _406);
    float _436 = in.m_49.y;
    float _438 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[1].z, _432);
    float _440 = _434 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _442 = in.m_49.x;
    float _444 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[2].z, _376);
    float _446 = _440 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_52.y = _356;
    float _448 = fma(_404, (*spvDescriptorSet0.vp_c4)._m0[2].x, _446);
    out.m_52.x = _368;
    bool _450 = _430 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _452 = fma(_402, (*spvDescriptorSet0.vp_c4)._m0[2].z, _448);
    float _454 = _452 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _456 = _438 * _438;
    float _458 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[0].z, _390);
    float _460 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[1].z, _392);
    float _462 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[2].z, _400);
    float _464 = fma(_424, _424, _456);
    float _466 = _400;
    float _468 = _418;
    float _470 = _392;
    float _472 = _454;
    if (!_450)
    {
        _466 = _404;
    }
    float _474 = _466;
    float _476 = _474;
    if (!_450)
    {
        _468 = _440;
    }
    float _478 = _468;
    float _480 = _478;
    if (!_450)
    {
        _470 = _402;
    }
    float _482 = _470;
    bool _484 = !_450;
    float _486 = _482;
    if (!_484)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _490 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _492 = _430 + _490;
        float _494 = _440 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _496 = rsqrt(_426);
        float _498 = _492 * _488;
        float _500 = _498 * 0.15915493667125701904296875;
        float _502 = _500 * 6.283185482025146484375;
        float _504 = cos(_502);
        float _506 = _500 * 6.283185482025146484375;
        float _508 = sin(_506);
        float _510 = _504 + (-1.0);
        float _512 = fma(_508, _494, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _516 = _496 * _512;
        float _518 = fma(_440, _504, _514);
        float _520 = fma(_416, _516, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _522 = _518 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _524 = fma(_412, _516, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _526 = fma(_520, (*spvDescriptorSet0.vp_c4)._m0[2].x, _522);
        float _528 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[2].z, _526);
        float _530 = _528 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _480 = _518;
        _476 = _520;
        _486 = _524;
        _472 = _530;
    }
    float _532 = _480;
    float _534 = _476;
    float _536 = _486;
    float _538 = _472;
    float _540 = _460 * _460;
    float _542 = _532 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _544 = _532 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _546 = fma(_444, _444, _464);
    float _548 = fma(_458, _458, _540);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[1].x, _542);
    float _552 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[0].x, _544);
    float _554 = rsqrt(_546);
    float _556 = fma(_462, _462, _548);
    float _558 = fma(_536, (*spvDescriptorSet0.vp_c4)._m0[1].z, _550);
    float _560 = fma(_536, (*spvDescriptorSet0.vp_c4)._m0[0].z, _552);
    out.m_52.z = _442;
    float _562 = _558 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _564 = _560 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _566 = rsqrt(_556);
    out.m_52.w = _436;
    float _568 = _562 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _570 = _562 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _572 = _562 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _574 = _562 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _576 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[7].x, _568);
    float _578 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[8].x, _570);
    float _580 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[9].x, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[10].x, _574);
    float _584 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[7].z, _576);
    float _586 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[8].z, _578);
    float _588 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[9].z, _580);
    float _590 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[10].z, _582);
    float _592 = _424 * _554;
    float _594 = _438 * _554;
    float _596 = _460 * _566;
    float _598 = _444 * _554;
    float _600 = _584 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _602 = _458 * _566;
    float _604 = _462 * _566;
    float _606 = _586 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _608 = _588 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _610 = _590 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_54.w = _422;
    out.m_56.x = _404;
    out.m_56.y = _440;
    out.m_56.z = _402;
    out.m_58.x = _592;
    out.m_58.y = _594;
    out.m_58.z = _598;
    out.m_54.x = _602;
    out.m_54.y = _596;
    out.m_54.z = _604;
    out.gl_Position.x = _600;
    out.gl_Position.y = _606;
    out.gl_Position.z = _608;
    out.gl_Position.w = _610;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = as_type<float>(in.m_36.x);
    float _74 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _76 = in.m_39.x;
    float _78 = in.m_39.y;
    float _80 = in.m_39.z;
    float _82 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _84 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _82;
    float _86 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _88 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _86;
    float _90 = in.m_41.x;
    float _92 = in.m_41.y;
    float _94 = in.m_41.z;
    float _96 = _84 * _84;
    float _98 = in.m_43.x;
    float _100 = in.m_43.y;
    float _102 = in.m_43.z;
    float _104 = in.m_45.x;
    int _107 = as_type<int>(_74) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _109 = _107 + as_type<int>(_72);
    int _111 = _109 * 48;
    int _113 = _111 + 16;
    int _115 = _111 + 32;
    int _117 = _111 + 48;
    uint _120 = uint(int(uint(_113) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw0.x);
    int _124 = _113 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.y);
    int _130 = _113 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.z);
    int _136 = _113 + 12;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.w);
    uint _142 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw1.x);
    int _146 = _115 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw1.y);
    int _152 = _115 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.z);
    int _158 = _115 + 12;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw1.w);
    uint _164 = uint(int(uint(_117) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_164)];
    float _166 = as_type<float>(_dmw2.x);
    int _168 = _117 + 4;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw2.y);
    int _174 = _117 + 8;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    float _178 = as_type<float>(_dmw2.z);
    int _180 = _117 + 12;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>(_dmw2.w);
    float _186 = fma(_88, _88, _96);
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _190 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _188;
    float _192 = fma(_190, _190, _186);
    float _194 = sqrt(_192);
    bool _198 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _200 = isnan(_194);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _206 = _202 || _204;
    float _208 = _128 * _78;
    float _210 = _128 * _92;
    float _212 = _128 * _100;
    float _214 = _150 * _78;
    float _216 = _150 * _92;
    float _218 = _150 * _100;
    float _220 = fma(_122, _76, _208);
    float _222 = _172 * _78;
    float _224 = _172 * _92;
    float _226 = _172 * _100;
    float _228 = fma(_144, _76, _214);
    float _230 = fma(_166, _76, _222);
    float _232 = fma(_144, _90, _216);
    float _234 = fma(_166, _90, _224);
    float _236 = fma(_144, _98, _218);
    float _238 = fma(_166, _98, _226);
    float _240 = fma(_134, _80, _220);
    float _242 = fma(_156, _80, _228);
    float _244 = fma(_122, _90, _210);
    float _246 = fma(_122, _98, _212);
    float _248 = fma(_178, _80, _230);
    float _250 = fma(_178, _94, _234);
    float _252 = fma(_156, _102, _236);
    float _254 = fma(_178, _102, _238);
    float _256 = _140 + _240;
    float _258 = fma(_134, _94, _244);
    float _260 = fma(_134, _102, _246);
    float _262 = fma(_156, _94, _232);
    float _264 = _162 + _242;
    float _266 = _184 + _248;
    float _268 = _252 * _104;
    float _270 = _256 * _104;
    float _272 = _258 * _104;
    float _274 = _262 * _104;
    float _276 = _250 * _104;
    float _278 = _260 * _104;
    float _280 = _254 * _104;
    float _282 = _264 * _104;
    float _284 = _266 * _104;
    float _286 = _256;
    if (!_206)
    {
        _286 = 1.0;
    }
    float _288 = _286;
    bool _290 = !_206;
    float _292 = _288;
    if (!_290)
    {
        bool _294 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _296 = isnan(_194);
        bool _298 = _294 || _296;
        bool _300 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _302 = _298 || _300;
        if (!_302)
        {
            float _304 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _306 = _194 + _304;
            float _308 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _310 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _308;
            float _312 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _314 = _312 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _316 = 1.0 / _310;
            float _318 = _306 * _316;
            float _320 = fma(_318, _314, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _292 = _320;
            _322 = true;
        }
        else
        {
            bool _324 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _326 = isnan(_194);
            bool _328 = _324 || _326;
            bool _330 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _332 = _328 || _330;
            if (!_332)
            {
                float _334 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _336 = _194 + _334;
                float _338 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _340 = _338 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _342 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _344 = _342 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _346 = 1.0 / _340;
                float _348 = _336 * _346;
                float _350 = fma(_348, _344, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _292 = _350;
                _322 = true;
            }
            else
            {
                _292 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _322 = false;
    float _352 = _292;
    float _354 = _352 + (-1.0);
    float _356 = in.m_47.y;
    float _358 = _274 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _360 = _268 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _362 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _364 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _366 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _368 = in.m_47.x;
    float _370 = fma(_282, _352, _362);
    float _372 = fma(_270, _352, _364);
    float _374 = fma(_284, _352, _366);
    float _376 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[2].x, _358);
    float _378 = _370 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _380 = _370 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _382 = _268 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _384 = _268 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[2].x, _378);
    float _388 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[0].x, _380);
    float _390 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[0].x, _382);
    float _392 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[1].x, _360);
    float _394 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[2].z, _386);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[0].z, _388);
    float _398 = _370 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _400 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[2].x, _384);
    float _402 = _394 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _404 = _396 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _406 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[1].x, _398);
    float _408 = _274 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _412 = _402 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _416 = _404 + _414;
    float _418 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[0].x, _408);
    float _420 = _412 * _412;
    float _422 = in.m_43.w;
    float _424 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[0].z, _418);
    float _426 = fma(_416, _416, _420);
    float _428 = _274 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _430 = sqrt(_426);
    float _432 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[1].x, _428);
    float _434 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[1].z, _406);
    float _436 = in.m_49.y;
    float _438 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[1].z, _432);
    float _440 = _434 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _442 = in.m_49.x;
    float _444 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[2].z, _376);
    float _446 = _440 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_52.y = _356;
    float _448 = fma(_404, (*spvDescriptorSet0.vp_c4)._m0[2].x, _446);
    out.m_52.x = _368;
    bool _450 = _430 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _452 = fma(_402, (*spvDescriptorSet0.vp_c4)._m0[2].z, _448);
    float _454 = _452 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _456 = _438 * _438;
    float _458 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[0].z, _390);
    float _460 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[1].z, _392);
    float _462 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[2].z, _400);
    float _464 = fma(_424, _424, _456);
    float _466 = _400;
    float _468 = _418;
    float _470 = _392;
    float _472 = _454;
    if (!_450)
    {
        _466 = _404;
    }
    float _474 = _466;
    float _476 = _474;
    if (!_450)
    {
        _468 = _440;
    }
    float _478 = _468;
    float _480 = _478;
    if (!_450)
    {
        _470 = _402;
    }
    float _482 = _470;
    bool _484 = !_450;
    float _486 = _482;
    if (!_484)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _490 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _492 = _430 + _490;
        float _494 = _440 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _496 = rsqrt(_426);
        float _498 = _492 * _488;
        float _500 = _498 * 0.15915493667125701904296875;
        float _502 = _500 * 6.283185482025146484375;
        float _504 = cos(_502);
        float _506 = _500 * 6.283185482025146484375;
        float _508 = sin(_506);
        float _510 = _504 + (-1.0);
        float _512 = fma(_508, _494, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _516 = _496 * _512;
        float _518 = fma(_440, _504, _514);
        float _520 = fma(_416, _516, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _522 = _518 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _524 = fma(_412, _516, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _526 = fma(_520, (*spvDescriptorSet0.vp_c4)._m0[2].x, _522);
        float _528 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[2].z, _526);
        float _530 = _528 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _480 = _518;
        _476 = _520;
        _486 = _524;
        _472 = _530;
    }
    float _532 = _480;
    float _534 = _476;
    float _536 = _486;
    float _538 = _472;
    float _540 = _460 * _460;
    float _542 = _532 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _544 = _532 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _546 = fma(_444, _444, _464);
    float _548 = fma(_458, _458, _540);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[1].x, _542);
    float _552 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[0].x, _544);
    float _554 = rsqrt(_546);
    float _556 = fma(_462, _462, _548);
    float _558 = fma(_536, (*spvDescriptorSet0.vp_c4)._m0[1].z, _550);
    float _560 = fma(_536, (*spvDescriptorSet0.vp_c4)._m0[0].z, _552);
    out.m_52.z = _442;
    float _562 = _558 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _564 = _560 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _566 = rsqrt(_556);
    out.m_52.w = _436;
    float _568 = _562 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _570 = _562 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _572 = _562 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _574 = _562 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _576 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[7].x, _568);
    float _578 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[8].x, _570);
    float _580 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[9].x, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[10].x, _574);
    float _584 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[7].z, _576);
    float _586 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[8].z, _578);
    float _588 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[9].z, _580);
    float _590 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[10].z, _582);
    float _592 = _424 * _554;
    float _594 = _438 * _554;
    float _596 = _460 * _566;
    float _598 = _444 * _554;
    float _600 = _584 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _602 = _458 * _566;
    float _604 = _462 * _566;
    float _606 = _586 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _608 = _588 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _610 = _590 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_54.w = _422;
    out.m_56.x = _404;
    out.m_56.y = _440;
    out.m_56.z = _402;
    out.m_58.x = _592;
    out.m_58.y = _594;
    out.m_58.z = _598;
    out.m_54.x = _602;
    out.m_54.y = _596;
    out.m_54.z = _604;
    out.gl_Position.x = _600;
    out.gl_Position.y = _606;
    out.gl_Position.z = _608;
    out.gl_Position.w = _610;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = as_type<float>(in.m_36.x);
    float _74 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _76 = in.m_39.x;
    float _78 = in.m_39.y;
    float _80 = in.m_39.z;
    float _82 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _84 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _82;
    float _86 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _88 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _86;
    float _90 = in.m_41.x;
    float _92 = in.m_41.y;
    float _94 = in.m_41.z;
    float _96 = _84 * _84;
    float _98 = in.m_43.x;
    float _100 = in.m_43.y;
    float _102 = in.m_43.z;
    float _104 = in.m_45.x;
    int _107 = as_type<int>(_74) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _109 = _107 + as_type<int>(_72);
    int _111 = _109 * 48;
    int _113 = _111 + 16;
    int _115 = _111 + 32;
    int _117 = _111 + 48;
    uint _120 = uint(int(uint(_113) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw0.x);
    int _124 = _113 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.y);
    int _130 = _113 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw0.z);
    int _136 = _113 + 12;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.w);
    uint _142 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_142)];
    float _144 = as_type<float>(_dmw1.x);
    int _146 = _115 + 4;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw1.y);
    int _152 = _115 + 8;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw1.z);
    int _158 = _115 + 12;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_dmw1.w);
    uint _164 = uint(int(uint(_117) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_164)];
    float _166 = as_type<float>(_dmw2.x);
    int _168 = _117 + 4;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw2.y);
    int _174 = _117 + 8;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    float _178 = as_type<float>(_dmw2.z);
    int _180 = _117 + 12;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>(_dmw2.w);
    float _186 = fma(_88, _88, _96);
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _190 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _188;
    float _192 = fma(_190, _190, _186);
    float _194 = sqrt(_192);
    bool _198 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _200 = isnan(_194);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _206 = _202 || _204;
    float _208 = _128 * _78;
    float _210 = _128 * _92;
    float _212 = _128 * _100;
    float _214 = _150 * _78;
    float _216 = _150 * _92;
    float _218 = _150 * _100;
    float _220 = fma(_122, _76, _208);
    float _222 = _172 * _78;
    float _224 = _172 * _92;
    float _226 = _172 * _100;
    float _228 = fma(_144, _76, _214);
    float _230 = fma(_166, _76, _222);
    float _232 = fma(_144, _90, _216);
    float _234 = fma(_166, _90, _224);
    float _236 = fma(_144, _98, _218);
    float _238 = fma(_166, _98, _226);
    float _240 = fma(_134, _80, _220);
    float _242 = fma(_156, _80, _228);
    float _244 = fma(_122, _90, _210);
    float _246 = fma(_122, _98, _212);
    float _248 = fma(_178, _80, _230);
    float _250 = fma(_178, _94, _234);
    float _252 = fma(_156, _102, _236);
    float _254 = fma(_178, _102, _238);
    float _256 = _140 + _240;
    float _258 = fma(_134, _94, _244);
    float _260 = fma(_134, _102, _246);
    float _262 = fma(_156, _94, _232);
    float _264 = _162 + _242;
    float _266 = _184 + _248;
    float _268 = _252 * _104;
    float _270 = _256 * _104;
    float _272 = _258 * _104;
    float _274 = _262 * _104;
    float _276 = _250 * _104;
    float _278 = _260 * _104;
    float _280 = _254 * _104;
    float _282 = _264 * _104;
    float _284 = _266 * _104;
    float _286 = _256;
    if (!_206)
    {
        _286 = 1.0;
    }
    float _288 = _286;
    bool _290 = !_206;
    float _292 = _288;
    if (!_290)
    {
        bool _294 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _296 = isnan(_194);
        bool _298 = _294 || _296;
        bool _300 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _302 = _298 || _300;
        if (!_302)
        {
            float _304 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _306 = _194 + _304;
            float _308 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _310 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _308;
            float _312 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _314 = _312 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _316 = 1.0 / _310;
            float _318 = _306 * _316;
            float _320 = fma(_318, _314, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _292 = _320;
            _322 = true;
        }
        else
        {
            bool _324 = _194 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _326 = isnan(_194);
            bool _328 = _324 || _326;
            bool _330 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _332 = _328 || _330;
            if (!_332)
            {
                float _334 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _336 = _194 + _334;
                float _338 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _340 = _338 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _342 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _344 = _342 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _346 = 1.0 / _340;
                float _348 = _336 * _346;
                float _350 = fma(_348, _344, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _292 = _350;
                _322 = true;
            }
            else
            {
                _292 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _322 = false;
    float _352 = _292;
    float _354 = _352 + (-1.0);
    float _356 = in.m_47.y;
    float _358 = _274 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _360 = _268 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _362 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _364 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _366 = _354 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _368 = in.m_47.x;
    float _370 = fma(_282, _352, _362);
    float _372 = fma(_270, _352, _364);
    float _374 = fma(_284, _352, _366);
    float _376 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[2].x, _358);
    float _378 = _370 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _380 = _370 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _382 = _268 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _384 = _268 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[2].x, _378);
    float _388 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[0].x, _380);
    float _390 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[0].x, _382);
    float _392 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[1].x, _360);
    float _394 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[2].z, _386);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[0].z, _388);
    float _398 = _370 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _400 = fma(_278, (*spvDescriptorSet0.vp_c7)._m0[2].x, _384);
    float _402 = _394 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _404 = _396 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _406 = fma(_372, (*spvDescriptorSet0.vp_c7)._m0[1].x, _398);
    float _408 = _274 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _412 = _402 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _416 = _404 + _414;
    float _418 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[0].x, _408);
    float _420 = _412 * _412;
    float _422 = in.m_43.w;
    float _424 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[0].z, _418);
    float _426 = fma(_416, _416, _420);
    float _428 = _274 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _430 = sqrt(_426);
    float _432 = fma(_272, (*spvDescriptorSet0.vp_c7)._m0[1].x, _428);
    float _434 = fma(_374, (*spvDescriptorSet0.vp_c7)._m0[1].z, _406);
    float _436 = in.m_49.y;
    float _438 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[1].z, _432);
    float _440 = _434 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _442 = in.m_49.x;
    float _444 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[2].z, _376);
    float _446 = _440 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_52.y = _356;
    float _448 = fma(_404, (*spvDescriptorSet0.vp_c4)._m0[2].x, _446);
    out.m_52.x = _368;
    bool _450 = _430 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _452 = fma(_402, (*spvDescriptorSet0.vp_c4)._m0[2].z, _448);
    float _454 = _452 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _456 = _438 * _438;
    float _458 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[0].z, _390);
    float _460 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[1].z, _392);
    float _462 = fma(_280, (*spvDescriptorSet0.vp_c7)._m0[2].z, _400);
    float _464 = fma(_424, _424, _456);
    float _466 = _400;
    float _468 = _418;
    float _470 = _392;
    float _472 = _454;
    if (!_450)
    {
        _466 = _404;
    }
    float _474 = _466;
    float _476 = _474;
    if (!_450)
    {
        _468 = _440;
    }
    float _478 = _468;
    float _480 = _478;
    if (!_450)
    {
        _470 = _402;
    }
    float _482 = _470;
    bool _484 = !_450;
    float _486 = _482;
    if (!_484)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _490 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _492 = _430 + _490;
        float _494 = _440 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _496 = rsqrt(_426);
        float _498 = _492 * _488;
        float _500 = _498 * 0.15915493667125701904296875;
        float _502 = _500 * 6.283185482025146484375;
        float _504 = cos(_502);
        float _506 = _500 * 6.283185482025146484375;
        float _508 = sin(_506);
        float _510 = _504 + (-1.0);
        float _512 = fma(_508, _494, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _516 = _496 * _512;
        float _518 = fma(_440, _504, _514);
        float _520 = fma(_416, _516, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _522 = _518 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _524 = fma(_412, _516, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _526 = fma(_520, (*spvDescriptorSet0.vp_c4)._m0[2].x, _522);
        float _528 = fma(_524, (*spvDescriptorSet0.vp_c4)._m0[2].z, _526);
        float _530 = _528 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _480 = _518;
        _476 = _520;
        _486 = _524;
        _472 = _530;
    }
    float _532 = _480;
    float _534 = _476;
    float _536 = _486;
    float _538 = _472;
    float _540 = _460 * _460;
    float _542 = _532 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _544 = _532 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _546 = fma(_444, _444, _464);
    float _548 = fma(_458, _458, _540);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[1].x, _542);
    float _552 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[0].x, _544);
    float _554 = rsqrt(_546);
    float _556 = fma(_462, _462, _548);
    float _558 = fma(_536, (*spvDescriptorSet0.vp_c4)._m0[1].z, _550);
    float _560 = fma(_536, (*spvDescriptorSet0.vp_c4)._m0[0].z, _552);
    out.m_52.z = _442;
    float _562 = _558 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _564 = _560 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _566 = rsqrt(_556);
    out.m_52.w = _436;
    float _568 = _562 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _570 = _562 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _572 = _562 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _574 = _562 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _576 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[7].x, _568);
    float _578 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[8].x, _570);
    float _580 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[9].x, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c4)._m0[10].x, _574);
    float _584 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[7].z, _576);
    float _586 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[8].z, _578);
    float _588 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[9].z, _580);
    float _590 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[10].z, _582);
    float _592 = _424 * _554;
    float _594 = _438 * _554;
    float _596 = _460 * _566;
    float _598 = _444 * _554;
    float _600 = _584 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _602 = _458 * _566;
    float _604 = _462 * _566;
    float _606 = _586 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _608 = _588 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _610 = _590 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_54.w = _422;
    out.m_56.x = _404;
    out.m_56.y = _440;
    out.m_56.z = _402;
    out.m_58.x = _592;
    out.m_58.y = _594;
    out.m_58.z = _598;
    out.m_54.x = _602;
    out.m_54.y = _596;
    out.m_54.z = _604;
    out.gl_Position.x = _600;
    out.gl_Position.y = _606;
    out.gl_Position.z = _608;
    out.gl_Position.w = _610;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

