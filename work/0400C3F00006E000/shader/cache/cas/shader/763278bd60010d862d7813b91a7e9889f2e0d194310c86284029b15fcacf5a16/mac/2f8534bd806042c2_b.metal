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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _2958, thread const int& _2959, constant _10& support_buffer)
{
    int _2962 = 1 + _2959;
    float _2964 = support_buffer._m5[_2962].x;
    bool _2966 = _2964 == 1.0;
    if (_2966)
    {
        return _2958;
    }
    float _2968 = float(_2958);
    float _2970 = _2968 * _2964;
    int _2972 = int(_2970);
    return _2972;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _685 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.cp_c5)._m0[int(_75)][_77];
    int _81 = int(_73) + 1;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    int _85 = _81 & 3;
    float _87 = (*spvDescriptorSet0.cp_c5)._m0[int(_83)][_85];
    int _89 = _64;
    int _91 = 0;
    int _93 = _54(_89, _91, (*spvDescriptorSet0.support_buffer));
    int _95 = as_type<int>(_79);
    int _97 = 0;
    int _99 = _54(_95, _97, (*spvDescriptorSet0.support_buffer));
    int3 _1208 = int3(_93, _99, 1);
    float3 _103 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1208.xy), uint(_1208.z), 0).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    int _111 = _64;
    int _113 = 0;
    int _115 = _54(_111, _113, (*spvDescriptorSet0.support_buffer));
    int _117 = as_type<int>(_87);
    int _119 = 0;
    int _121 = _54(_117, _119, (*spvDescriptorSet0.support_buffer));
    int3 _1226 = int3(_115, _121, 1);
    float3 _123 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1226.xy), uint(_1226.z), 0).xyz;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    int _131 = _64;
    int _133 = 0;
    int _135 = _54(_131, _133, (*spvDescriptorSet0.support_buffer));
    int _137 = as_type<int>(_79);
    int _139 = 0;
    int _141 = _54(_137, _139, (*spvDescriptorSet0.support_buffer));
    int3 _1244 = int3(_135, _141, 0);
    float3 _143 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1244.xy), uint(_1244.z), 0).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    int _151 = _64;
    int _153 = 0;
    int _155 = _54(_151, _153, (*spvDescriptorSet0.support_buffer));
    int _157 = as_type<int>(_87);
    int _159 = 0;
    int _161 = _54(_157, _159, (*spvDescriptorSet0.support_buffer));
    int3 _1262 = int3(_155, _161, 0);
    float3 _163 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1262.xy), uint(_1262.z), 0).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    int _171 = _64;
    int _173 = 0;
    int _175 = _54(_171, _173, (*spvDescriptorSet0.support_buffer));
    int _177 = as_type<int>(_79);
    int _179 = 0;
    int _181 = _54(_177, _179, (*spvDescriptorSet0.support_buffer));
    int3 _1280 = int3(_175, _181, 2);
    float3 _183 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1280.xy), uint(_1280.z), 0).xyz;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    int _191 = _64;
    int _193 = 0;
    int _195 = _54(_191, _193, (*spvDescriptorSet0.support_buffer));
    int _197 = as_type<int>(_87);
    int _199 = 0;
    int _201 = _54(_197, _199, (*spvDescriptorSet0.support_buffer));
    int3 _1298 = int3(_195, _201, 2);
    float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1298.xy), uint(_1298.z), 0).xyz;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    int _211 = _70 + 16;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    uint _215 = uint(int(uint(int(_213)) >> uint(2)));
    int _217 = int(_213) & 3;
    float _219 = (*spvDescriptorSet0.cp_c5)._m0[int(_215)][_217];
    bool _221 = _64 != 0;
    float _223 = -_105;
    float _225 = _223 + _125;
    float _227 = -_109;
    float _229 = _227 + _129;
    float _231 = fma(_225, _219, _105);
    float _233 = -_107;
    float _235 = _233 + _127;
    float _237 = fma(_229, _219, _109);
    float _239 = _231 * 0.15915493667125701904296875;
    float _241 = fma(_235, _219, _107);
    float _243 = _237 * 0.15915493667125701904296875;
    float _245 = _239 * 6.283185482025146484375;
    float _247 = sin(_245);
    float _249 = _241 * 0.15915493667125701904296875;
    float _251 = -_145;
    float _253 = _251 + _165;
    float _255 = -_149;
    float _257 = _255 + _169;
    float _259 = fma(_253, _219, _145);
    float _261 = fma(_257, _219, _149);
    float _263 = _239 * 6.283185482025146484375;
    float _265 = cos(_263);
    float _267 = _243 * 6.283185482025146484375;
    float _269 = sin(_267);
    float _271 = _243 * 6.283185482025146484375;
    float _273 = cos(_271);
    float _275 = _249 * 6.283185482025146484375;
    float _277 = sin(_275);
    float _279 = _247 * _269;
    float _281 = _269 * _265;
    float _283 = _249 * 6.283185482025146484375;
    float _285 = cos(_283);
    float _287 = _265 * _273;
    float _289 = _247 * _273;
    float _291 = _247 * _277;
    float _293 = fma(_277, _287, _279);
    float _295 = -_289;
    float _297 = fma(_277, _281, _295);
    float _299 = _259 * _277;
    float _301 = fma(_269, _291, _287);
    float _303 = -_147;
    float _305 = _303 + _167;
    float _307 = -_189;
    float _309 = _307 + _209;
    float _311 = -_281;
    float _313 = fma(_273, _291, _311);
    float _315 = _247 * _285;
    float _317 = _285 * _259;
    float _319 = _265 * _285;
    float _321 = fma(_305, _219, _147);
    float _323 = fma(_309, _219, _189);
    float _325 = _273 * _317;
    float _327 = _269 * _317;
    float _329 = -_185;
    float _331 = _329 + _205;
    float _333 = -_187;
    float _335 = _333 + _207;
    float _337 = _321 * _313;
    float _339 = _321 * _315;
    float _341 = _261 * _319;
    float _343 = _261 * _293;
    float _345 = _321 * _301;
    float _347 = _261 * _297;
    int _349 = _64 * 48;
    float _351 = -_299;
    float _353 = _351 + (-0.0);
    float _355 = fma(_331, _219, _185);
    float _357 = fma(_335, _219, _187);
    int _359 = _64 * 112;
    float _361 = _335;
    float _363 = _207;
    float _365 = _187;
    float _367 = _185;
    float _369 = _265;
    float _371 = _205;
    float _373 = _257;
    float _375 = _345;
    float _377 = _337;
    float _379 = _347;
    float _381 = _343;
    float _383 = _341;
    if (!_221)
    {
        _361 = _323;
    }
    float _385 = _361;
    int _387 = _349 + 32;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    _37[int(_389)] = as_type<uint>(_353);
    int _391 = _349 + 36;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    _37[int(_393)] = as_type<uint>(_339);
    int _395 = _349 + 40;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    _37[int(_397)] = as_type<uint>(_341);
    int _399 = _349 + 44;
    uint _401 = uint(int(uint(_399) >> uint(2)));
    _37[int(_401)] = as_type<uint>(_323);
    float _403 = _385;
    if (!_221)
    {
        _363 = _355;
    }
    float _405 = _363;
    float _407 = _405;
    if (!_221)
    {
        _365 = _357;
    }
    float _409 = _365;
    uint _411 = uint(int(uint(_349) >> uint(2)));
    _37[int(_411)] = as_type<uint>(_325);
    int _413 = _349 + 4;
    uint _415 = uint(int(uint(_413) >> uint(2)));
    _37[int(_415)] = as_type<uint>(_337);
    int _417 = _349 + 8;
    uint _419 = uint(int(uint(_417) >> uint(2)));
    _37[int(_419)] = as_type<uint>(_343);
    int _421 = _349 + 12;
    uint _423 = uint(int(uint(_421) >> uint(2)));
    _37[int(_423)] = as_type<uint>(_355);
    float _425 = _409;
    if (!_221)
    {
        _367 = _353;
    }
    float _427 = _367;
    float _429 = _427;
    if (!_221)
    {
        _369 = _325;
    }
    float _431 = _369;
    int _433 = _349 + 16;
    uint _435 = uint(int(uint(_433) >> uint(2)));
    _37[int(_435)] = as_type<uint>(_327);
    int _437 = _349 + 20;
    uint _439 = uint(int(uint(_437) >> uint(2)));
    _37[int(_439)] = as_type<uint>(_345);
    int _441 = _349 + 24;
    uint _443 = uint(int(uint(_441) >> uint(2)));
    _37[int(_443)] = as_type<uint>(_347);
    int _445 = _349 + 28;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    _37[int(_447)] = as_type<uint>(_357);
    float _449 = _431;
    if (!_221)
    {
        _371 = _327;
    }
    float _451 = _371;
    float _453 = _451;
    if (!_221)
    {
        _373 = _339;
    }
    float _455 = _373;
    bool _457 = !_221;
    float _459 = _455;
    if (!_457)
    {
        bool _461 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _463 = !_461;
        if (!_463)
        {
            uint _465 = uint(int(uint(_359) >> uint(2)));
            uint _467 = uint(int(uint(int(_465)) >> uint(2)));
            int _469 = int(_465) & 3;
            float _471 = (*spvDescriptorSet0.cp_c6)._m0[int(_467)][_469];
            int _473 = as_type<int>(_471) * 48;
            int _475 = 0;
            bool _477;
            float _575;
            float _577;
            float _579;
            float _585;
            float _603;
            float _607;
            float _609;
            float _611;
            float _631;
            float _633;
            float _635;
            float _637;
            do
            {
                int _479 = _475;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _481 = uint(int(uint(_473) >> uint(2)));
                float _483 = as_type<float>(_37[int(_481)]);
                int _485 = _473 + 4;
                uint _487 = uint(int(uint(_485) >> uint(2)));
                float _489 = as_type<float>(_37[int(_487)]);
                int _491 = _473 + 8;
                uint _493 = uint(int(uint(_491) >> uint(2)));
                float _495 = as_type<float>(_37[int(_493)]);
                int _497 = _473 + 12;
                uint _499 = uint(int(uint(_497) >> uint(2)));
                float _501 = as_type<float>(_37[int(_499)]);
                int _503 = _479 + 1;
                int _505 = _473 + 16;
                uint _507 = uint(int(uint(_505) >> uint(2)));
                float _509 = as_type<float>(_37[int(_507)]);
                int _511 = _473 + 20;
                uint _513 = uint(int(uint(_511) >> uint(2)));
                float _515 = as_type<float>(_37[int(_513)]);
                int _517 = _473 + 24;
                uint _519 = uint(int(uint(_517) >> uint(2)));
                float _521 = as_type<float>(_37[int(_519)]);
                int _523 = _473 + 28;
                uint _525 = uint(int(uint(_523) >> uint(2)));
                float _527 = as_type<float>(_37[int(_525)]);
                bool _529 = uint(_503) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _531 = _473 + 32;
                uint _533 = uint(int(uint(_531) >> uint(2)));
                float _535 = as_type<float>(_37[int(_533)]);
                int _537 = _473 + 36;
                uint _539 = uint(int(uint(_537) >> uint(2)));
                float _541 = as_type<float>(_37[int(_539)]);
                int _543 = _473 + 40;
                uint _545 = uint(int(uint(_543) >> uint(2)));
                float _547 = as_type<float>(_37[int(_545)]);
                int _549 = _473 + 44;
                uint _551 = uint(int(uint(_549) >> uint(2)));
                float _553 = as_type<float>(_37[int(_551)]);
                float _555 = _357 * _489;
                float _557 = _327 * _489;
                float _559 = _345 * _489;
                float _561 = _347 * _489;
                float _563 = fma(_355, _483, _555);
                float _565 = fma(_325, _483, _557);
                float _567 = fma(_337, _483, _559);
                float _569 = fma(_343, _483, _561);
                float _571 = fma(_323, _495, _563);
                float _573 = -_299;
                _575 = fma(_573, _495, _565);
                _577 = fma(_339, _495, _567);
                _579 = fma(_341, _495, _569);
                float _581 = _357 * _515;
                float _583 = _327 * _515;
                _585 = _501 + _571;
                float _587 = _345 * _515;
                float _589 = _347 * _515;
                float _591 = fma(_355, _509, _581);
                float _593 = fma(_325, _509, _583);
                float _595 = fma(_337, _509, _587);
                float _597 = fma(_343, _509, _589);
                float _599 = fma(_323, _521, _591);
                float _601 = -_299;
                _603 = fma(_601, _521, _593);
                float _605 = _357 * _541;
                _607 = fma(_339, _521, _595);
                _609 = fma(_341, _521, _597);
                _611 = _527 + _599;
                float _613 = _327 * _541;
                float _615 = _345 * _541;
                float _617 = _347 * _541;
                float _619 = fma(_355, _535, _605);
                float _621 = fma(_325, _535, _613);
                float _623 = fma(_337, _535, _615);
                float _625 = fma(_343, _535, _617);
                float _627 = fma(_323, _547, _619);
                float _629 = -_299;
                _631 = fma(_629, _547, _621);
                _633 = fma(_339, _547, _623);
                _635 = fma(_341, _547, _625);
                _637 = _553 + _627;
                uint _639 = uint(int(uint(_349) >> uint(2)));
                _37[int(_639)] = as_type<uint>(_575);
                int _641 = _349 + 4;
                uint _643 = uint(int(uint(_641) >> uint(2)));
                _37[int(_643)] = as_type<uint>(_577);
                int _645 = _349 + 8;
                uint _647 = uint(int(uint(_645) >> uint(2)));
                _37[int(_647)] = as_type<uint>(_579);
                int _649 = _349 + 12;
                uint _651 = uint(int(uint(_649) >> uint(2)));
                _37[int(_651)] = as_type<uint>(_585);
                int _653 = _349 + 16;
                uint _655 = uint(int(uint(_653) >> uint(2)));
                _37[int(_655)] = as_type<uint>(_603);
                int _657 = _349 + 20;
                uint _659 = uint(int(uint(_657) >> uint(2)));
                _37[int(_659)] = as_type<uint>(_607);
                int _661 = _349 + 24;
                uint _663 = uint(int(uint(_661) >> uint(2)));
                _37[int(_663)] = as_type<uint>(_609);
                int _665 = _349 + 28;
                uint _667 = uint(int(uint(_665) >> uint(2)));
                _37[int(_667)] = as_type<uint>(_611);
                int _669 = _349 + 32;
                uint _671 = uint(int(uint(_669) >> uint(2)));
                _37[int(_671)] = as_type<uint>(_631);
                int _673 = _349 + 36;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                _37[int(_675)] = as_type<uint>(_633);
                int _677 = _349 + 40;
                uint _679 = uint(int(uint(_677) >> uint(2)));
                _37[int(_679)] = as_type<uint>(_635);
                int _681 = _349 + 44;
                uint _683 = uint(int(uint(_681) >> uint(2)));
                _37[int(_683)] = as_type<uint>(_637);
                _477 = !_529;
                _475 = _503;
            } while (_477);
            _375 = _607;
            _459 = _633;
            _377 = _577;
            _453 = _603;
            _429 = _631;
            _449 = _575;
            _379 = _609;
            _381 = _579;
            _383 = _635;
            _425 = _611;
            _403 = _637;
            _407 = _585;
            _685 = true;
        }
        else
        {
            _375 = 0.0;
            _459 = 0.0;
            _377 = 0.0;
            _453 = 0.0;
            _429 = 0.0;
            _449 = 0.0;
            _379 = 0.0;
            _381 = 0.0;
            _383 = 0.0;
            _425 = 0.0;
            _403 = 0.0;
            _407 = 0.0;
        }
    }
    _685 = false;
    float _687 = _375;
    float _689 = _459;
    float _691 = _377;
    float _693 = _453;
    float _695 = _429;
    float _697 = _449;
    float _699 = _379;
    float _701 = _381;
    float _703 = _383;
    float _705 = _425;
    float _707 = _403;
    float _709 = _407;
    int _711 = _359 + 80;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.cp_c6)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.cp_c6)._m0[int(_723)][_725];
    int _729 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _731 = _729 + _64;
    int _733 = _359 + 64;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.cp_c6)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.cp_c6)._m0[int(_745)][_747];
    int _751 = _731 * 48;
    int _753 = _359 + 88;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    uint _757 = uint(int(uint(int(_755)) >> uint(2)));
    int _759 = int(_755) & 3;
    float _761 = (*spvDescriptorSet0.cp_c6)._m0[int(_757)][_759];
    int _763 = int(_755) + 1;
    uint _765 = uint(int(uint(_763) >> uint(2)));
    int _767 = _763 & 3;
    float _769 = (*spvDescriptorSet0.cp_c6)._m0[int(_765)][_767];
    int _771 = _359 + 72;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    uint _775 = uint(int(uint(int(_773)) >> uint(2)));
    int _777 = int(_773) & 3;
    float _779 = (*spvDescriptorSet0.cp_c6)._m0[int(_775)][_777];
    int _781 = int(_773) + 1;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    int _785 = _781 & 3;
    float _787 = (*spvDescriptorSet0.cp_c6)._m0[int(_783)][_785];
    int _789 = _359 + 104;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.cp_c6)._m0[int(_793)][_795];
    int _799 = int(_791) + 1;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    int _803 = _799 & 3;
    float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
    int _807 = _359 + 96;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    uint _811 = uint(int(uint(int(_809)) >> uint(2)));
    int _813 = int(_809) & 3;
    float _815 = (*spvDescriptorSet0.cp_c6)._m0[int(_811)][_813];
    int _817 = int(_809) + 1;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    int _821 = _817 & 3;
    float _823 = (*spvDescriptorSet0.cp_c6)._m0[int(_819)][_821];
    float _825 = _687 * _719;
    float _827 = _689 * _719;
    int _829 = _359 + 16;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    uint _833 = uint(int(uint(int(_831)) >> uint(2)));
    int _835 = int(_831) & 3;
    float _837 = (*spvDescriptorSet0.cp_c6)._m0[int(_833)][_835];
    int _839 = int(_831) + 1;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    int _843 = _839 & 3;
    float _845 = (*spvDescriptorSet0.cp_c6)._m0[int(_841)][_843];
    float _847 = _691 * _719;
    float _849 = fma(_693, _741, _825);
    float _851 = fma(_695, _741, _827);
    float _853 = _691 * _727;
    float _855 = _687 * _727;
    float _857 = _689 * _727;
    int _859 = _359 + 32;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    uint _863 = uint(int(uint(int(_861)) >> uint(2)));
    int _865 = int(_861) & 3;
    float _867 = (*spvDescriptorSet0.cp_c6)._m0[int(_863)][_865];
    int _869 = int(_861) + 1;
    uint _871 = uint(int(uint(_869) >> uint(2)));
    int _873 = _869 & 3;
    float _875 = (*spvDescriptorSet0.cp_c6)._m0[int(_871)][_873];
    float _877 = fma(_697, _749, _853);
    float _879 = fma(_693, _749, _855);
    float _881 = fma(_695, _749, _857);
    float _883 = _691 * _761;
    float _885 = _691 * _769;
    float _887 = _687 * _761;
    float _889 = _689 * _761;
    int _891 = _359 + 48;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    uint _895 = uint(int(uint(int(_893)) >> uint(2)));
    int _897 = int(_893) & 3;
    float _899 = (*spvDescriptorSet0.cp_c6)._m0[int(_895)][_897];
    int _901 = int(_893) + 1;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    int _905 = _901 & 3;
    float _907 = (*spvDescriptorSet0.cp_c6)._m0[int(_903)][_905];
    float _909 = _687 * _769;
    float _911 = _689 * _769;
    float _913 = fma(_693, _779, _887);
    float _915 = fma(_697, _779, _883);
    float _917 = fma(_697, _787, _885);
    float _919 = fma(_693, _787, _909);
    float _921 = fma(_695, _779, _889);
    int _923 = _359 + 24;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    uint _927 = uint(int(uint(int(_925)) >> uint(2)));
    int _929 = int(_925) & 3;
    float _931 = (*spvDescriptorSet0.cp_c6)._m0[int(_927)][_929];
    int _933 = int(_925) + 1;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    int _937 = _933 & 3;
    float _939 = (*spvDescriptorSet0.cp_c6)._m0[int(_935)][_937];
    float _941 = fma(_695, _787, _911);
    float _943 = fma(_697, _741, _847);
    float _945 = fma(_699, _805, _919);
    float _947 = fma(_701, _805, _917);
    float _949 = fma(_703, _805, _941);
    float _951 = fma(_701, _797, _915);
    float _953 = _945 + _705;
    int _955 = _359 + 40;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.cp_c6)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.cp_c6)._m0[int(_967)][_969];
    float _973 = _949 + _707;
    float _975 = _947 + _709;
    float _977 = fma(_701, _823, _877);
    float _979 = fma(_701, _815, _943);
    float _981 = fma(_699, _823, _879);
    float _983 = fma(_699, _815, _849);
    float _985 = fma(_699, _797, _913);
    int _987 = _359 + 56;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.cp_c6)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.cp_c6)._m0[int(_999)][_1001];
    float _1005 = fma(_703, _815, _851);
    float _1007 = fma(_703, _823, _881);
    float _1009 = fma(_703, _797, _921);
    float _1011 = _953 * _845;
    float _1013 = _981 * _845;
    float _1015 = _983 * _845;
    float _1017 = _985 * _845;
    float _1019 = fma(_975, _837, _1011);
    float _1021 = fma(_977, _837, _1013);
    float _1023 = fma(_979, _837, _1015);
    float _1025 = fma(_951, _837, _1017);
    float _1027 = _953 * _875;
    float _1029 = _983 * _875;
    float _1031 = _981 * _875;
    float _1033 = _985 * _875;
    float _1035 = fma(_975, _867, _1027);
    float _1037 = fma(_979, _867, _1029);
    float _1039 = fma(_977, _867, _1031);
    float _1041 = fma(_951, _867, _1033);
    float _1043 = _953 * _907;
    float _1045 = _983 * _907;
    float _1047 = _981 * _907;
    float _1049 = _985 * _907;
    float _1051 = fma(_975, _899, _1043);
    float _1053 = fma(_979, _899, _1045);
    float _1055 = fma(_977, _899, _1047);
    float _1057 = fma(_951, _899, _1049);
    float _1059 = fma(_973, _931, _1019);
    float _1061 = fma(_1007, _931, _1021);
    float _1063 = fma(_1005, _931, _1023);
    float _1065 = fma(_1009, _931, _1025);
    float _1067 = _1059 + _939;
    int _1069 = _751 + 16;
    float _1071 = fma(_973, _963, _1035);
    float _1073 = fma(_1005, _963, _1037);
    float _1075 = fma(_1007, _963, _1039);
    float _1077 = fma(_1009, _963, _1041);
    float _1079 = _1071 + _971;
    uint _1081 = uint(int(uint(_1069) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1081)] = as_type<uint>(_1063);
    int _1083 = _1069 + 4;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1085)] = as_type<uint>(_1061);
    int _1087 = _1069 + 8;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1089)] = as_type<uint>(_1065);
    int _1091 = _1069 + 12;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1093)] = as_type<uint>(_1067);
    float _1095 = fma(_973, _995, _1051);
    int _1097 = _751 + 32;
    float _1099 = fma(_1005, _995, _1053);
    float _1101 = fma(_1007, _995, _1055);
    float _1103 = fma(_1009, _995, _1057);
    float _1105 = _1095 + _1003;
    int _1107 = _751 + 48;
    uint _1109 = uint(int(uint(_1097) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1109)] = as_type<uint>(_1073);
    int _1111 = _1097 + 4;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1113)] = as_type<uint>(_1075);
    int _1115 = _1097 + 8;
    uint _1117 = uint(int(uint(_1115) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1117)] = as_type<uint>(_1077);
    int _1119 = _1097 + 12;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1121)] = as_type<uint>(_1079);
    uint _1123 = uint(int(uint(_1107) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1123)] = as_type<uint>(_1099);
    int _1125 = _1107 + 4;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1127)] = as_type<uint>(_1101);
    int _1129 = _1107 + 8;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1131)] = as_type<uint>(_1103);
    int _1133 = _1107 + 12;
    uint _1135 = uint(int(uint(_1133) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1135)] = as_type<uint>(_1105);
}

