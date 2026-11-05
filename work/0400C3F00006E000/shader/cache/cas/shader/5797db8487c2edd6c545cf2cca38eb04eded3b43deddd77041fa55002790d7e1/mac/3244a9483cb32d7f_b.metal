#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    constant _16* cp_c7 [[id(5)]];
    texture2d_array<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> cp_t_tcb_A [[id(10)]];
    sampler cp_t_tcb_ASmplr [[id(11)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(12)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(13)]];
    sampler cp_t_tcb_CSmplr_w [[id(14)]];
    sampler cp_t_tcb_8Smplr_w [[id(15)]];
    sampler cp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

static inline __attribute__((always_inline))
int _57(thread const int& _2184, thread const int& _2185, constant _10& support_buffer)
{
    int _2188 = 1 + _2185;
    float _2190 = support_buffer._m5[_2188].x;
    bool _2192 = _2190 == 1.0;
    if (_2192)
    {
        return _2184;
    }
    float _2194 = float(_2184);
    float _2196 = _2194 * _2190;
    int _2198 = int(_2196);
    return _2198;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _61 = as_type<float>(gl_WorkGroupID.z);
    float _63 = as_type<float>(gl_WorkGroupID.y);
    float _65 = as_type<float>(gl_LocalInvocationID.y);
    float _67 = as_type<float>(gl_LocalInvocationID.x);
    int _69 = as_type<int>(_61) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    float _71 = float(as_type<int>(_61));
    int _73 = _69 << 4;
    float _75 = as_type<float>(gl_WorkGroupID.x);
    float _77 = rint(_71);
    float _79 = precise::max(_77, 0.0);
    uint _82 = uint(_79);
    uint _84 = clamp(_82, 0u, 65535u);
    int _86 = _73 + 4;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    uint _90 = uint(int(uint(int(_88)) >> uint(2)));
    int _92 = int(_88) & 3;
    float _94 = (*spvDescriptorSet0.cp_c3)._m0[int(_90)][_92];
    int _96 = as_type<int>(_63) << 2;
    int _98 = _96 + as_type<int>(_65);
    float _100 = float(_98);
    float _102 = _100 + 0.5;
    int _104 = as_type<int>(_75) << 3;
    int _106 = _104 + as_type<int>(_67);
    float _108 = 1.0 / _94;
    float _110 = float(_106);
    float _112 = _110 + 0.5;
    float _114 = _102 * _108;
    float _116 = _112 * _108;
    float3 _1037 = float3(_116, _114, float(int(_84)));
    float3 _1041 = select(_1037, float3(0.0), isnan(_1037));
    float3 _120 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _1041.xy, uint(rint(_1041.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _1041.xy, uint(rint(_1041.z)), level(0.0)).xyw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    int _128 = _106;
    int _130 = 3;
    int _132 = _57(_128, _130, (*spvDescriptorSet0.support_buffer));
    int _134 = _98;
    int _136 = 3;
    int _138 = _57(_134, _136, (*spvDescriptorSet0.support_buffer));
    int3 _1060 = int3(_132, _138, as_type<int>(_61));
    float4 _141 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_1060.xy), uint(_1060.z)).xyzw);
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _141.w;
    int _151 = _73 + 12;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.cp_c3)._m0[int(_155)][_157];
    float _161 = _114 + (-0.5);
    float _163 = _116 + (-0.5);
    float _165 = _94 * _159;
    float _167 = fma(_165, _161, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _169 = fma(_165, _163, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _171 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _173 = _167 + _171;
    float _175 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _177 = _169 + _175;
    float _179 = _173 * _173;
    float _181 = fma(_177, _177, _179);
    bool _185 = _124 > 0.001000000047497451305389404296875;
    float _187 = 0.0;
    float _189 = 0.0;
    float _191 = _177;
    float _193 = _181;
    float _195 = _159;
    float _197 = _122;
    if (!_185)
    {
        _187 = 0.0;
        _189 = 0.0;
    }
    float _199 = _187;
    float _201 = _189;
    float _203 = 0.0;
    float _205 = _199;
    float _207 = _201;
    if (!_185)
    {
        _203 = 0.0;
    }
    float _209 = _203;
    bool _211 = !_185;
    float _213 = _209;
    if (!_211)
    {
        float _215 = sqrt(_181);
        float _217 = fma(_215, 0.00312500004656612873077392578125, -1.0);
        float _219 = precise::clamp(_217, 0.0, 1.0);
        float _221 = fma(_215, 0.001562500023283064365386962890625, -1.0);
        float _223 = precise::clamp(_221, 0.0, 1.0);
        float _225 = fma(_215, 0.0007812500116415321826934814453125, -1.0);
        float _227 = precise::clamp(_225, 0.0, 1.0);
        float _229 = fma(_215, 0.00039062500582076609134674072265625, -1.0);
        float _231 = precise::clamp(_229, 0.0, 1.0);
        float _233 = -_219;
        float _235 = _233 + 1.0;
        float _237 = -_223;
        float _239 = _237 + 1.0;
        float _241 = -_227;
        float _243 = _241 + 1.0;
        float _245 = -_231;
        float _247 = _245 + 1.0;
        bool _249 = _235 > 0.001000000047497451305389404296875;
        bool _251 = _239 > 0.001000000047497451305389404296875;
        bool _253 = _243 > 0.001000000047497451305389404296875;
        bool _255 = _247 > 0.001000000047497451305389404296875;
        float _257 = _231;
        float _259 = _215;
        float _261 = _219;
        if (_249)
        {
            float _263 = _167 * 0.015625;
            _257 = _263;
        }
        float _265 = _257;
        float _267 = 0.0;
        if (_249)
        {
            float _269 = _169 * 0.015625;
            _267 = _269;
        }
        float _271 = _267;
        float _273 = 0.0;
        if (_251)
        {
            float _275 = _167 * 0.0078125;
            _273 = _275;
        }
        float _277 = _273;
        float _279 = 0.0;
        if (_251)
        {
            float _281 = _169 * 0.0078125;
            _279 = _281;
        }
        float _283 = _279;
        float _285 = 0.0;
        if (_251)
        {
            _285 = 1.4012984643248170709237295832899e-45;
        }
        float _287 = _285;
        if (_253)
        {
            float _289 = _167 * 0.00390625;
            _259 = _289;
        }
        float _291 = _259;
        float _293 = _265;
        float _295 = 1.0;
        float _297 = 0.0;
        if (_249)
        {
            float3 _1253 = float3(_271, _265, float(0));
            float3 _1255 = select(_1253, float3(0.0), isnan(_1253));
            float3 _299 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1255.xy, uint(rint(_1255.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1255.xy, uint(rint(_1255.z)), level(0.0)).xyz;
            float _301 = _299.x;
            float _303 = _299.y;
            float _305 = _299.z;
            _293 = _301;
            _295 = _303;
            _297 = _305;
        }
        float _307 = _293;
        float _309 = _295;
        float _311 = _297;
        float _313 = 0.0;
        if (_253)
        {
            float _315 = _169 * 0.00390625;
            _313 = _315;
        }
        float _317 = _313;
        float _319 = 0.0;
        if (_253)
        {
            _319 = 2.8025969286496341418474591665798e-45;
        }
        float _321 = _319;
        float _323 = _277;
        float _325 = 0.0;
        float _327 = 0.0;
        if (_251)
        {
            float3 _1292 = float3(_283, _277, float(as_type<int>(_287)));
            float3 _1294 = select(_1292, float3(0.0), isnan(_1292));
            float3 _329 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1294.xy, uint(rint(_1294.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1294.xy, uint(rint(_1294.z)), level(0.0)).xyz;
            float _331 = _329.x;
            float _333 = _329.y;
            float _335 = _329.z;
            _323 = _331;
            _325 = _333;
            _327 = _335;
        }
        float _337 = _323;
        float _339 = _325;
        float _341 = _327;
        if (_255)
        {
            float _343 = _167 * 0.001953125;
            _261 = _343;
        }
        float _345 = _261;
        float _347 = 0.0;
        if (_255)
        {
            float _349 = _169 * 0.001953125;
            _347 = _349;
        }
        float _351 = _347;
        float _353 = _291;
        float _355 = _227;
        float _357 = 0.0;
        if (_253)
        {
            float3 _1335 = float3(_317, _291, float(as_type<int>(_321)));
            float3 _1337 = select(_1335, float3(0.0), isnan(_1335));
            float3 _359 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1337.xy, uint(rint(_1337.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1337.xy, uint(rint(_1337.z)), level(0.0)).xyz;
            float _361 = _359.x;
            float _363 = _359.y;
            float _365 = _359.z;
            _353 = _361;
            _355 = _363;
            _357 = _365;
        }
        float _367 = _353;
        float _369 = _355;
        float _371 = _357;
        float _373 = 0.0;
        if (_255)
        {
            _373 = 4.2038953929744512127711887498697e-45;
        }
        float _375 = _373;
        float _377 = _345;
        float _379 = _223;
        float _381 = 0.0;
        if (_255)
        {
            float3 _1368 = float3(_351, _345, float(as_type<int>(_375)));
            float3 _1370 = select(_1368, float3(0.0), isnan(_1368));
            float3 _383 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1370.xy, uint(rint(_1370.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1370.xy, uint(rint(_1370.z)), level(0.0)).xyz;
            float _385 = _383.x;
            float _387 = _383.y;
            float _389 = _383.z;
            _377 = _385;
            _379 = _387;
            _381 = _389;
        }
        float _391 = _377;
        float _393 = _379;
        float _395 = _381;
        float _397 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _399 = 1.0 / (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _401 = fma(_397, 0.3183098733425140380859375, 0.079577468335628509521484375);
        float _403 = _401 * 64.0;
        float _405 = _401 * 128.0;
        float _407 = _401 * 512.0;
        float _409 = _401 * 256.0;
        float _411 = 1.0 / _403;
        float _413 = _122 * 100.0;
        float _415 = _413 * _399;
        float _417 = precise::clamp(_415, 0.0, 1.0);
        float _419 = 1.0 / _405;
        float _421 = (*spvDescriptorSet0.cp_c6)._m0[0].x * 2.0;
        float _423 = fma(_417, -2.0, 3.0);
        float _425 = _417 * _417;
        float _427 = _423 * _425;
        float _429 = 1.0 / _409;
        float _431 = 1.0 / _407;
        float _433 = _421 * _411;
        float _435 = _421 * _419;
        float _437 = _433 * (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _439 = precise::clamp(_437, 0.0, 1.0);
        float _441 = _413 * _433;
        float _443 = precise::clamp(_441, 0.0, 1.0);
        float _445 = _413 * _435;
        float _447 = precise::clamp(_445, 0.0, 1.0);
        float _449 = _421 * _429;
        float _451 = -_439;
        float _453 = _451 + 1.0;
        float _455 = _435 * (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _457 = precise::clamp(_455, 0.0, 1.0);
        float _459 = -_443;
        float _461 = _459 + 1.0;
        float _463 = -_447;
        float _465 = _463 + 1.0;
        float _467 = _453 * (*spvDescriptorSet0.cp_c6)._m0[0].y;
        float _469 = -_457;
        float _471 = _469 + 1.0;
        float _473 = -_461;
        float _475 = fma(_473, (*spvDescriptorSet0.cp_c6)._m0[0].y, 1.0);
        float _477 = _421 * _431;
        float _479 = _413 * _449;
        float _481 = precise::clamp(_479, 0.0, 1.0);
        float _483 = _449 * (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _485 = precise::clamp(_483, 0.0, 1.0);
        float _487 = _413 * _467;
        float _489 = _413 * _477;
        float _491 = precise::clamp(_489, 0.0, 1.0);
        float _493 = _477 * (*spvDescriptorSet0.cp_c6)._m0[0].z;
        float _495 = precise::clamp(_493, 0.0, 1.0);
        float _497 = -_485;
        float _499 = _497 + 1.0;
        float _501 = _471 * (*spvDescriptorSet0.cp_c6)._m0[0].y;
        float _503 = -_491;
        float _505 = _503 + 1.0;
        float _507 = -_495;
        float _509 = _507 + 1.0;
        float _511 = -_487;
        float _513 = fma(_511, _399, 1.0);
        float _515 = _499 * (*spvDescriptorSet0.cp_c6)._m0[0].y;
        float _517 = _413 * _501;
        float _519 = _509 * (*spvDescriptorSet0.cp_c6)._m0[0].y;
        float _521 = -_465;
        float _523 = fma(_521, (*spvDescriptorSet0.cp_c6)._m0[0].y, 1.0);
        float _525 = -_505;
        float _527 = fma(_525, (*spvDescriptorSet0.cp_c6)._m0[0].y, 1.0);
        float _529 = -_481;
        float _531 = _529 + 1.0;
        float _533 = -_513;
        float _535 = _475 + _533;
        float _537 = _413 * _515;
        float _539 = -_517;
        float _541 = fma(_539, _399, 1.0);
        float _543 = _413 * _519;
        float _545 = -_531;
        float _547 = fma(_545, (*spvDescriptorSet0.cp_c6)._m0[0].y, 1.0);
        float _549 = fma(_427, _535, _513);
        float _551 = -_537;
        float _553 = fma(_551, _399, 1.0);
        float _555 = -_541;
        float _557 = _523 + _555;
        float _559 = -_543;
        float _561 = fma(_559, _399, 1.0);
        float _563 = _543;
        float _565 = _549;
        float _567 = _557;
        if (!_249)
        {
            _563 = 0.0;
        }
        float _569 = _563;
        float _571 = _569;
        if (_249)
        {
            float _573 = _549 * _235;
            _565 = _573;
        }
        float _575 = _565;
        float _577 = fma(_427, _557, _541);
        float _579 = _577;
        if (!_249)
        {
            _567 = 0.0;
        }
        float _581 = _567;
        float _583 = _581;
        if (_251)
        {
            float _585 = _577 * _239;
            _579 = _585;
        }
        float _587 = _579;
        float _589 = _309;
        float _591 = _339;
        float _593 = _369;
        float _595 = _393;
        _195 = _391;
        if (_249)
        {
            float _597 = _235 * _309;
            _589 = _597;
        }
        float _599 = _589;
        float _601 = _599;
        if (_249)
        {
            float _603 = _311 * _575;
            _583 = _603;
        }
        float _605 = _583;
        float _607 = _605;
        if (_251)
        {
            float _609 = _239 * _339;
            _591 = _609;
        }
        float _611 = _591;
        if (_249)
        {
            float _613 = _475 * _599;
            _571 = _613;
        }
        float _615 = _571;
        float _617 = -_553;
        float _619 = _547 + _617;
        float _621 = _615;
        if (!_249)
        {
            _601 = 0.0;
        }
        float _623 = _601;
        float _625 = _623;
        if (_249)
        {
            float _627 = _307 * _575;
            _625 = _627;
        }
        float _629 = _625;
        float _631 = _629;
        if (_251)
        {
            float _633 = fma(_523, _611, _615);
            _621 = _633;
        }
        float _635 = _621;
        float _637 = fma(_427, _619, _553);
        float _639 = _637;
        float _641 = _635;
        if (_253)
        {
            float _643 = _243 * _369;
            _593 = _643;
        }
        float _645 = _593;
        if (_251)
        {
            float _647 = fma(_341, _587, _605);
            _607 = _647;
        }
        float _649 = _607;
        float _651 = -_561;
        float _653 = _527 + _651;
        float _655 = _649;
        if (_253)
        {
            float _657 = _637 * _243;
            _639 = _657;
        }
        float _659 = _639;
        if (_251)
        {
            float _661 = fma(_337, _587, _629);
            _631 = _661;
        }
        float _663 = _631;
        float _665 = _663;
        if (_253)
        {
            float _667 = fma(_547, _645, _635);
            _641 = _667;
        }
        float _669 = _641;
        float _671 = fma(_427, _653, _561);
        float _673 = _671;
        if (_253)
        {
            float _675 = fma(_371, _659, _649);
            _655 = _675;
        }
        float _677 = _655;
        if (_253)
        {
            float _679 = fma(_367, _659, _663);
            _665 = _679;
        }
        float _681 = _665;
        float _683 = _681;
        if (_255)
        {
            float _685 = _247 * _393;
            _595 = _685;
        }
        float _687 = _595;
        float _689 = _669;
        _191 = _687;
        if (_255)
        {
            float _691 = _671 * _247;
            _673 = _691;
        }
        float _693 = _673;
        float _695 = _677;
        if (_255)
        {
            float _697 = fma(_527, _687, _669);
            _689 = _697;
        }
        float _699 = _689;
        if (_255)
        {
            float _701 = fma(_391, _693, _681);
            _683 = _701;
        }
        float _703 = _683;
        if (_255)
        {
            float _705 = fma(_395, _693, _677);
            _695 = _705;
        }
        float _707 = _695;
        float _709 = _124 * _699;
        float _711 = _124 * _703;
        float _713 = _124 * _707;
        _205 = _711;
        _213 = _713;
        _193 = _707;
        _207 = _709;
    }
    float _715 = _205;
    float _717 = _213;
    float _719 = _191;
    float _721 = _193;
    float _723 = _207;
    float _725 = _195;
    float _727 = _169 + _715;
    float _729 = _167 + _717;
    float _731 = -(*spvDescriptorSet0.cp_c4)._m0[0].x;
    float _733 = _727 + _731;
    float _735 = -(*spvDescriptorSet0.cp_c4)._m0[0].y;
    float _737 = _729 + _735;
    float _739 = fma(_733, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    float _741 = fma(_737, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    bool _743 = _739 >= 1.0;
    bool _745 = isnan(_739);
    bool _747 = _743 || _745;
    bool _749 = isnan(1.0);
    bool _751 = _747 || _749;
    bool _753 = _741 < 1.0;
    bool _755 = !_751;
    bool _757 = _753 && _755;
    bool _759 = _739 > 0.0;
    bool _761 = _759 && _757;
    bool _763 = _741 > 0.0;
    bool _765 = _763 && _761;
    float _767 = _721;
    float _769 = _719;
    float _771 = _725;
    float _773 = (*spvDescriptorSet0.cp_c4)._m0[1].w;
    if (!_765)
    {
        _767 = 0.0;
    }
    float _775 = _767;
    float _777 = _775;
    if (!_765)
    {
        _769 = 0.0;
        _771 = 0.0;
    }
    float _779 = _769;
    float _781 = _771;
    float _783 = _779;
    float _785 = _781;
    if (!_765)
    {
        _773 = 0.0;
    }
    float _787 = _773;
    bool _789 = !_765;
    float _791 = _787;
    if (!_789)
    {
        float _793 = _739 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _795 = _741 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _797 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _799 = _739 + _797;
        float _801 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _803 = _741 + _801;
        float2 _1971 = float2(_739, _741);
        float _805 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1971, float2(0.0), isnan(_1971)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1971, float2(0.0), isnan(_1971)), level(0.0)).x;
        float2 _1981 = float2(_793, _741);
        float _807 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1981, float2(0.0), isnan(_1981)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1981, float2(0.0), isnan(_1981)), level(0.0)).x;
        float2 _1989 = float2(_799, _741);
        float _809 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1989, float2(0.0), isnan(_1989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1989, float2(0.0), isnan(_1989)), level(0.0)).x;
        float2 _1997 = float2(_739, _795);
        float _811 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_1997, float2(0.0), isnan(_1997)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_1997, float2(0.0), isnan(_1997)), level(0.0)).x;
        float2 _2005 = float2(_739, _803);
        float _813 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2005, float2(0.0), isnan(_2005)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2005, float2(0.0), isnan(_2005)), level(0.0)).x;
        float _815 = _122 * 200.0;
        float _817 = (*spvDescriptorSet0.cp_c4)._m0[1].y * 2.0;
        float _819 = 1.0 / _817;
        float _821 = _815 * _819;
        float _823 = precise::clamp(_821, 0.0, 1.0);
        float _825 = fma(_823, 0.949999988079071044921875, 0.050000011920928955078125);
        float _827 = precise::max(0.0, _805);
        float _829 = _825 * _805;
        float _831 = -_809;
        float _833 = _807 + _831;
        float _835 = -_813;
        float _837 = _811 + _835;
        float _839 = _827 * (*spvDescriptorSet0.cp_c7)._m0[0].x;
        float _841 = _833 * 1.57079637050628662109375;
        float _843 = _837 * 1.57079637050628662109375;
        _777 = _841;
        _783 = _829;
        _791 = _843;
        _785 = _839;
        _197 = _825;
    }
    float _845 = _777;
    float _847 = _783;
    float _849 = _791;
    float _851 = _785;
    float _853 = _197;
    float _855 = _715 + _845;
    int _857 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[0].w) + (-1);
    float _859 = -_126;
    float _861 = _859 + 1.0;
    float _863 = _723 + _847;
    float _865 = _717 + _849;
    float _867 = _855 * _861;
    bool _869 = as_type<int>(_61) != _857;
    float _871 = _863 * _861;
    float _873 = _865 * _861;
    float _875 = _863;
    float _877 = _853;
    float _879 = _861;
    float _881 = _873;
    if (_869)
    {
        _875 = _867;
    }
    float _883 = _875;
    float _885 = _883;
    if (_869)
    {
        _877 = _871;
    }
    float _887 = _877;
    float _889 = _887;
    if (_869)
    {
        _879 = _851;
    }
    float _891 = _879;
    float _893 = _891;
    if (!_869)
    {
        float _895 = -_116;
        float _897 = _895 + 1.0;
        float _899 = -_114;
        float _901 = _899 + 1.0;
        float _903 = precise::min(_116, _897);
        float _905 = precise::min(_114, _901);
        float _907 = precise::min(_903, _905);
        float _909 = _907 * 10.0;
        float _911 = precise::clamp(_909, 0.0, 1.0);
        float _913 = _867 * _911;
        float _915 = _871 * _911;
        float _917 = _873 * _911;
        float _919 = _911 * _851;
        _885 = _913;
        _889 = _915;
        _881 = _917;
        _893 = _919;
    }
    float _921 = _885;
    float _923 = _889;
    float _925 = _881;
    float _927 = _893;
    float _929 = _143 + _921;
    float _931 = _145 + _923;
    float _933 = _147 + _925;
    float _935 = _149 + _927;
    int3 _2178 = int3(_106, _98, as_type<int>(_61));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_929, _931, _933, _935), uint2(_2178.xy), uint(_2178.z));
}

