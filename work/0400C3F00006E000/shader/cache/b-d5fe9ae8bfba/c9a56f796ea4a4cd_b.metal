#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

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

struct _15
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _15* vp_s0 [[id(0)]];
    device _15* vp_s1 [[id(1)]];
    device _15* vp_s2 [[id(2)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

static inline __attribute__((always_inline))
void _38(thread const int& _233, thread const int& _234, thread const int& _235, device _15& vp_s1, device _15& vp_s2)
{
    int _238 = 0 + 2048;
    int _240 = _238 * 8;
    int _242 = _240 + 0;
    float _244 = as_type<float>(vp_s1._m0[_242]);
    int _246 = _240 + 1;
    float _248 = as_type<float>(vp_s1._m0[_246]);
    bool _250 = as_type<uint>(_248) < uint(_234);
    bool _252 = as_type<int>(_248) == _234;
    bool _254 = as_type<uint>(_244) <= uint(_233);
    bool _256 = _252 && _254;
    bool _258 = _250 || _256;
    int _260 = _258 ? _238 : 0;
    int _262 = _260 + 1024;
    int _264 = _262 * 8;
    int _266 = _264 + 0;
    float _268 = as_type<float>(vp_s1._m0[_266]);
    int _270 = _264 + 1;
    float _272 = as_type<float>(vp_s1._m0[_270]);
    bool _274 = as_type<uint>(_272) < uint(_234);
    bool _276 = as_type<int>(_272) == _234;
    bool _278 = as_type<uint>(_268) <= uint(_233);
    bool _280 = _276 && _278;
    bool _282 = _274 || _280;
    int _284 = _282 ? _262 : _260;
    int _286 = _284 + 512;
    int _288 = _286 * 8;
    int _290 = _288 + 0;
    float _292 = as_type<float>(vp_s1._m0[_290]);
    int _294 = _288 + 1;
    float _296 = as_type<float>(vp_s1._m0[_294]);
    bool _298 = as_type<uint>(_296) < uint(_234);
    bool _300 = as_type<int>(_296) == _234;
    bool _302 = as_type<uint>(_292) <= uint(_233);
    bool _304 = _300 && _302;
    bool _306 = _298 || _304;
    int _308 = _306 ? _286 : _284;
    int _310 = _308 + 256;
    int _312 = _310 * 8;
    int _314 = _312 + 0;
    float _316 = as_type<float>(vp_s1._m0[_314]);
    int _318 = _312 + 1;
    float _320 = as_type<float>(vp_s1._m0[_318]);
    bool _322 = as_type<uint>(_320) < uint(_234);
    bool _324 = as_type<int>(_320) == _234;
    bool _326 = as_type<uint>(_316) <= uint(_233);
    bool _328 = _324 && _326;
    bool _330 = _322 || _328;
    int _332 = _330 ? _310 : _308;
    int _334 = _332 + 128;
    int _336 = _334 * 8;
    int _338 = _336 + 0;
    float _340 = as_type<float>(vp_s1._m0[_338]);
    int _342 = _336 + 1;
    float _344 = as_type<float>(vp_s1._m0[_342]);
    bool _346 = as_type<uint>(_344) < uint(_234);
    bool _348 = as_type<int>(_344) == _234;
    bool _350 = as_type<uint>(_340) <= uint(_233);
    bool _352 = _348 && _350;
    bool _354 = _346 || _352;
    int _356 = _354 ? _334 : _332;
    int _358 = _356 + 64;
    int _360 = _358 * 8;
    int _362 = _360 + 0;
    float _364 = as_type<float>(vp_s1._m0[_362]);
    int _366 = _360 + 1;
    float _368 = as_type<float>(vp_s1._m0[_366]);
    bool _370 = as_type<uint>(_368) < uint(_234);
    bool _372 = as_type<int>(_368) == _234;
    bool _374 = as_type<uint>(_364) <= uint(_233);
    bool _376 = _372 && _374;
    bool _378 = _370 || _376;
    int _380 = _378 ? _358 : _356;
    int _382 = _380 + 32;
    int _384 = _382 * 8;
    int _386 = _384 + 0;
    float _388 = as_type<float>(vp_s1._m0[_386]);
    int _390 = _384 + 1;
    float _392 = as_type<float>(vp_s1._m0[_390]);
    bool _394 = as_type<uint>(_392) < uint(_234);
    bool _396 = as_type<int>(_392) == _234;
    bool _398 = as_type<uint>(_388) <= uint(_233);
    bool _400 = _396 && _398;
    bool _402 = _394 || _400;
    int _404 = _402 ? _382 : _380;
    int _406 = _404 + 16;
    int _408 = _406 * 8;
    int _410 = _408 + 0;
    float _412 = as_type<float>(vp_s1._m0[_410]);
    int _414 = _408 + 1;
    float _416 = as_type<float>(vp_s1._m0[_414]);
    bool _418 = as_type<uint>(_416) < uint(_234);
    bool _420 = as_type<int>(_416) == _234;
    bool _422 = as_type<uint>(_412) <= uint(_233);
    bool _424 = _420 && _422;
    bool _426 = _418 || _424;
    int _428 = _426 ? _406 : _404;
    int _430 = _428 + 8;
    int _432 = _430 * 8;
    int _434 = _432 + 0;
    float _436 = as_type<float>(vp_s1._m0[_434]);
    int _438 = _432 + 1;
    float _440 = as_type<float>(vp_s1._m0[_438]);
    bool _442 = as_type<uint>(_440) < uint(_234);
    bool _444 = as_type<int>(_440) == _234;
    bool _446 = as_type<uint>(_436) <= uint(_233);
    bool _448 = _444 && _446;
    bool _450 = _442 || _448;
    int _452 = _450 ? _430 : _428;
    int _454 = _452 + 4;
    int _456 = _454 * 8;
    int _458 = _456 + 0;
    float _460 = as_type<float>(vp_s1._m0[_458]);
    int _462 = _456 + 1;
    float _464 = as_type<float>(vp_s1._m0[_462]);
    bool _466 = as_type<uint>(_464) < uint(_234);
    bool _468 = as_type<int>(_464) == _234;
    bool _470 = as_type<uint>(_460) <= uint(_233);
    bool _472 = _468 && _470;
    bool _474 = _466 || _472;
    int _476 = _474 ? _454 : _452;
    int _478 = _476 + 2;
    int _480 = _478 * 8;
    int _482 = _480 + 0;
    float _484 = as_type<float>(vp_s1._m0[_482]);
    int _486 = _480 + 1;
    float _488 = as_type<float>(vp_s1._m0[_486]);
    bool _490 = as_type<uint>(_488) < uint(_234);
    bool _492 = as_type<int>(_488) == _234;
    bool _494 = as_type<uint>(_484) <= uint(_233);
    bool _496 = _492 && _494;
    bool _498 = _490 || _496;
    int _500 = _498 ? _478 : _476;
    int _502 = _500 + 1;
    int _504 = _502 * 8;
    int _506 = _504 + 0;
    float _508 = as_type<float>(vp_s1._m0[_506]);
    int _510 = _504 + 1;
    float _512 = as_type<float>(vp_s1._m0[_510]);
    bool _514 = as_type<uint>(_512) < uint(_234);
    bool _516 = as_type<int>(_512) == _234;
    bool _518 = as_type<uint>(_508) <= uint(_233);
    bool _520 = _516 && _518;
    bool _522 = _514 || _520;
    int _524 = _522 ? _502 : _500;
    int _526 = _524 * 8;
    int _528 = _526 + 2;
    float _530 = as_type<float>(vp_s1._m0[_528]);
    int _532 = _526 + 3;
    float _534 = as_type<float>(vp_s1._m0[_532]);
    bool _536 = uint(_234) < as_type<uint>(_534);
    bool _538 = _234 == as_type<int>(_534);
    bool _540 = uint(_233) < as_type<uint>(_530);
    bool _542 = _538 && _540;
    bool _544 = _536 || _542;
    if (_544)
    {
        int _546 = _234 << 20;
        uint _548 = uint(int(uint(_233) >> uint(12)));
        int _550 = _546 | int(_548);
        int _552 = _550 * (-1640531535);
        uint _554 = uint(int(uint(_552) >> uint(22)));
        int _556 = int(_554) + 0;
        int _558 = _556 & 1023;
        int _560 = _558 + 1;
        uint _1237;
        do
        {
            _1237 = 0u;
        } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&vp_s2._m0[_560], &_1237, uint(_550), memory_order_relaxed, memory_order_relaxed) && _1237 == 0u);
        uint _562 = _1237;
        bool _564 = int(_562) == 0;
        bool _566 = int(_562) == _550;
        bool _568 = _564 || _566;
        if (!_568)
        {
            int _570 = int(_554) + 1;
            int _572 = _570 & 1023;
            int _574 = _572 + 1;
            uint _1262;
            do
            {
                _1262 = 0u;
            } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&vp_s2._m0[_574], &_1262, uint(_550), memory_order_relaxed, memory_order_relaxed) && _1262 == 0u);
            uint _576 = _1262;
            bool _578 = int(_576) == 0;
            bool _580 = int(_576) == _550;
            bool _582 = _578 || _580;
            if (!_582)
            {
                int _584 = int(_554) + 2;
                int _586 = _584 & 1023;
                int _588 = _586 + 1;
                uint _1287;
                do
                {
                    _1287 = 0u;
                } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&vp_s2._m0[_588], &_1287, uint(_550), memory_order_relaxed, memory_order_relaxed) && _1287 == 0u);
                uint _590 = _1287;
                bool _592 = int(_590) == 0;
                bool _594 = int(_590) == _550;
                bool _596 = _592 || _594;
                if (!_596)
                {
                    int _598 = int(_554) + 3;
                    int _600 = _598 & 1023;
                    int _602 = _600 + 1;
                    uint _1312;
                    do
                    {
                        _1312 = 0u;
                    } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&vp_s2._m0[_602], &_1312, uint(_550), memory_order_relaxed, memory_order_relaxed) && _1312 == 0u);
                    uint _604 = _1312;
                    bool _606 = int(_604) == 0;
                    bool _608 = int(_604) == _550;
                    bool _610 = _606 || _608;
                    if (!_610)
                    {
                        int _612 = int(_554) + 4;
                        int _614 = _612 & 1023;
                        int _616 = _614 + 1;
                        uint _1337;
                        do
                        {
                            _1337 = 0u;
                        } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&vp_s2._m0[_616], &_1337, uint(_550), memory_order_relaxed, memory_order_relaxed) && _1337 == 0u);
                        uint _618 = _1337;
                        bool _620 = int(_618) == 0;
                        bool _622 = int(_618) == _550;
                        bool _624 = _620 || _622;
                        if (!_624)
                        {
                            int _626 = int(_554) + 5;
                            int _628 = _626 & 1023;
                            int _630 = _628 + 1;
                            uint _1363;
                            do
                            {
                                _1363 = 0u;
                            } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&vp_s2._m0[_630], &_1363, uint(_550), memory_order_relaxed, memory_order_relaxed) && _1363 == 0u);
                            uint _632 = _1363;
                            bool _634 = int(_632) == 0;
                            bool _636 = int(_632) == _550;
                            bool _638 = _634 || _636;
                            if (!_638)
                            {
                                int _640 = int(_554) + 6;
                                int _642 = _640 & 1023;
                                int _644 = _642 + 1;
                                uint _1389;
                                do
                                {
                                    _1389 = 0u;
                                } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&vp_s2._m0[_644], &_1389, uint(_550), memory_order_relaxed, memory_order_relaxed) && _1389 == 0u);
                                uint _646 = _1389;
                                bool _648 = int(_646) == 0;
                                bool _650 = int(_646) == _550;
                                bool _652 = _648 || _650;
                                if (!_652)
                                {
                                    int _654 = int(_554) + 7;
                                    int _656 = _654 & 1023;
                                    int _658 = _656 + 1;
                                    uint _1415;
                                    do
                                    {
                                        _1415 = 0u;
                                    } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&vp_s2._m0[_658], &_1415, uint(_550), memory_order_relaxed, memory_order_relaxed) && _1415 == 0u);
                                    uint _660 = _1415;
                                    bool _662 = int(_660) == 0;
                                    bool _664 = int(_660) == _550;
                                    bool _666 = _662 || _664;
                                    if (!_666)
                                    {
                                        vp_s2._m0[0] = 1u;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        int _668 = _526 + 4;
        float _670 = as_type<float>(vp_s1._m0[_668]);
        int _672 = _233 + as_type<int>(_670);
        bool _674 = uint(_672) < uint(_233);
        int _676 = int(_674);
        int _678 = _526 + 5;
        float _680 = as_type<float>(vp_s1._m0[_678]);
        int _682 = _234 + as_type<int>(_680);
        int _684 = _682 + _676;
        *(reinterpret_cast<device uint*>(as_type<ulong>(uint2(uint(_672), uint(_684))))) = uint(_235);
        return;
    }
}

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = as_type<float>(int(gl_VertexIndex));
    int _44 = as_type<int>(_42) << 3;
    uint _47 = uint(int(uint(_44) >> uint(2)));
    float _49 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_47)]);
    int _51 = _44 + 4;
    uint _53 = uint(int(uint(_51) >> uint(2)));
    float _55 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_53)]);
    int _57 = as_type<int>(_49) + 4;
    bool _61 = uint(_57) < as_type<uint>(_49);
    int _63 = int(_61);
    int _65 = as_type<int>(_55) + _63;
    int _67 = _57;
    int _69 = _65;
    int _71 = 1;
    _38(_67, _69, _71, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _73 = as_type<int>(_49);
    int _75 = as_type<int>(_55);
    int _77 = 0;
    _38(_73, _75, _77, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _79 = as_type<int>(_49) + 8;
    bool _81 = uint(_79) < as_type<uint>(_49);
    int _83 = int(_81);
    int _85 = as_type<int>(_55) + _83;
    int _87 = _79;
    int _89 = _85;
    int _91 = 0;
    _38(_87, _89, _91, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _93 = as_type<int>(_49) + 12;
    bool _95 = uint(_93) < as_type<uint>(_49);
    int _97 = int(_95);
    int _99 = as_type<int>(_55) + _97;
    int _101 = _93;
    int _103 = _99;
    int _105 = 0;
    _38(_101, _103, _105, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _107 = as_type<int>(_49) + 16;
    bool _109 = uint(_107) < as_type<uint>(_49);
    int _111 = int(_109);
    int _113 = as_type<int>(_55) + _111;
    int _115 = _107;
    int _117 = _113;
    int _119 = 0;
    _38(_115, _117, _119, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = as_type<float>(int(gl_VertexIndex));
    int _44 = as_type<int>(_42) << 3;
    uint _47 = uint(int(uint(_44) >> uint(2)));
    float _49 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_47)]);
    int _51 = _44 + 4;
    uint _53 = uint(int(uint(_51) >> uint(2)));
    float _55 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_53)]);
    int _57 = as_type<int>(_49) + 4;
    bool _61 = uint(_57) < as_type<uint>(_49);
    int _63 = int(_61);
    int _65 = as_type<int>(_55) + _63;
    int _67 = _57;
    int _69 = _65;
    int _71 = 1;
    _38(_67, _69, _71, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _73 = as_type<int>(_49);
    int _75 = as_type<int>(_55);
    int _77 = 0;
    _38(_73, _75, _77, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _79 = as_type<int>(_49) + 8;
    bool _81 = uint(_79) < as_type<uint>(_49);
    int _83 = int(_81);
    int _85 = as_type<int>(_55) + _83;
    int _87 = _79;
    int _89 = _85;
    int _91 = 0;
    _38(_87, _89, _91, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _93 = as_type<int>(_49) + 12;
    bool _95 = uint(_93) < as_type<uint>(_49);
    int _97 = int(_95);
    int _99 = as_type<int>(_55) + _97;
    int _101 = _93;
    int _103 = _99;
    int _105 = 0;
    _38(_101, _103, _105, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _107 = as_type<int>(_49) + 16;
    bool _109 = uint(_107) < as_type<uint>(_49);
    int _111 = int(_109);
    int _113 = as_type<int>(_55) + _111;
    int _115 = _107;
    int _117 = _113;
    int _119 = 0;
    _38(_115, _117, _119, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = as_type<float>(int(gl_VertexIndex));
    int _44 = as_type<int>(_42) << 3;
    uint _47 = uint(int(uint(_44) >> uint(2)));
    float _49 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_47)]);
    int _51 = _44 + 4;
    uint _53 = uint(int(uint(_51) >> uint(2)));
    float _55 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_53)]);
    int _57 = as_type<int>(_49) + 4;
    bool _61 = uint(_57) < as_type<uint>(_49);
    int _63 = int(_61);
    int _65 = as_type<int>(_55) + _63;
    int _67 = _57;
    int _69 = _65;
    int _71 = 1;
    _38(_67, _69, _71, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _73 = as_type<int>(_49);
    int _75 = as_type<int>(_55);
    int _77 = 0;
    _38(_73, _75, _77, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _79 = as_type<int>(_49) + 8;
    bool _81 = uint(_79) < as_type<uint>(_49);
    int _83 = int(_81);
    int _85 = as_type<int>(_55) + _83;
    int _87 = _79;
    int _89 = _85;
    int _91 = 0;
    _38(_87, _89, _91, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _93 = as_type<int>(_49) + 12;
    bool _95 = uint(_93) < as_type<uint>(_49);
    int _97 = int(_95);
    int _99 = as_type<int>(_55) + _97;
    int _101 = _93;
    int _103 = _99;
    int _105 = 0;
    _38(_101, _103, _105, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _107 = as_type<int>(_49) + 16;
    bool _109 = uint(_107) < as_type<uint>(_49);
    int _111 = int(_109);
    int _113 = as_type<int>(_55) + _111;
    int _115 = _107;
    int _117 = _113;
    int _119 = 0;
    _38(_115, _117, _119, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


vertex void main0_discard(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = as_type<float>(int(gl_VertexIndex));
    int _44 = as_type<int>(_42) << 3;
    uint _47 = uint(int(uint(_44) >> uint(2)));
    float _49 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_47)]);
    int _51 = _44 + 4;
    uint _53 = uint(int(uint(_51) >> uint(2)));
    float _55 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_53)]);
    int _57 = as_type<int>(_49) + 4;
    bool _61 = uint(_57) < as_type<uint>(_49);
    int _63 = int(_61);
    int _65 = as_type<int>(_55) + _63;
    int _67 = _57;
    int _69 = _65;
    int _71 = 1;
    _38(_67, _69, _71, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _73 = as_type<int>(_49);
    int _75 = as_type<int>(_55);
    int _77 = 0;
    _38(_73, _75, _77, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _79 = as_type<int>(_49) + 8;
    bool _81 = uint(_79) < as_type<uint>(_49);
    int _83 = int(_81);
    int _85 = as_type<int>(_55) + _83;
    int _87 = _79;
    int _89 = _85;
    int _91 = 0;
    _38(_87, _89, _91, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _93 = as_type<int>(_49) + 12;
    bool _95 = uint(_93) < as_type<uint>(_49);
    int _97 = int(_95);
    int _99 = as_type<int>(_55) + _97;
    int _101 = _93;
    int _103 = _99;
    int _105 = 0;
    _38(_101, _103, _105, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    int _107 = as_type<int>(_49) + 16;
    bool _109 = uint(_107) < as_type<uint>(_49);
    int _111 = int(_109);
    int _113 = as_type<int>(_55) + _111;
    int _115 = _107;
    int _117 = _113;
    int _119 = 0;
    _38(_115, _117, _119, (*spvDescriptorSet0.vp_s1), (*spvDescriptorSet0.vp_s2));
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return;
}

