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
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _3103, thread const int& _3104, constant _10& support_buffer)
{
    int _3107 = 1 + _3104;
    float _3109 = support_buffer._m5[_3107].x;
    bool _3111 = _3109 == 1.0;
    if (_3111)
    {
        return _3103;
    }
    float _3113 = float(_3103);
    float _3115 = _3113 * _3109;
    int _3117 = int(_3115);
    return _3117;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _675 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _76 = _74 + 8;
    uint _79 = uint(int(uint(_76) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.cp_c5)._m0[int(_81)][_83];
    uint _87 = uint(int(uint(_74) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _68;
    int _97 = 0;
    int _99 = _58(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_85);
    int _103 = 0;
    int _105 = _58(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1247 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1247.xy), uint(_1247.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _58(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _58(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1265 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1265.xy), uint(_1265.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 0;
    int _141 = _58(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_85);
    int _145 = 0;
    int _147 = _58(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1283 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1283.xy), uint(_1283.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 1;
    int _161 = _58(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_93);
    int _165 = 1;
    int _167 = _58(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1301 = int3(_161, _167, 0);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1301.xy), uint(_1301.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    int _177 = _68;
    int _179 = 0;
    int _181 = _58(_177, _179, (*spvDescriptorSet0.support_buffer));
    int _183 = as_type<int>(_85);
    int _185 = 0;
    int _187 = _58(_183, _185, (*spvDescriptorSet0.support_buffer));
    int3 _1319 = int3(_181, _187, 2);
    float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1319.xy), uint(_1319.z), 0).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    int _197 = _68;
    int _199 = 1;
    int _201 = _58(_197, _199, (*spvDescriptorSet0.support_buffer));
    int _203 = as_type<int>(_93);
    int _205 = 1;
    int _207 = _58(_203, _205, (*spvDescriptorSet0.support_buffer));
    int3 _1337 = int3(_201, _207, 2);
    float3 _209 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1337.xy), uint(_1337.z), 0).xyz;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    int _217 = _74 + 28;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.cp_c5)._m0[int(_221)][_223];
    bool _227 = _68 != 0;
    int _229 = _74 + 20;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    uint _233 = uint(int(uint(int(_231)) >> uint(2)));
    int _235 = int(_231) & 3;
    float _237 = (*spvDescriptorSet0.cp_c5)._m0[int(_233)][_235];
    float _239 = _111 * _225;
    float _241 = _115 * _225;
    float _243 = fma(_131, _237, _239);
    float _245 = fma(_135, _237, _241);
    float _247 = _243 * 0.15915493667125701904296875;
    float _249 = _113 * _225;
    float _251 = _245 * 0.15915493667125701904296875;
    float _253 = _247 * 6.283185482025146484375;
    float _255 = sin(_253);
    float _257 = fma(_133, _237, _249);
    float _259 = _257 * 0.15915493667125701904296875;
    float _261 = _247 * 6.283185482025146484375;
    float _263 = cos(_261);
    float _265 = _251 * 6.283185482025146484375;
    float _267 = sin(_265);
    float _269 = _251 * 6.283185482025146484375;
    float _271 = cos(_269);
    float _273 = _259 * 6.283185482025146484375;
    float _275 = sin(_273);
    float _277 = _255 * _267;
    float _279 = _151 * _225;
    float _281 = _267 * _263;
    float _283 = _195 * _225;
    float _285 = fma(_171, _237, _279);
    float _287 = _259 * 6.283185482025146484375;
    float _289 = cos(_287);
    float _291 = _263 * _271;
    float _293 = _255 * _271;
    float _295 = _255 * _275;
    float _297 = fma(_275, _291, _277);
    float _299 = -_293;
    float _301 = fma(_275, _281, _299);
    float _303 = fma(_215, _237, _283);
    float _305 = fma(_267, _295, _291);
    float _307 = _153 * _225;
    float _309 = _155 * _225;
    float _311 = -_281;
    float _313 = fma(_271, _295, _311);
    float _315 = _255 * _289;
    float _317 = fma(_173, _237, _307);
    float _319 = _263 * _289;
    float _321 = _289 * _285;
    float _323 = fma(_175, _237, _309);
    float _325 = _315 * _317;
    float _327 = _275 * _285;
    float _329 = _191 * _225;
    float _331 = _193 * _225;
    float _333 = _313 * _317;
    float _335 = _271 * _321;
    float _337 = _267 * _321;
    float _339 = _319 * _323;
    float _341 = _297 * _323;
    float _343 = _305 * _317;
    float _345 = _301 * _323;
    int _347 = _68 * 48;
    float _349 = -_327;
    float _351 = _349 + (-0.0);
    float _353 = fma(_211, _237, _329);
    float _355 = fma(_213, _237, _331);
    int _357 = _68 * 112;
    int _359 = _347 + 16;
    int _361 = _347 + 32;
    uint _363 = uint(int(uint(_361) >> uint(2)));
    _39[int(_363)] = as_type<uint>(_351);
    int _365 = _347 + 36;
    uint _367 = uint(int(uint(_365) >> uint(2)));
    _39[int(_367)] = as_type<uint>(_325);
    int _369 = _347 + 40;
    uint _371 = uint(int(uint(_369) >> uint(2)));
    _39[int(_371)] = as_type<uint>(_339);
    int _373 = _347 + 44;
    uint _375 = uint(int(uint(_373) >> uint(2)));
    _39[int(_375)] = as_type<uint>(_303);
    int _377 = _347 + 32;
    float _379 = _271;
    float _381 = _211;
    float _383 = _213;
    float _385 = _331;
    float _387 = _335;
    float _389 = _333;
    float _391 = _341;
    float _393 = _353;
    float _395 = _337;
    float _397 = _343;
    float _399 = _345;
    float _401 = _355;
    if (!_227)
    {
        _379 = _303;
    }
    float _403 = _379;
    uint _405 = uint(int(uint(_347) >> uint(2)));
    _39[int(_405)] = as_type<uint>(_335);
    int _407 = _347 + 4;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    _39[int(_409)] = as_type<uint>(_333);
    int _411 = _347 + 8;
    uint _413 = uint(int(uint(_411) >> uint(2)));
    _39[int(_413)] = as_type<uint>(_341);
    int _415 = _347 + 12;
    uint _417 = uint(int(uint(_415) >> uint(2)));
    _39[int(_417)] = as_type<uint>(_353);
    float _419 = _403;
    if (!_227)
    {
        _381 = _351;
    }
    float _421 = _381;
    float _423 = _421;
    if (!_227)
    {
        _383 = _325;
    }
    float _425 = _383;
    int _427 = _347 + 16;
    uint _429 = uint(int(uint(_427) >> uint(2)));
    _39[int(_429)] = as_type<uint>(_337);
    int _431 = _347 + 20;
    uint _433 = uint(int(uint(_431) >> uint(2)));
    _39[int(_433)] = as_type<uint>(_343);
    int _435 = _347 + 24;
    uint _437 = uint(int(uint(_435) >> uint(2)));
    _39[int(_437)] = as_type<uint>(_345);
    int _439 = _347 + 28;
    uint _441 = uint(int(uint(_439) >> uint(2)));
    _39[int(_441)] = as_type<uint>(_355);
    float _443 = _425;
    if (!_227)
    {
        _385 = _339;
    }
    float _445 = _385;
    bool _447 = !_227;
    float _449 = _445;
    if (!_447)
    {
        bool _451 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _453 = !_451;
        if (!_453)
        {
            uint _455 = uint(int(uint(_357) >> uint(2)));
            uint _457 = uint(int(uint(int(_455)) >> uint(2)));
            int _459 = int(_455) & 3;
            float _461 = (*spvDescriptorSet0.cp_c6)._m0[int(_457)][_459];
            int _463 = as_type<int>(_461) * 48;
            int _465 = 0;
            bool _467;
            float _565;
            float _567;
            float _569;
            float _575;
            float _593;
            float _597;
            float _599;
            float _601;
            float _621;
            float _623;
            float _625;
            float _627;
            do
            {
                int _469 = _465;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _471 = uint(int(uint(_463) >> uint(2)));
                float _473 = as_type<float>(_39[int(_471)]);
                int _475 = _463 + 4;
                uint _477 = uint(int(uint(_475) >> uint(2)));
                float _479 = as_type<float>(_39[int(_477)]);
                int _481 = _463 + 8;
                uint _483 = uint(int(uint(_481) >> uint(2)));
                float _485 = as_type<float>(_39[int(_483)]);
                int _487 = _463 + 12;
                uint _489 = uint(int(uint(_487) >> uint(2)));
                float _491 = as_type<float>(_39[int(_489)]);
                int _493 = _469 + 1;
                int _495 = _463 + 16;
                uint _497 = uint(int(uint(_495) >> uint(2)));
                float _499 = as_type<float>(_39[int(_497)]);
                int _501 = _463 + 20;
                uint _503 = uint(int(uint(_501) >> uint(2)));
                float _505 = as_type<float>(_39[int(_503)]);
                int _507 = _463 + 24;
                uint _509 = uint(int(uint(_507) >> uint(2)));
                float _511 = as_type<float>(_39[int(_509)]);
                int _513 = _463 + 28;
                uint _515 = uint(int(uint(_513) >> uint(2)));
                float _517 = as_type<float>(_39[int(_515)]);
                bool _519 = uint(_493) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _521 = _463 + 32;
                uint _523 = uint(int(uint(_521) >> uint(2)));
                float _525 = as_type<float>(_39[int(_523)]);
                int _527 = _463 + 36;
                uint _529 = uint(int(uint(_527) >> uint(2)));
                float _531 = as_type<float>(_39[int(_529)]);
                int _533 = _463 + 40;
                uint _535 = uint(int(uint(_533) >> uint(2)));
                float _537 = as_type<float>(_39[int(_535)]);
                int _539 = _463 + 44;
                uint _541 = uint(int(uint(_539) >> uint(2)));
                float _543 = as_type<float>(_39[int(_541)]);
                float _545 = _355 * _479;
                float _547 = _337 * _479;
                float _549 = _343 * _479;
                float _551 = _345 * _479;
                float _553 = fma(_353, _473, _545);
                float _555 = fma(_335, _473, _547);
                float _557 = fma(_333, _473, _549);
                float _559 = fma(_341, _473, _551);
                float _561 = fma(_303, _485, _553);
                float _563 = -_327;
                _565 = fma(_563, _485, _555);
                _567 = fma(_325, _485, _557);
                _569 = fma(_339, _485, _559);
                float _571 = _355 * _505;
                float _573 = _337 * _505;
                _575 = _491 + _561;
                float _577 = _343 * _505;
                float _579 = _345 * _505;
                float _581 = fma(_353, _499, _571);
                float _583 = fma(_335, _499, _573);
                float _585 = fma(_333, _499, _577);
                float _587 = fma(_341, _499, _579);
                float _589 = fma(_303, _511, _581);
                float _591 = -_327;
                _593 = fma(_591, _511, _583);
                float _595 = _355 * _531;
                _597 = fma(_325, _511, _585);
                _599 = fma(_339, _511, _587);
                _601 = _517 + _589;
                float _603 = _337 * _531;
                float _605 = _343 * _531;
                float _607 = _345 * _531;
                float _609 = fma(_353, _525, _595);
                float _611 = fma(_335, _525, _603);
                float _613 = fma(_333, _525, _605);
                float _615 = fma(_341, _525, _607);
                float _617 = fma(_303, _537, _609);
                float _619 = -_327;
                _621 = fma(_619, _537, _611);
                _623 = fma(_325, _537, _613);
                _625 = fma(_339, _537, _615);
                _627 = _543 + _617;
                uint _629 = uint(int(uint(_347) >> uint(2)));
                _39[int(_629)] = as_type<uint>(_565);
                int _631 = _347 + 4;
                uint _633 = uint(int(uint(_631) >> uint(2)));
                _39[int(_633)] = as_type<uint>(_567);
                int _635 = _347 + 8;
                uint _637 = uint(int(uint(_635) >> uint(2)));
                _39[int(_637)] = as_type<uint>(_569);
                int _639 = _347 + 12;
                uint _641 = uint(int(uint(_639) >> uint(2)));
                _39[int(_641)] = as_type<uint>(_575);
                int _643 = _347 + 16;
                uint _645 = uint(int(uint(_643) >> uint(2)));
                _39[int(_645)] = as_type<uint>(_593);
                int _647 = _347 + 20;
                uint _649 = uint(int(uint(_647) >> uint(2)));
                _39[int(_649)] = as_type<uint>(_597);
                int _651 = _347 + 24;
                uint _653 = uint(int(uint(_651) >> uint(2)));
                _39[int(_653)] = as_type<uint>(_599);
                int _655 = _347 + 28;
                uint _657 = uint(int(uint(_655) >> uint(2)));
                _39[int(_657)] = as_type<uint>(_601);
                int _659 = _347 + 32;
                uint _661 = uint(int(uint(_659) >> uint(2)));
                _39[int(_661)] = as_type<uint>(_621);
                int _663 = _347 + 36;
                uint _665 = uint(int(uint(_663) >> uint(2)));
                _39[int(_665)] = as_type<uint>(_623);
                int _667 = _347 + 40;
                uint _669 = uint(int(uint(_667) >> uint(2)));
                _39[int(_669)] = as_type<uint>(_625);
                int _671 = _347 + 44;
                uint _673 = uint(int(uint(_671) >> uint(2)));
                _39[int(_673)] = as_type<uint>(_627);
                _467 = !_519;
                _465 = _493;
            } while (_467);
            _387 = _565;
            _389 = _567;
            _391 = _569;
            _393 = _575;
            _395 = _593;
            _397 = _597;
            _399 = _599;
            _401 = _601;
            _423 = _621;
            _443 = _623;
            _449 = _625;
            _419 = _627;
            _675 = true;
        }
        else
        {
            _387 = 0.0;
            _389 = 0.0;
            _391 = 0.0;
            _393 = 0.0;
            _395 = 0.0;
            _397 = 0.0;
            _399 = 0.0;
            _401 = 0.0;
            _423 = 0.0;
            _443 = 0.0;
            _449 = 0.0;
            _419 = 0.0;
        }
    }
    _675 = false;
    float _677 = _387;
    float _679 = _389;
    float _681 = _391;
    float _683 = _393;
    float _685 = _395;
    float _687 = _397;
    float _689 = _399;
    float _691 = _401;
    float _693 = _423;
    float _695 = _443;
    float _697 = _449;
    float _699 = _419;
    int _701 = _357 + 80;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    uint _705 = uint(int(uint(int(_703)) >> uint(2)));
    int _707 = int(_703) & 3;
    float _709 = (*spvDescriptorSet0.cp_c6)._m0[int(_705)][_707];
    int _711 = int(_703) + 1;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    int _715 = _711 & 3;
    float _717 = (*spvDescriptorSet0.cp_c6)._m0[int(_713)][_715];
    bool _719 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _721 = _357 + 64;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.cp_c6)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.cp_c6)._m0[int(_733)][_735];
    int _739 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _741 = _739 + _68;
    int _743 = _357 + 88;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.cp_c6)._m0[int(_747)][_749];
    int _753 = int(_745) + 1;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    int _757 = _753 & 3;
    float _759 = (*spvDescriptorSet0.cp_c6)._m0[int(_755)][_757];
    int _761 = _357 + 72;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    uint _765 = uint(int(uint(int(_763)) >> uint(2)));
    int _767 = int(_763) & 3;
    float _769 = (*spvDescriptorSet0.cp_c6)._m0[int(_765)][_767];
    int _771 = int(_763) + 1;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    int _775 = _771 & 3;
    float _777 = (*spvDescriptorSet0.cp_c6)._m0[int(_773)][_775];
    int _779 = _357 + 96;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    uint _783 = uint(int(uint(int(_781)) >> uint(2)));
    int _785 = int(_781) & 3;
    float _787 = (*spvDescriptorSet0.cp_c6)._m0[int(_783)][_785];
    int _789 = int(_781) + 1;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    int _793 = _789 & 3;
    float _795 = (*spvDescriptorSet0.cp_c6)._m0[int(_791)][_793];
    int _797 = _357 + 104;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    uint _801 = uint(int(uint(int(_799)) >> uint(2)));
    int _803 = int(_799) & 3;
    float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
    int _807 = int(_799) + 1;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    int _811 = _807 & 3;
    float _813 = (*spvDescriptorSet0.cp_c6)._m0[int(_809)][_811];
    int _815 = _357 + 16;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.cp_c6)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.cp_c6)._m0[int(_827)][_829];
    if (!_719)
    {
        uint _833 = uint(int(uint(_347) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_833)] = as_type<uint>(_677);
        int _835 = _347 + 4;
        uint _837 = uint(int(uint(_835) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_837)] = as_type<uint>(_679);
        int _839 = _347 + 8;
        uint _841 = uint(int(uint(_839) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_841)] = as_type<uint>(_681);
        int _843 = _347 + 12;
        uint _845 = uint(int(uint(_843) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_845)] = as_type<uint>(_683);
        uint _847 = uint(int(uint(_359) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_847)] = as_type<uint>(_685);
        int _849 = _359 + 4;
        uint _851 = uint(int(uint(_849) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_851)] = as_type<uint>(_687);
        int _853 = _359 + 8;
        uint _855 = uint(int(uint(_853) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_855)] = as_type<uint>(_689);
        int _857 = _359 + 12;
        uint _859 = uint(int(uint(_857) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_859)] = as_type<uint>(_691);
        uint _861 = uint(int(uint(_377) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_861)] = as_type<uint>(_693);
        int _863 = _377 + 4;
        uint _865 = uint(int(uint(_863) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_865)] = as_type<uint>(_695);
        int _867 = _377 + 8;
        uint _869 = uint(int(uint(_867) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_869)] = as_type<uint>(_697);
        int _871 = _377 + 12;
        uint _873 = uint(int(uint(_871) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_873)] = as_type<uint>(_699);
    }
    float _875 = _687 * _709;
    float _877 = _695 * _709;
    int _879 = _357 + 32;
    uint _881 = uint(int(uint(_879) >> uint(2)));
    uint _883 = uint(int(uint(int(_881)) >> uint(2)));
    int _885 = int(_881) & 3;
    float _887 = (*spvDescriptorSet0.cp_c6)._m0[int(_883)][_885];
    int _889 = int(_881) + 1;
    uint _891 = uint(int(uint(_889) >> uint(2)));
    int _893 = _889 & 3;
    float _895 = (*spvDescriptorSet0.cp_c6)._m0[int(_891)][_893];
    float _897 = _679 * _709;
    float _899 = fma(_685, _729, _875);
    float _901 = fma(_693, _729, _877);
    float _903 = _679 * _717;
    float _905 = _687 * _717;
    float _907 = _695 * _717;
    float _909 = _679 * _759;
    int _911 = _357 + 48;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    uint _915 = uint(int(uint(int(_913)) >> uint(2)));
    int _917 = int(_913) & 3;
    float _919 = (*spvDescriptorSet0.cp_c6)._m0[int(_915)][_917];
    int _921 = int(_913) + 1;
    uint _923 = uint(int(uint(_921) >> uint(2)));
    int _925 = _921 & 3;
    float _927 = (*spvDescriptorSet0.cp_c6)._m0[int(_923)][_925];
    float _929 = fma(_677, _737, _903);
    float _931 = fma(_685, _737, _905);
    float _933 = fma(_693, _737, _907);
    float _935 = _679 * _751;
    float _937 = _695 * _751;
    float _939 = _687 * _751;
    float _941 = _687 * _759;
    float _943 = _695 * _759;
    float _945 = fma(_677, _769, _935);
    int _947 = _357 + 24;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    uint _951 = uint(int(uint(int(_949)) >> uint(2)));
    int _953 = int(_949) & 3;
    float _955 = (*spvDescriptorSet0.cp_c6)._m0[int(_951)][_953];
    int _957 = int(_949) + 1;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    int _961 = _957 & 3;
    float _963 = (*spvDescriptorSet0.cp_c6)._m0[int(_959)][_961];
    float _965 = fma(_677, _777, _909);
    float _967 = fma(_685, _769, _939);
    float _969 = fma(_685, _777, _941);
    float _971 = fma(_693, _769, _937);
    float _973 = fma(_693, _777, _943);
    float _975 = fma(_677, _729, _897);
    float _977 = fma(_689, _813, _969);
    int _979 = _357 + 40;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    uint _983 = uint(int(uint(int(_981)) >> uint(2)));
    int _985 = int(_981) & 3;
    float _987 = (*spvDescriptorSet0.cp_c6)._m0[int(_983)][_985];
    int _989 = int(_981) + 1;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    int _993 = _989 & 3;
    float _995 = (*spvDescriptorSet0.cp_c6)._m0[int(_991)][_993];
    float _997 = fma(_681, _813, _965);
    float _999 = fma(_681, _787, _975);
    float _1001 = _977 + _691;
    float _1003 = fma(_681, _795, _929);
    float _1005 = fma(_681, _805, _945);
    float _1007 = fma(_689, _787, _899);
    float _1009 = fma(_689, _795, _931);
    int _1011 = _357 + 56;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    uint _1015 = uint(int(uint(int(_1013)) >> uint(2)));
    int _1017 = int(_1013) & 3;
    float _1019 = (*spvDescriptorSet0.cp_c6)._m0[int(_1015)][_1017];
    int _1021 = int(_1013) + 1;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    int _1025 = _1021 & 3;
    float _1027 = (*spvDescriptorSet0.cp_c6)._m0[int(_1023)][_1025];
    float _1029 = fma(_689, _805, _967);
    float _1031 = fma(_697, _813, _973);
    float _1033 = _997 + _683;
    float _1035 = _1001 * _831;
    float _1037 = fma(_697, _787, _901);
    float _1039 = fma(_697, _795, _933);
    float _1041 = fma(_697, _805, _971);
    float _1043 = _1031 + _699;
    float _1045 = _1009 * _831;
    float _1047 = _1007 * _831;
    float _1049 = _1029 * _831;
    float _1051 = fma(_1033, _823, _1035);
    float _1053 = fma(_1003, _823, _1045);
    float _1055 = _1001 * _895;
    float _1057 = _1007 * _895;
    float _1059 = _1009 * _895;
    float _1061 = _1029 * _895;
    float _1063 = fma(_1033, _887, _1055);
    int _1065 = _741 * 48;
    float _1067 = fma(_999, _823, _1047);
    float _1069 = fma(_1005, _823, _1049);
    float _1071 = _1001 * _927;
    float _1073 = _1007 * _927;
    float _1075 = _1009 * _927;
    float _1077 = _1029 * _927;
    float _1079 = fma(_1033, _919, _1071);
    float _1081 = fma(_999, _887, _1057);
    float _1083 = fma(_1003, _887, _1059);
    float _1085 = fma(_1005, _887, _1061);
    float _1087 = fma(_999, _919, _1073);
    float _1089 = fma(_1003, _919, _1075);
    float _1091 = fma(_1043, _955, _1051);
    float _1093 = fma(_1005, _919, _1077);
    float _1095 = fma(_1039, _955, _1053);
    float _1097 = fma(_1037, _955, _1067);
    float _1099 = fma(_1041, _955, _1069);
    float _1101 = _1091 + _963;
    int _1103 = _1065 + 16;
    float _1105 = fma(_1043, _987, _1063);
    float _1107 = fma(_1037, _987, _1081);
    float _1109 = fma(_1039, _987, _1083);
    float _1111 = fma(_1041, _987, _1085);
    float _1113 = _1105 + _995;
    int _1115 = _1065 + 32;
    uint _1117 = uint(int(uint(_1103) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1117)] = as_type<uint>(_1097);
    int _1119 = _1103 + 4;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1121)] = as_type<uint>(_1095);
    int _1123 = _1103 + 8;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1125)] = as_type<uint>(_1099);
    int _1127 = _1103 + 12;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1129)] = as_type<uint>(_1101);
    int _1131 = _1065 + 48;
    float _1133 = fma(_1043, _1019, _1079);
    float _1135 = fma(_1037, _1019, _1087);
    float _1137 = fma(_1039, _1019, _1089);
    float _1139 = fma(_1041, _1019, _1093);
    float _1141 = _1133 + _1027;
    uint _1143 = uint(int(uint(_1115) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1143)] = as_type<uint>(_1107);
    int _1145 = _1115 + 4;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1147)] = as_type<uint>(_1109);
    int _1149 = _1115 + 8;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1151)] = as_type<uint>(_1111);
    int _1153 = _1115 + 12;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1155)] = as_type<uint>(_1113);
    uint _1157 = uint(int(uint(_1131) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1157)] = as_type<uint>(_1135);
    int _1159 = _1131 + 4;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1161)] = as_type<uint>(_1137);
    int _1163 = _1131 + 8;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1165)] = as_type<uint>(_1139);
    int _1167 = _1131 + 12;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1169)] = as_type<uint>(_1141);
}

