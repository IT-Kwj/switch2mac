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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _2957, thread const int& _2958, constant _10& support_buffer)
{
    int _2961 = 1 + _2958;
    float _2963 = support_buffer._m5[_2961].x;
    bool _2965 = _2963 == 1.0;
    if (_2965)
    {
        return _2957;
    }
    float _2967 = float(_2957);
    float _2969 = _2967 * _2963;
    int _2971 = int(_2969);
    return _2971;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _681 = false;
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
    int _74 = _72 + 8;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.cp_c5)._m0[int(_79)][_81];
    uint _85 = uint(int(uint(_72) >> uint(2)));
    uint _87 = uint(int(uint(int(_85)) >> uint(2)));
    int _89 = int(_85) & 3;
    float _91 = (*spvDescriptorSet0.cp_c5)._m0[int(_87)][_89];
    int _93 = _66;
    int _95 = 0;
    int _97 = _56(_93, _95, (*spvDescriptorSet0.support_buffer));
    int _99 = as_type<int>(_83);
    int _101 = 0;
    int _103 = _56(_99, _101, (*spvDescriptorSet0.support_buffer));
    int3 _1209 = int3(_97, _103, 1);
    float3 _107 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1209.xy), uint(_1209.z), 0).xyz;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    int _115 = _66;
    int _117 = 1;
    int _119 = _56(_115, _117, (*spvDescriptorSet0.support_buffer));
    int _121 = as_type<int>(_91);
    int _123 = 1;
    int _125 = _56(_121, _123, (*spvDescriptorSet0.support_buffer));
    int3 _1227 = int3(_119, _125, 1);
    float3 _127 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1227.xy), uint(_1227.z), 0).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    int _135 = _66;
    int _137 = 0;
    int _139 = _56(_135, _137, (*spvDescriptorSet0.support_buffer));
    int _141 = as_type<int>(_83);
    int _143 = 0;
    int _145 = _56(_141, _143, (*spvDescriptorSet0.support_buffer));
    int3 _1245 = int3(_139, _145, 0);
    float3 _147 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1245.xy), uint(_1245.z), 0).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    int _155 = _66;
    int _157 = 1;
    int _159 = _56(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = as_type<int>(_91);
    int _163 = 1;
    int _165 = _56(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _1263 = int3(_159, _165, 0);
    float3 _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1263.xy), uint(_1263.z), 0).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    int _175 = _66;
    int _177 = 0;
    int _179 = _56(_175, _177, (*spvDescriptorSet0.support_buffer));
    int _181 = as_type<int>(_83);
    int _183 = 0;
    int _185 = _56(_181, _183, (*spvDescriptorSet0.support_buffer));
    int3 _1281 = int3(_179, _185, 2);
    float3 _187 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1281.xy), uint(_1281.z), 0).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    int _195 = _66;
    int _197 = 1;
    int _199 = _56(_195, _197, (*spvDescriptorSet0.support_buffer));
    int _201 = as_type<int>(_91);
    int _203 = 1;
    int _205 = _56(_201, _203, (*spvDescriptorSet0.support_buffer));
    int3 _1299 = int3(_199, _205, 2);
    float3 _207 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1299.xy), uint(_1299.z), 0).xyz;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    int _215 = _72 + 28;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    uint _219 = uint(int(uint(int(_217)) >> uint(2)));
    int _221 = int(_217) & 3;
    float _223 = (*spvDescriptorSet0.cp_c5)._m0[int(_219)][_221];
    bool _225 = _66 != 0;
    int _227 = _72 + 20;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    uint _231 = uint(int(uint(int(_229)) >> uint(2)));
    int _233 = int(_229) & 3;
    float _235 = (*spvDescriptorSet0.cp_c5)._m0[int(_231)][_233];
    float _237 = _109 * _223;
    float _239 = fma(_129, _235, _237);
    float _241 = _239 * 0.15915493667125701904296875;
    float _243 = _113 * _223;
    float _245 = _241 * 6.283185482025146484375;
    float _247 = sin(_245);
    float _249 = fma(_133, _235, _243);
    float _251 = _111 * _223;
    float _253 = _249 * 0.15915493667125701904296875;
    float _255 = fma(_131, _235, _251);
    float _257 = _241 * 6.283185482025146484375;
    float _259 = cos(_257);
    float _261 = _255 * 0.15915493667125701904296875;
    float _263 = _253 * 6.283185482025146484375;
    float _265 = sin(_263);
    float _267 = _253 * 6.283185482025146484375;
    float _269 = cos(_267);
    float _271 = _261 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _247 * _265;
    float _277 = _149 * _223;
    float _279 = _265 * _259;
    float _281 = _193 * _223;
    int _283 = _66 * 112;
    float _285 = fma(_169, _235, _277);
    float _287 = _261 * 6.283185482025146484375;
    float _289 = cos(_287);
    float _291 = _259 * _269;
    float _293 = _247 * _269;
    float _295 = fma(_213, _235, _281);
    int _297 = _66 * 48;
    float _299 = _247 * _273;
    float _301 = fma(_273, _291, _275);
    float _303 = -_293;
    float _305 = fma(_273, _279, _303);
    float _307 = fma(_265, _299, _291);
    float _309 = _151 * _223;
    float _311 = _153 * _223;
    float _313 = -_279;
    float _315 = fma(_269, _299, _313);
    float _317 = _289 * _285;
    float _319 = fma(_171, _235, _309);
    float _321 = fma(_173, _235, _311);
    float _323 = _273 * _285;
    float _325 = _259 * _289;
    float _327 = _247 * _289;
    float _329 = _269 * _317;
    float _331 = _265 * _317;
    float _333 = _189 * _223;
    float _335 = _191 * _223;
    float _337 = _315 * _319;
    float _339 = _327 * _319;
    float _341 = _325 * _321;
    float _343 = _301 * _321;
    float _345 = _307 * _319;
    float _347 = _305 * _321;
    float _349 = -_323;
    float _351 = _349 + (-0.0);
    float _353 = fma(_209, _235, _333);
    float _355 = fma(_211, _235, _335);
    float _357 = _335;
    float _359 = _153;
    float _361 = _307;
    float _363 = _211;
    float _365 = _305;
    float _367 = _301;
    float _369 = _209;
    float _371 = _345;
    float _373 = _337;
    float _375 = _347;
    float _377 = _343;
    float _379 = _341;
    if (!_225)
    {
        _357 = _295;
    }
    float _381 = _357;
    int _383 = _297 + 32;
    uint _385 = uint(int(uint(_383) >> uint(2)));
    _37[int(_385)] = as_type<uint>(_351);
    int _387 = _297 + 36;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    _37[int(_389)] = as_type<uint>(_339);
    int _391 = _297 + 40;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    _37[int(_393)] = as_type<uint>(_341);
    int _395 = _297 + 44;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    _37[int(_397)] = as_type<uint>(_295);
    float _399 = _381;
    if (!_225)
    {
        _359 = _353;
    }
    float _401 = _359;
    float _403 = _401;
    if (!_225)
    {
        _361 = _355;
    }
    float _405 = _361;
    uint _407 = uint(int(uint(_297) >> uint(2)));
    _37[int(_407)] = as_type<uint>(_329);
    int _409 = _297 + 4;
    uint _411 = uint(int(uint(_409) >> uint(2)));
    _37[int(_411)] = as_type<uint>(_337);
    int _413 = _297 + 8;
    uint _415 = uint(int(uint(_413) >> uint(2)));
    _37[int(_415)] = as_type<uint>(_343);
    int _417 = _297 + 12;
    uint _419 = uint(int(uint(_417) >> uint(2)));
    _37[int(_419)] = as_type<uint>(_353);
    float _421 = _405;
    if (!_225)
    {
        _363 = _351;
    }
    float _423 = _363;
    float _425 = _423;
    if (!_225)
    {
        _365 = _329;
    }
    float _427 = _365;
    int _429 = _297 + 16;
    uint _431 = uint(int(uint(_429) >> uint(2)));
    _37[int(_431)] = as_type<uint>(_331);
    int _433 = _297 + 20;
    uint _435 = uint(int(uint(_433) >> uint(2)));
    _37[int(_435)] = as_type<uint>(_345);
    int _437 = _297 + 24;
    uint _439 = uint(int(uint(_437) >> uint(2)));
    _37[int(_439)] = as_type<uint>(_347);
    int _441 = _297 + 28;
    uint _443 = uint(int(uint(_441) >> uint(2)));
    _37[int(_443)] = as_type<uint>(_355);
    float _445 = _427;
    if (!_225)
    {
        _367 = _331;
    }
    float _447 = _367;
    float _449 = _447;
    if (!_225)
    {
        _369 = _339;
    }
    float _451 = _369;
    bool _453 = !_225;
    float _455 = _451;
    if (!_453)
    {
        bool _457 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _459 = !_457;
        if (!_459)
        {
            uint _461 = uint(int(uint(_283) >> uint(2)));
            uint _463 = uint(int(uint(int(_461)) >> uint(2)));
            int _465 = int(_461) & 3;
            float _467 = (*spvDescriptorSet0.cp_c6)._m0[int(_463)][_465];
            int _469 = as_type<int>(_467) * 48;
            int _471 = 0;
            bool _473;
            float _571;
            float _575;
            float _579;
            float _597;
            float _601;
            float _603;
            float _605;
            float _625;
            float _627;
            float _629;
            float _631;
            float _633;
            do
            {
                int _475 = _471;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _477 = uint(int(uint(_469) >> uint(2)));
                float _479 = as_type<float>(_37[int(_477)]);
                int _481 = _469 + 4;
                uint _483 = uint(int(uint(_481) >> uint(2)));
                float _485 = as_type<float>(_37[int(_483)]);
                int _487 = _469 + 8;
                uint _489 = uint(int(uint(_487) >> uint(2)));
                float _491 = as_type<float>(_37[int(_489)]);
                int _493 = _469 + 12;
                uint _495 = uint(int(uint(_493) >> uint(2)));
                float _497 = as_type<float>(_37[int(_495)]);
                int _499 = _475 + 1;
                int _501 = _469 + 16;
                uint _503 = uint(int(uint(_501) >> uint(2)));
                float _505 = as_type<float>(_37[int(_503)]);
                int _507 = _469 + 20;
                uint _509 = uint(int(uint(_507) >> uint(2)));
                float _511 = as_type<float>(_37[int(_509)]);
                int _513 = _469 + 24;
                uint _515 = uint(int(uint(_513) >> uint(2)));
                float _517 = as_type<float>(_37[int(_515)]);
                int _519 = _469 + 28;
                uint _521 = uint(int(uint(_519) >> uint(2)));
                float _523 = as_type<float>(_37[int(_521)]);
                bool _525 = uint(_499) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _527 = _469 + 32;
                uint _529 = uint(int(uint(_527) >> uint(2)));
                float _531 = as_type<float>(_37[int(_529)]);
                int _533 = _469 + 36;
                uint _535 = uint(int(uint(_533) >> uint(2)));
                float _537 = as_type<float>(_37[int(_535)]);
                int _539 = _469 + 40;
                uint _541 = uint(int(uint(_539) >> uint(2)));
                float _543 = as_type<float>(_37[int(_541)]);
                int _545 = _469 + 44;
                uint _547 = uint(int(uint(_545) >> uint(2)));
                float _549 = as_type<float>(_37[int(_547)]);
                float _551 = _355 * _485;
                float _553 = _331 * _485;
                float _555 = _345 * _485;
                float _557 = _347 * _485;
                float _559 = fma(_353, _479, _551);
                float _561 = fma(_329, _479, _553);
                float _563 = fma(_337, _479, _555);
                float _565 = fma(_343, _479, _557);
                float _567 = _331 * _511;
                float _569 = -_323;
                _571 = fma(_569, _491, _561);
                float _573 = _355 * _511;
                _575 = fma(_339, _491, _563);
                float _577 = fma(_295, _491, _559);
                _579 = fma(_341, _491, _565);
                float _581 = _345 * _511;
                float _583 = _347 * _511;
                float _585 = fma(_353, _505, _573);
                float _587 = fma(_329, _505, _567);
                float _589 = fma(_337, _505, _581);
                float _591 = fma(_343, _505, _583);
                float _593 = fma(_295, _517, _585);
                float _595 = -_323;
                _597 = fma(_595, _517, _587);
                float _599 = _355 * _537;
                _601 = fma(_339, _517, _589);
                _603 = fma(_341, _517, _591);
                _605 = _523 + _593;
                float _607 = _331 * _537;
                float _609 = _345 * _537;
                float _611 = _347 * _537;
                float _613 = fma(_353, _531, _599);
                float _615 = fma(_329, _531, _607);
                float _617 = fma(_337, _531, _609);
                float _619 = fma(_343, _531, _611);
                float _621 = fma(_295, _543, _613);
                float _623 = -_323;
                _625 = fma(_623, _543, _615);
                _627 = fma(_339, _543, _617);
                _629 = _497 + _577;
                _631 = fma(_341, _543, _619);
                _633 = _549 + _621;
                int _635 = _297 + 16;
                uint _637 = uint(int(uint(_635) >> uint(2)));
                _37[int(_637)] = as_type<uint>(_597);
                int _639 = _297 + 20;
                uint _641 = uint(int(uint(_639) >> uint(2)));
                _37[int(_641)] = as_type<uint>(_601);
                int _643 = _297 + 24;
                uint _645 = uint(int(uint(_643) >> uint(2)));
                _37[int(_645)] = as_type<uint>(_603);
                int _647 = _297 + 28;
                uint _649 = uint(int(uint(_647) >> uint(2)));
                _37[int(_649)] = as_type<uint>(_605);
                uint _651 = uint(int(uint(_297) >> uint(2)));
                _37[int(_651)] = as_type<uint>(_571);
                int _653 = _297 + 4;
                uint _655 = uint(int(uint(_653) >> uint(2)));
                _37[int(_655)] = as_type<uint>(_575);
                int _657 = _297 + 8;
                uint _659 = uint(int(uint(_657) >> uint(2)));
                _37[int(_659)] = as_type<uint>(_579);
                int _661 = _297 + 12;
                uint _663 = uint(int(uint(_661) >> uint(2)));
                _37[int(_663)] = as_type<uint>(_629);
                int _665 = _297 + 32;
                uint _667 = uint(int(uint(_665) >> uint(2)));
                _37[int(_667)] = as_type<uint>(_625);
                int _669 = _297 + 36;
                uint _671 = uint(int(uint(_669) >> uint(2)));
                _37[int(_671)] = as_type<uint>(_627);
                int _673 = _297 + 40;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                _37[int(_675)] = as_type<uint>(_631);
                int _677 = _297 + 44;
                uint _679 = uint(int(uint(_677) >> uint(2)));
                _37[int(_679)] = as_type<uint>(_633);
                _473 = !_525;
                _471 = _499;
            } while (_473);
            _371 = _601;
            _373 = _575;
            _455 = _627;
            _449 = _597;
            _425 = _625;
            _445 = _571;
            _375 = _603;
            _377 = _579;
            _379 = _631;
            _421 = _605;
            _403 = _629;
            _399 = _633;
            _681 = true;
        }
        else
        {
            _371 = 0.0;
            _373 = 0.0;
            _455 = 0.0;
            _449 = 0.0;
            _425 = 0.0;
            _445 = 0.0;
            _375 = 0.0;
            _377 = 0.0;
            _379 = 0.0;
            _421 = 0.0;
            _403 = 0.0;
            _399 = 0.0;
        }
    }
    _681 = false;
    float _683 = _371;
    float _685 = _373;
    float _687 = _455;
    float _689 = _449;
    float _691 = _425;
    float _693 = _445;
    float _695 = _375;
    float _697 = _377;
    float _699 = _379;
    float _701 = _421;
    float _703 = _403;
    float _705 = _399;
    int _707 = _283 + 80;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.cp_c6)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.cp_c6)._m0[int(_719)][_721];
    int _725 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _727 = _725 + _66;
    int _729 = _283 + 64;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    uint _733 = uint(int(uint(int(_731)) >> uint(2)));
    int _735 = int(_731) & 3;
    float _737 = (*spvDescriptorSet0.cp_c6)._m0[int(_733)][_735];
    int _739 = int(_731) + 1;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    int _743 = _739 & 3;
    float _745 = (*spvDescriptorSet0.cp_c6)._m0[int(_741)][_743];
    int _747 = _283 + 88;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.cp_c6)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.cp_c6)._m0[int(_759)][_761];
    int _765 = _283 + 72;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.cp_c6)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.cp_c6)._m0[int(_777)][_779];
    int _783 = _283 + 96;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.cp_c6)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.cp_c6)._m0[int(_795)][_797];
    int _801 = _283 + 104;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.cp_c6)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.cp_c6)._m0[int(_813)][_815];
    float _819 = _683 * _715;
    float _821 = _685 * _715;
    float _823 = _687 * _715;
    int _825 = _283 + 16;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.cp_c6)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.cp_c6)._m0[int(_837)][_839];
    float _843 = fma(_689, _737, _819);
    float _845 = _683 * _723;
    float _847 = fma(_691, _737, _823);
    int _849 = _283 + 32;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    uint _853 = uint(int(uint(int(_851)) >> uint(2)));
    int _855 = int(_851) & 3;
    float _857 = (*spvDescriptorSet0.cp_c6)._m0[int(_853)][_855];
    int _859 = int(_851) + 1;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    int _863 = _859 & 3;
    float _865 = (*spvDescriptorSet0.cp_c6)._m0[int(_861)][_863];
    float _867 = fma(_693, _737, _821);
    float _869 = _687 * _723;
    float _871 = _685 * _723;
    float _873 = fma(_689, _745, _845);
    float _875 = _685 * _755;
    float _877 = _683 * _755;
    float _879 = _683 * _763;
    int _881 = _283 + 48;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    float _899 = fma(_691, _745, _869);
    float _901 = _687 * _755;
    float _903 = _685 * _763;
    float _905 = _687 * _763;
    float _907 = fma(_689, _773, _877);
    float _909 = fma(_689, _781, _879);
    float _911 = fma(_691, _773, _901);
    int _913 = _283 + 24;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    float _931 = fma(_693, _773, _875);
    float _933 = fma(_693, _781, _903);
    float _935 = fma(_691, _781, _905);
    float _937 = fma(_693, _745, _871);
    float _939 = fma(_695, _791, _843);
    float _941 = fma(_697, _791, _867);
    float _943 = fma(_699, _791, _847);
    int _945 = _283 + 40;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    uint _949 = uint(int(uint(int(_947)) >> uint(2)));
    int _951 = int(_947) & 3;
    float _953 = (*spvDescriptorSet0.cp_c6)._m0[int(_949)][_951];
    int _955 = int(_947) + 1;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    int _959 = _955 & 3;
    float _961 = (*spvDescriptorSet0.cp_c6)._m0[int(_957)][_959];
    float _963 = fma(_697, _799, _937);
    float _965 = fma(_695, _799, _873);
    float _967 = fma(_699, _799, _899);
    float _969 = fma(_695, _817, _909);
    float _971 = fma(_697, _817, _933);
    float _973 = fma(_699, _817, _935);
    int _975 = _283 + 56;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    uint _979 = uint(int(uint(int(_977)) >> uint(2)));
    int _981 = int(_977) & 3;
    float _983 = (*spvDescriptorSet0.cp_c6)._m0[int(_979)][_981];
    int _985 = int(_977) + 1;
    uint _987 = uint(int(uint(_985) >> uint(2)));
    int _989 = _985 & 3;
    float _991 = (*spvDescriptorSet0.cp_c6)._m0[int(_987)][_989];
    float _993 = _969 + _701;
    float _995 = fma(_697, _809, _931);
    float _997 = _971 + _703;
    float _999 = _973 + _705;
    float _1001 = fma(_695, _809, _907);
    float _1003 = fma(_699, _809, _911);
    float _1005 = _965 * _841;
    float _1007 = _993 * _841;
    float _1009 = _939 * _841;
    float _1011 = _1001 * _841;
    float _1013 = fma(_963, _833, _1005);
    float _1015 = fma(_997, _833, _1007);
    float _1017 = fma(_941, _833, _1009);
    float _1019 = fma(_995, _833, _1011);
    float _1021 = _965 * _865;
    float _1023 = _993 * _865;
    float _1025 = _939 * _865;
    float _1027 = _1001 * _865;
    float _1029 = fma(_963, _857, _1021);
    float _1031 = fma(_997, _857, _1023);
    float _1033 = fma(_941, _857, _1025);
    float _1035 = fma(_995, _857, _1027);
    float _1037 = _965 * _897;
    float _1039 = _993 * _897;
    float _1041 = _939 * _897;
    float _1043 = _1001 * _897;
    float _1045 = fma(_963, _889, _1037);
    float _1047 = fma(_997, _889, _1039);
    float _1049 = fma(_941, _889, _1041);
    float _1051 = fma(_995, _889, _1043);
    float _1053 = fma(_967, _921, _1013);
    int _1055 = _727 * 48;
    float _1057 = fma(_999, _921, _1015);
    float _1059 = fma(_943, _921, _1017);
    float _1061 = fma(_1003, _921, _1019);
    float _1063 = _1057 + _929;
    int _1065 = _1055 + 16;
    float _1067 = fma(_999, _953, _1031);
    float _1069 = fma(_943, _953, _1033);
    float _1071 = fma(_967, _953, _1029);
    float _1073 = fma(_1003, _953, _1035);
    float _1075 = _1067 + _961;
    int _1077 = _1055 + 32;
    uint _1079 = uint(int(uint(_1065) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1079)] = as_type<uint>(_1059);
    int _1081 = _1065 + 4;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1083)] = as_type<uint>(_1053);
    int _1085 = _1065 + 8;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1087)] = as_type<uint>(_1061);
    int _1089 = _1065 + 12;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1091)] = as_type<uint>(_1063);
    int _1093 = _1055 + 48;
    float _1095 = fma(_999, _983, _1047);
    float _1097 = fma(_943, _983, _1049);
    float _1099 = fma(_967, _983, _1045);
    float _1101 = fma(_1003, _983, _1051);
    float _1103 = _1095 + _991;
    uint _1105 = uint(int(uint(_1077) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1105)] = as_type<uint>(_1069);
    int _1107 = _1077 + 4;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1109)] = as_type<uint>(_1071);
    int _1111 = _1077 + 8;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1113)] = as_type<uint>(_1073);
    int _1115 = _1077 + 12;
    uint _1117 = uint(int(uint(_1115) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1117)] = as_type<uint>(_1075);
    uint _1119 = uint(int(uint(_1093) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1119)] = as_type<uint>(_1097);
    int _1121 = _1093 + 4;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1123)] = as_type<uint>(_1099);
    int _1125 = _1093 + 8;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1127)] = as_type<uint>(_1101);
    int _1129 = _1093 + 12;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1131)] = as_type<uint>(_1103);
}

