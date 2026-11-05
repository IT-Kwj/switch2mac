#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
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
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3104, thread const int& _3105, constant _10& support_buffer)
{
    int _3108 = 1 + _3105;
    float _3110 = support_buffer._m5[_3108].x;
    bool _3112 = _3110 == 1.0;
    if (_3112)
    {
        return _3104;
    }
    float _3114 = float(_3104);
    float _3116 = _3114 * _3110;
    int _3118 = int(_3116);
    return _3118;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _679 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = int(_75) + 1;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    int _87 = _83 & 3;
    float _89 = (*spvDescriptorSet0.cp_c5)._m0[int(_85)][_87];
    int _91 = _66;
    int _93 = 0;
    int _95 = _56(_91, _93, (*spvDescriptorSet0.support_buffer));
    int _97 = as_type<int>(_81);
    int _99 = 0;
    int _101 = _56(_97, _99, (*spvDescriptorSet0.support_buffer));
    int3 _1246 = int3(_95, _101, 1);
    float3 _105 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1246.xy), uint(_1246.z), 0).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    int _113 = _66;
    int _115 = 0;
    int _117 = _56(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_89);
    int _121 = 0;
    int _123 = _56(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1264 = int3(_117, _123, 1);
    float3 _125 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1264.xy), uint(_1264.z), 0).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    int _133 = _66;
    int _135 = 0;
    int _137 = _56(_133, _135, (*spvDescriptorSet0.support_buffer));
    int _139 = as_type<int>(_81);
    int _141 = 0;
    int _143 = _56(_139, _141, (*spvDescriptorSet0.support_buffer));
    int3 _1282 = int3(_137, _143, 0);
    float3 _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1282.xy), uint(_1282.z), 0).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    int _153 = _66;
    int _155 = 0;
    int _157 = _56(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = as_type<int>(_89);
    int _161 = 0;
    int _163 = _56(_159, _161, (*spvDescriptorSet0.support_buffer));
    int3 _1300 = int3(_157, _163, 0);
    float3 _165 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1300.xy), uint(_1300.z), 0).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    int _173 = _66;
    int _175 = 0;
    int _177 = _56(_173, _175, (*spvDescriptorSet0.support_buffer));
    int _179 = as_type<int>(_81);
    int _181 = 0;
    int _183 = _56(_179, _181, (*spvDescriptorSet0.support_buffer));
    int3 _1318 = int3(_177, _183, 2);
    float3 _185 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1318.xy), uint(_1318.z), 0).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    int _193 = _66;
    int _195 = 0;
    int _197 = _56(_193, _195, (*spvDescriptorSet0.support_buffer));
    int _199 = as_type<int>(_89);
    int _201 = 0;
    int _203 = _56(_199, _201, (*spvDescriptorSet0.support_buffer));
    int3 _1336 = int3(_197, _203, 2);
    float3 _205 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1336.xy), uint(_1336.z), 0).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    int _213 = _72 + 16;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    uint _217 = uint(int(uint(int(_215)) >> uint(2)));
    int _219 = int(_215) & 3;
    float _221 = (*spvDescriptorSet0.cp_c5)._m0[int(_217)][_219];
    bool _223 = _66 != 0;
    float _225 = -_107;
    float _227 = _225 + _127;
    float _229 = -_111;
    float _231 = _229 + _131;
    float _233 = fma(_227, _221, _107);
    float _235 = -_109;
    float _237 = _235 + _129;
    float _239 = fma(_231, _221, _111);
    float _241 = _233 * 0.15915493667125701904296875;
    float _243 = fma(_237, _221, _109);
    float _245 = _239 * 0.15915493667125701904296875;
    float _247 = _241 * 6.283185482025146484375;
    float _249 = sin(_247);
    float _251 = _243 * 0.15915493667125701904296875;
    float _253 = -_147;
    float _255 = _253 + _167;
    float _257 = -_151;
    float _259 = _257 + _171;
    float _261 = fma(_255, _221, _147);
    float _263 = fma(_259, _221, _151);
    float _265 = _241 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = _245 * 6.283185482025146484375;
    float _271 = sin(_269);
    float _273 = _245 * 6.283185482025146484375;
    float _275 = cos(_273);
    float _277 = _251 * 6.283185482025146484375;
    float _279 = sin(_277);
    float _281 = _249 * _271;
    float _283 = _271 * _267;
    float _285 = _251 * 6.283185482025146484375;
    float _287 = cos(_285);
    float _289 = _267 * _275;
    float _291 = _249 * _279;
    float _293 = fma(_279, _289, _281);
    float _295 = fma(_271, _291, _289);
    float _297 = -_149;
    float _299 = _297 + _169;
    float _301 = _249 * _275;
    float _303 = -_283;
    float _305 = fma(_275, _291, _303);
    float _307 = _249 * _287;
    float _309 = _287 * _261;
    float _311 = fma(_299, _221, _149);
    float _313 = _267 * _287;
    float _315 = -_301;
    float _317 = fma(_279, _283, _315);
    float _319 = _275 * _309;
    float _321 = _311 * _307;
    float _323 = _311 * _305;
    float _325 = _311 * _295;
    float _327 = _261 * _279;
    float _329 = -_191;
    float _331 = _329 + _211;
    float _333 = -_187;
    float _335 = _333 + _207;
    float _337 = -_189;
    float _339 = _337 + _209;
    float _341 = _263 * _313;
    float _343 = _263 * _293;
    float _345 = _263 * _317;
    float _347 = _271 * _309;
    float _349 = fma(_331, _221, _191);
    int _351 = _66 * 48;
    float _353 = -_327;
    float _355 = _353 + (-0.0);
    float _357 = fma(_335, _221, _187);
    float _359 = fma(_339, _221, _189);
    int _361 = _66 * 112;
    int _363 = _351 + 16;
    int _365 = _351 + 32;
    uint _367 = uint(int(uint(_365) >> uint(2)));
    _39[int(_367)] = as_type<uint>(_355);
    int _369 = _351 + 36;
    uint _371 = uint(int(uint(_369) >> uint(2)));
    _39[int(_371)] = as_type<uint>(_321);
    int _373 = _351 + 40;
    uint _375 = uint(int(uint(_373) >> uint(2)));
    _39[int(_375)] = as_type<uint>(_341);
    int _377 = _351 + 44;
    uint _379 = uint(int(uint(_377) >> uint(2)));
    _39[int(_379)] = as_type<uint>(_349);
    int _381 = _351 + 32;
    float _383 = _271;
    float _385 = _339;
    float _387 = _261;
    float _389 = _279;
    float _391 = _319;
    float _393 = _323;
    float _395 = _343;
    float _397 = _357;
    float _399 = _347;
    float _401 = _325;
    float _403 = _345;
    float _405 = _359;
    if (!_223)
    {
        _383 = _349;
    }
    float _407 = _383;
    uint _409 = uint(int(uint(_351) >> uint(2)));
    _39[int(_409)] = as_type<uint>(_319);
    int _411 = _351 + 4;
    uint _413 = uint(int(uint(_411) >> uint(2)));
    _39[int(_413)] = as_type<uint>(_323);
    int _415 = _351 + 8;
    uint _417 = uint(int(uint(_415) >> uint(2)));
    _39[int(_417)] = as_type<uint>(_343);
    int _419 = _351 + 12;
    uint _421 = uint(int(uint(_419) >> uint(2)));
    _39[int(_421)] = as_type<uint>(_357);
    float _423 = _407;
    if (!_223)
    {
        _385 = _355;
    }
    float _425 = _385;
    float _427 = _425;
    if (!_223)
    {
        _387 = _321;
    }
    float _429 = _387;
    int _431 = _351 + 16;
    uint _433 = uint(int(uint(_431) >> uint(2)));
    _39[int(_433)] = as_type<uint>(_347);
    int _435 = _351 + 20;
    uint _437 = uint(int(uint(_435) >> uint(2)));
    _39[int(_437)] = as_type<uint>(_325);
    int _439 = _351 + 24;
    uint _441 = uint(int(uint(_439) >> uint(2)));
    _39[int(_441)] = as_type<uint>(_345);
    int _443 = _351 + 28;
    uint _445 = uint(int(uint(_443) >> uint(2)));
    _39[int(_445)] = as_type<uint>(_359);
    float _447 = _429;
    if (!_223)
    {
        _389 = _341;
    }
    float _449 = _389;
    bool _451 = !_223;
    float _453 = _449;
    if (!_451)
    {
        bool _455 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _457 = !_455;
        if (!_457)
        {
            uint _459 = uint(int(uint(_361) >> uint(2)));
            uint _461 = uint(int(uint(int(_459)) >> uint(2)));
            int _463 = int(_459) & 3;
            float _465 = (*spvDescriptorSet0.cp_c6)._m0[int(_461)][_463];
            int _467 = as_type<int>(_465) * 48;
            int _469 = 0;
            bool _471;
            float _569;
            float _571;
            float _573;
            float _579;
            float _597;
            float _601;
            float _603;
            float _605;
            float _625;
            float _627;
            float _629;
            float _631;
            do
            {
                int _473 = _469;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _475 = uint(int(uint(_467) >> uint(2)));
                float _477 = as_type<float>(_39[int(_475)]);
                int _479 = _467 + 4;
                uint _481 = uint(int(uint(_479) >> uint(2)));
                float _483 = as_type<float>(_39[int(_481)]);
                int _485 = _467 + 8;
                uint _487 = uint(int(uint(_485) >> uint(2)));
                float _489 = as_type<float>(_39[int(_487)]);
                int _491 = _467 + 12;
                uint _493 = uint(int(uint(_491) >> uint(2)));
                float _495 = as_type<float>(_39[int(_493)]);
                int _497 = _473 + 1;
                int _499 = _467 + 16;
                uint _501 = uint(int(uint(_499) >> uint(2)));
                float _503 = as_type<float>(_39[int(_501)]);
                int _505 = _467 + 20;
                uint _507 = uint(int(uint(_505) >> uint(2)));
                float _509 = as_type<float>(_39[int(_507)]);
                int _511 = _467 + 24;
                uint _513 = uint(int(uint(_511) >> uint(2)));
                float _515 = as_type<float>(_39[int(_513)]);
                int _517 = _467 + 28;
                uint _519 = uint(int(uint(_517) >> uint(2)));
                float _521 = as_type<float>(_39[int(_519)]);
                bool _523 = uint(_497) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _525 = _467 + 32;
                uint _527 = uint(int(uint(_525) >> uint(2)));
                float _529 = as_type<float>(_39[int(_527)]);
                int _531 = _467 + 36;
                uint _533 = uint(int(uint(_531) >> uint(2)));
                float _535 = as_type<float>(_39[int(_533)]);
                int _537 = _467 + 40;
                uint _539 = uint(int(uint(_537) >> uint(2)));
                float _541 = as_type<float>(_39[int(_539)]);
                int _543 = _467 + 44;
                uint _545 = uint(int(uint(_543) >> uint(2)));
                float _547 = as_type<float>(_39[int(_545)]);
                float _549 = _359 * _483;
                float _551 = _347 * _483;
                float _553 = _325 * _483;
                float _555 = _345 * _483;
                float _557 = fma(_357, _477, _549);
                float _559 = fma(_319, _477, _551);
                float _561 = fma(_323, _477, _553);
                float _563 = fma(_343, _477, _555);
                float _565 = fma(_349, _489, _557);
                float _567 = -_327;
                _569 = fma(_567, _489, _559);
                _571 = fma(_321, _489, _561);
                _573 = fma(_341, _489, _563);
                float _575 = _359 * _509;
                float _577 = _347 * _509;
                _579 = _495 + _565;
                float _581 = _325 * _509;
                float _583 = _345 * _509;
                float _585 = fma(_357, _503, _575);
                float _587 = fma(_319, _503, _577);
                float _589 = fma(_323, _503, _581);
                float _591 = fma(_343, _503, _583);
                float _593 = fma(_349, _515, _585);
                float _595 = -_327;
                _597 = fma(_595, _515, _587);
                float _599 = _359 * _535;
                _601 = fma(_321, _515, _589);
                _603 = fma(_341, _515, _591);
                _605 = _521 + _593;
                float _607 = _347 * _535;
                float _609 = _325 * _535;
                float _611 = _345 * _535;
                float _613 = fma(_357, _529, _599);
                float _615 = fma(_319, _529, _607);
                float _617 = fma(_323, _529, _609);
                float _619 = fma(_343, _529, _611);
                float _621 = fma(_349, _541, _613);
                float _623 = -_327;
                _625 = fma(_623, _541, _615);
                _627 = fma(_321, _541, _617);
                _629 = fma(_341, _541, _619);
                _631 = _547 + _621;
                uint _633 = uint(int(uint(_351) >> uint(2)));
                _39[int(_633)] = as_type<uint>(_569);
                int _635 = _351 + 4;
                uint _637 = uint(int(uint(_635) >> uint(2)));
                _39[int(_637)] = as_type<uint>(_571);
                int _639 = _351 + 8;
                uint _641 = uint(int(uint(_639) >> uint(2)));
                _39[int(_641)] = as_type<uint>(_573);
                int _643 = _351 + 12;
                uint _645 = uint(int(uint(_643) >> uint(2)));
                _39[int(_645)] = as_type<uint>(_579);
                int _647 = _351 + 16;
                uint _649 = uint(int(uint(_647) >> uint(2)));
                _39[int(_649)] = as_type<uint>(_597);
                int _651 = _351 + 20;
                uint _653 = uint(int(uint(_651) >> uint(2)));
                _39[int(_653)] = as_type<uint>(_601);
                int _655 = _351 + 24;
                uint _657 = uint(int(uint(_655) >> uint(2)));
                _39[int(_657)] = as_type<uint>(_603);
                int _659 = _351 + 28;
                uint _661 = uint(int(uint(_659) >> uint(2)));
                _39[int(_661)] = as_type<uint>(_605);
                int _663 = _351 + 32;
                uint _665 = uint(int(uint(_663) >> uint(2)));
                _39[int(_665)] = as_type<uint>(_625);
                int _667 = _351 + 36;
                uint _669 = uint(int(uint(_667) >> uint(2)));
                _39[int(_669)] = as_type<uint>(_627);
                int _671 = _351 + 40;
                uint _673 = uint(int(uint(_671) >> uint(2)));
                _39[int(_673)] = as_type<uint>(_629);
                int _675 = _351 + 44;
                uint _677 = uint(int(uint(_675) >> uint(2)));
                _39[int(_677)] = as_type<uint>(_631);
                _471 = !_523;
                _469 = _497;
            } while (_471);
            _391 = _569;
            _393 = _571;
            _395 = _573;
            _397 = _579;
            _399 = _597;
            _401 = _601;
            _403 = _603;
            _405 = _605;
            _427 = _625;
            _447 = _627;
            _453 = _629;
            _423 = _631;
            _679 = true;
        }
        else
        {
            _391 = 0.0;
            _393 = 0.0;
            _395 = 0.0;
            _397 = 0.0;
            _399 = 0.0;
            _401 = 0.0;
            _403 = 0.0;
            _405 = 0.0;
            _427 = 0.0;
            _447 = 0.0;
            _453 = 0.0;
            _423 = 0.0;
        }
    }
    _679 = false;
    float _681 = _391;
    float _683 = _393;
    float _685 = _395;
    float _687 = _397;
    float _689 = _399;
    float _691 = _401;
    float _693 = _403;
    float _695 = _405;
    float _697 = _427;
    float _699 = _447;
    float _701 = _453;
    float _703 = _423;
    int _705 = _361 + 80;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    uint _709 = uint(int(uint(int(_707)) >> uint(2)));
    int _711 = int(_707) & 3;
    float _713 = (*spvDescriptorSet0.cp_c6)._m0[int(_709)][_711];
    int _715 = int(_707) + 1;
    uint _717 = uint(int(uint(_715) >> uint(2)));
    int _719 = _715 & 3;
    float _721 = (*spvDescriptorSet0.cp_c6)._m0[int(_717)][_719];
    bool _723 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _725 = _361 + 64;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    uint _729 = uint(int(uint(int(_727)) >> uint(2)));
    int _731 = int(_727) & 3;
    float _733 = (*spvDescriptorSet0.cp_c6)._m0[int(_729)][_731];
    int _735 = int(_727) + 1;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    int _739 = _735 & 3;
    float _741 = (*spvDescriptorSet0.cp_c6)._m0[int(_737)][_739];
    int _743 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _745 = _743 + _66;
    int _747 = _361 + 88;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.cp_c6)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.cp_c6)._m0[int(_759)][_761];
    int _765 = _361 + 72;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.cp_c6)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.cp_c6)._m0[int(_777)][_779];
    int _783 = _361 + 96;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.cp_c6)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.cp_c6)._m0[int(_795)][_797];
    int _801 = _361 + 104;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.cp_c6)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.cp_c6)._m0[int(_813)][_815];
    int _819 = _361 + 16;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    uint _823 = uint(int(uint(int(_821)) >> uint(2)));
    int _825 = int(_821) & 3;
    float _827 = (*spvDescriptorSet0.cp_c6)._m0[int(_823)][_825];
    int _829 = int(_821) + 1;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    int _833 = _829 & 3;
    float _835 = (*spvDescriptorSet0.cp_c6)._m0[int(_831)][_833];
    if (!_723)
    {
        uint _837 = uint(int(uint(_351) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_837)] = as_type<uint>(_681);
        int _839 = _351 + 4;
        uint _841 = uint(int(uint(_839) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_841)] = as_type<uint>(_683);
        int _843 = _351 + 8;
        uint _845 = uint(int(uint(_843) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_845)] = as_type<uint>(_685);
        int _847 = _351 + 12;
        uint _849 = uint(int(uint(_847) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_849)] = as_type<uint>(_687);
        uint _851 = uint(int(uint(_363) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_851)] = as_type<uint>(_689);
        int _853 = _363 + 4;
        uint _855 = uint(int(uint(_853) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_855)] = as_type<uint>(_691);
        int _857 = _363 + 8;
        uint _859 = uint(int(uint(_857) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_859)] = as_type<uint>(_693);
        int _861 = _363 + 12;
        uint _863 = uint(int(uint(_861) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_863)] = as_type<uint>(_695);
        uint _865 = uint(int(uint(_381) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_865)] = as_type<uint>(_697);
        int _867 = _381 + 4;
        uint _869 = uint(int(uint(_867) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_869)] = as_type<uint>(_699);
        int _871 = _381 + 8;
        uint _873 = uint(int(uint(_871) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_873)] = as_type<uint>(_701);
        int _875 = _381 + 12;
        uint _877 = uint(int(uint(_875) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_877)] = as_type<uint>(_703);
    }
    float _879 = _691 * _713;
    float _881 = _699 * _713;
    int _883 = _361 + 32;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.cp_c6)._m0[int(_887)][_889];
    int _893 = int(_885) + 1;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    int _897 = _893 & 3;
    float _899 = (*spvDescriptorSet0.cp_c6)._m0[int(_895)][_897];
    float _901 = _683 * _713;
    float _903 = fma(_689, _733, _879);
    float _905 = fma(_697, _733, _881);
    float _907 = _683 * _721;
    float _909 = _691 * _721;
    float _911 = _699 * _721;
    float _913 = _683 * _763;
    int _915 = _361 + 48;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    uint _919 = uint(int(uint(int(_917)) >> uint(2)));
    int _921 = int(_917) & 3;
    float _923 = (*spvDescriptorSet0.cp_c6)._m0[int(_919)][_921];
    int _925 = int(_917) + 1;
    uint _927 = uint(int(uint(_925) >> uint(2)));
    int _929 = _925 & 3;
    float _931 = (*spvDescriptorSet0.cp_c6)._m0[int(_927)][_929];
    float _933 = fma(_681, _741, _907);
    float _935 = fma(_689, _741, _909);
    float _937 = fma(_697, _741, _911);
    float _939 = _683 * _755;
    float _941 = _691 * _755;
    float _943 = _699 * _755;
    float _945 = _691 * _763;
    float _947 = _699 * _763;
    float _949 = fma(_681, _773, _939);
    int _951 = _361 + 24;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.cp_c6)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.cp_c6)._m0[int(_963)][_965];
    float _969 = fma(_681, _781, _913);
    float _971 = fma(_689, _773, _941);
    float _973 = fma(_689, _781, _945);
    float _975 = fma(_697, _773, _943);
    float _977 = fma(_697, _781, _947);
    float _979 = fma(_681, _733, _901);
    float _981 = fma(_685, _799, _933);
    int _983 = _361 + 40;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    uint _987 = uint(int(uint(int(_985)) >> uint(2)));
    int _989 = int(_985) & 3;
    float _991 = (*spvDescriptorSet0.cp_c6)._m0[int(_987)][_989];
    int _993 = int(_985) + 1;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    int _997 = _993 & 3;
    float _999 = (*spvDescriptorSet0.cp_c6)._m0[int(_995)][_997];
    float _1001 = fma(_685, _809, _949);
    float _1003 = fma(_685, _791, _979);
    float _1005 = fma(_685, _817, _969);
    float _1007 = fma(_693, _791, _903);
    float _1009 = fma(_693, _799, _935);
    float _1011 = fma(_693, _809, _971);
    float _1013 = fma(_693, _817, _973);
    int _1015 = _361 + 56;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
    int _1021 = int(_1017) & 3;
    float _1023 = (*spvDescriptorSet0.cp_c6)._m0[int(_1019)][_1021];
    int _1025 = int(_1017) + 1;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    int _1029 = _1025 & 3;
    float _1031 = (*spvDescriptorSet0.cp_c6)._m0[int(_1027)][_1029];
    float _1033 = fma(_701, _817, _977);
    float _1035 = _1005 + _687;
    float _1037 = _1013 + _695;
    float _1039 = fma(_701, _791, _905);
    float _1041 = _1033 + _703;
    float _1043 = fma(_701, _799, _937);
    float _1045 = _1037 * _835;
    float _1047 = fma(_701, _809, _975);
    float _1049 = _1009 * _835;
    float _1051 = _1007 * _835;
    float _1053 = _1011 * _835;
    float _1055 = fma(_1035, _827, _1045);
    float _1057 = fma(_981, _827, _1049);
    float _1059 = _1037 * _899;
    float _1061 = _1007 * _899;
    float _1063 = _1009 * _899;
    float _1065 = _1011 * _899;
    float _1067 = fma(_1035, _891, _1059);
    int _1069 = _745 * 48;
    float _1071 = fma(_1003, _827, _1051);
    float _1073 = fma(_1001, _827, _1053);
    float _1075 = _1037 * _931;
    float _1077 = _1007 * _931;
    float _1079 = _1009 * _931;
    float _1081 = _1011 * _931;
    float _1083 = fma(_1035, _923, _1075);
    float _1085 = fma(_1003, _891, _1061);
    float _1087 = fma(_981, _891, _1063);
    float _1089 = fma(_1001, _891, _1065);
    float _1091 = fma(_1003, _923, _1077);
    float _1093 = fma(_981, _923, _1079);
    float _1095 = fma(_1041, _959, _1055);
    float _1097 = fma(_1001, _923, _1081);
    float _1099 = fma(_1043, _959, _1057);
    float _1101 = fma(_1039, _959, _1071);
    float _1103 = fma(_1047, _959, _1073);
    float _1105 = _1095 + _967;
    int _1107 = _1069 + 16;
    float _1109 = fma(_1041, _991, _1067);
    float _1111 = fma(_1039, _991, _1085);
    float _1113 = fma(_1043, _991, _1087);
    float _1115 = fma(_1047, _991, _1089);
    float _1117 = _1109 + _999;
    int _1119 = _1069 + 32;
    uint _1121 = uint(int(uint(_1107) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1121)] = as_type<uint>(_1101);
    int _1123 = _1107 + 4;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1125)] = as_type<uint>(_1099);
    int _1127 = _1107 + 8;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1129)] = as_type<uint>(_1103);
    int _1131 = _1107 + 12;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1133)] = as_type<uint>(_1105);
    int _1135 = _1069 + 48;
    float _1137 = fma(_1041, _1023, _1083);
    float _1139 = fma(_1039, _1023, _1091);
    float _1141 = fma(_1043, _1023, _1093);
    float _1143 = fma(_1047, _1023, _1097);
    float _1145 = _1137 + _1031;
    uint _1147 = uint(int(uint(_1119) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1147)] = as_type<uint>(_1111);
    int _1149 = _1119 + 4;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1151)] = as_type<uint>(_1113);
    int _1153 = _1119 + 8;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1155)] = as_type<uint>(_1115);
    int _1157 = _1119 + 12;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1159)] = as_type<uint>(_1117);
    uint _1161 = uint(int(uint(_1135) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1161)] = as_type<uint>(_1139);
    int _1163 = _1135 + 4;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1165)] = as_type<uint>(_1141);
    int _1167 = _1135 + 8;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1169)] = as_type<uint>(_1143);
    int _1171 = _1135 + 12;
    uint _1173 = uint(int(uint(_1171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1173)] = as_type<uint>(_1145);
}

