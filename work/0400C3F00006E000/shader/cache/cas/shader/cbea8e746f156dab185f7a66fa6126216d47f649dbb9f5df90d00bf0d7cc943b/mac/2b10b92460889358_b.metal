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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _42 = as_type<float>(gl_WorkGroupID.x);
    float _44 = as_type<float>(gl_LocalInvocationID.x);
    float _46 = as_type<float>(gl_WorkGroupID.y);
    float _48 = as_type<float>(gl_LocalInvocationID.y);
    int _51 = as_type<int>(_42) * 16;
    int _53 = _51 + as_type<int>(_44);
    bool _57 = _53 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _59 = as_type<int>(_46) * 16;
    int _61 = _59 + as_type<int>(_48);
    if (_57)
    {
        return;
    }
    bool _63 = _61 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    if (_63)
    {
        return;
    }
    bool _65 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    float _67 = float(uint(_53));
    float _69 = float(uint(_61));
    float _71 = fma(_67, (*spvDescriptorSet0.cp_c3)._m0[1].x, (*spvDescriptorSet0.cp_c3)._m0[1].z);
    float _73 = fma(_69, (*spvDescriptorSet0.cp_c3)._m0[1].y, (*spvDescriptorSet0.cp_c3)._m0[1].w);
    bool _75 = !_65;
    float _77 = -10000000.0;
    float _79 = 10000000.0;
    float _81 = 10000000.0;
    float _83 = -10000000.0;
    if (!_75)
    {
        int _85 = 0;
        int _87 = 0;
        int _89 = 0;
        int _91 = 0;
        int _93 = 0;
        int _95 = 0;
        int _97 = 0;
        int _99 = 0;
        int _101 = 0;
        bool _103;
        bool _199;
        do
        {
            int _105 = _85;
            int _107 = _87;
            int _109 = _89;
            int _111 = _91;
            int _113 = _93;
            float _115 = _77;
            float _117 = _79;
            int _119 = _95;
            int _121 = _97;
            int _123 = _99;
            int _125 = _101;
            bool _127 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
            int _129 = _105 + 1;
            bool _131 = _129 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
            bool _133 = !_127;
            _85 = _129;
            float _135 = _115;
            float _137 = _117;
            int _139 = _107;
            int _141 = _109;
            int _143 = _111;
            int _145 = _113;
            float _147 = _115;
            float _149 = _117;
            int _151 = _119;
            int _153 = _121;
            int _155 = _123;
            int _157 = _125;
            int _159 = _107;
            int _161 = _109;
            int _163 = _111;
            int _165 = _113;
            float _167 = _115;
            float _169 = _117;
            int _171 = _119;
            int _173 = _121;
            int _175 = _123;
            int _177 = _125;
            if (!_133)
            {
                float _179 = float(_105);
                int _181 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _183 = _181 + 1;
                bool _185 = _183 > 3;
                bool _187 = !_185;
                int _189 = 0;
                int _191 = 0;
                int _193 = -1;
                if (!_187)
                {
                    float _195 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    int _197 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x) + (-3);
                    _155 = as_type<int>(_195);
                    _193 = 0;
                    do
                    {
                        int _201 = _189;
                        float _203 = _135;
                        float _205 = _137;
                        int _207 = _201 + 1;
                        float _209 = float(_201);
                        int _211 = _201 + 3;
                        float _213 = float(_207);
                        float _215 = fma(_209, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        int _217 = _201 + 2;
                        float _219 = float(_211);
                        float _221 = fma(_213, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _223 = float(_217);
                        float _225 = fma(_219, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _783 = float2(_215, _195);
                        float3 _229 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_783, float2(0.0), isnan(_783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_783, float2(0.0), isnan(_783)), level(0.0)).xyz;
                        float _231 = _229.x;
                        float _233 = _229.y;
                        float _235 = _229.z;
                        float _237 = fma(_223, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _805 = float2(_221, _195);
                        float3 _239 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_805, float2(0.0), isnan(_805)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_805, float2(0.0), isnan(_805)), level(0.0)).xyz;
                        float _241 = _239.x;
                        float _243 = _239.y;
                        float _245 = _239.z;
                        float2 _819 = float2(_237, _195);
                        float3 _247 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_819, float2(0.0), isnan(_819)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_819, float2(0.0), isnan(_819)), level(0.0)).xyz;
                        float _249 = _247.x;
                        float _251 = _247.y;
                        float _253 = _247.z;
                        float2 _833 = float2(_225, _195);
                        float3 _255 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_833, float2(0.0), isnan(_833)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_833, float2(0.0), isnan(_833)), level(0.0)).xyz;
                        float _257 = _255.x;
                        float _259 = _255.y;
                        float _261 = _255.z;
                        int _263 = _201 + 4;
                        bool _265 = _263 >= _197;
                        float _267 = precise::max(_233, _231);
                        float _269 = precise::min(_233, _231);
                        float _271 = precise::max(_235, _267);
                        float _273 = precise::max(_243, _241);
                        float _275 = precise::max(_251, _249);
                        float _277 = _271 + 0.001000000047497451305389404296875;
                        float _279 = precise::max(_245, _273);
                        float _281 = precise::max(_253, _275);
                        float _283 = precise::max(_259, _257);
                        float _285 = _279 + 0.001000000047497451305389404296875;
                        float _287 = 1.0 / _277;
                        float _289 = _281 + 0.001000000047497451305389404296875;
                        float _291 = precise::max(_261, _283);
                        float _293 = precise::min(_235, _269);
                        float _295 = precise::min(_243, _241);
                        float _297 = _291 + 0.001000000047497451305389404296875;
                        float _299 = 1.0 / _285;
                        float _301 = precise::min(_251, _249);
                        float _303 = -_293;
                        float _305 = _271 + _303;
                        float _307 = precise::min(_245, _295);
                        float _309 = precise::min(_253, _301);
                        float _311 = precise::min(_259, _257);
                        float _313 = 1.0 / _289;
                        float _315 = _305 * _287;
                        float _317 = -_307;
                        float _319 = _279 + _317;
                        float _321 = precise::min(_261, _311);
                        float _323 = -_309;
                        float _325 = _281 + _323;
                        float _327 = precise::max(_315, _203);
                        float _329 = 1.0 / _297;
                        float _331 = _319 * _299;
                        float _333 = precise::min(_315, _205);
                        float _335 = -_321;
                        float _337 = _291 + _335;
                        float _339 = precise::max(_327, _331);
                        float _341 = _325 * _313;
                        float _343 = precise::min(_333, _331);
                        float _345 = precise::max(_339, _341);
                        float _347 = precise::min(_343, _341);
                        float _349 = _337 * _329;
                        float _351 = precise::max(_345, _349);
                        float _353 = precise::min(_347, _349);
                        _199 = !_265;
                        _189 = _263;
                        _135 = _351;
                        _137 = _353;
                        _139 = as_type<int>(_305);
                        _141 = as_type<int>(_331);
                        _143 = as_type<int>(_325);
                        _145 = as_type<int>(_337);
                        _147 = _351;
                        _149 = _353;
                        _191 = _263;
                        _151 = as_type<int>(_297);
                        _153 = as_type<int>(_301);
                        _157 = as_type<int>(_279);
                    } while (_199);
                }
                int _355 = _139;
                int _357 = _141;
                int _359 = _143;
                int _361 = _145;
                float _363 = _147;
                float _365 = _149;
                int _367 = _191;
                int _369 = _151;
                int _371 = _153;
                int _373 = _155;
                int _375 = _157;
                int _377 = _193;
                int _379 = ~_367;
                int _381 = _379 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _383 = _381 + 1;
                bool _385 = _383 > 1;
                bool _387 = !_385;
                int _389 = _357;
                int _391 = _359;
                int _393 = _361;
                float _395 = _363;
                float _397 = _365;
                int _399 = _369;
                int _401 = _371;
                int _403 = _373;
                int _405 = _375;
                int _407 = _367;
                int _409 = _377;
                _159 = _355;
                if (!_387)
                {
                    int _411 = _367 + 1;
                    float _413 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _415 = float(_367);
                    float _417 = float(_411);
                    float _419 = fma(_415, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float _421 = fma(_417, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _1061 = float2(_419, _413);
                    float3 _423 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1061, float2(0.0), isnan(_1061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1061, float2(0.0), isnan(_1061)), level(0.0)).xyz;
                    float _425 = _423.x;
                    float _427 = _423.y;
                    float _429 = _423.z;
                    float2 _1075 = float2(_421, _413);
                    float3 _431 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1075, float2(0.0), isnan(_1075)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1075, float2(0.0), isnan(_1075)), level(0.0)).xyz;
                    float _433 = _431.x;
                    float _435 = _431.y;
                    float _437 = _431.z;
                    int _439 = _367 + 2;
                    float _441 = precise::max(_427, _425);
                    float _443 = precise::max(_435, _433);
                    float _445 = precise::max(_429, _441);
                    float _447 = precise::max(_437, _443);
                    float _449 = precise::min(_427, _425);
                    float _451 = _445 + 0.001000000047497451305389404296875;
                    float _453 = precise::min(_435, _433);
                    float _455 = _447 + 0.001000000047497451305389404296875;
                    float _457 = precise::min(_429, _449);
                    float _459 = 1.0 / _451;
                    float _461 = precise::min(_437, _453);
                    float _463 = -_457;
                    float _465 = _445 + _463;
                    float _467 = -_461;
                    float _469 = _447 + _467;
                    float _471 = 1.0 / _455;
                    float _473 = _465 * _459;
                    float _475 = precise::max(_363, _473);
                    float _477 = precise::min(_365, _473);
                    float _479 = _469 * _471;
                    float _481 = precise::max(_475, _479);
                    float _483 = precise::min(_477, _479);
                    _389 = as_type<int>(_455);
                    _391 = as_type<int>(_447);
                    _393 = as_type<int>(_479);
                    _395 = _481;
                    _397 = _483;
                    _399 = as_type<int>(_473);
                    _401 = as_type<int>(_433);
                    _403 = as_type<int>(_459);
                    _405 = as_type<int>(_471);
                    _407 = _439;
                    _409 = 0;
                }
                int _485 = _389;
                int _487 = _391;
                int _489 = _393;
                float _491 = _395;
                float _493 = _397;
                int _495 = _399;
                int _497 = _401;
                int _499 = _403;
                int _501 = _405;
                int _503 = _407;
                int _505 = _409;
                bool _507 = _503 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _509 = (_507 ? (-1) : 0) | _505;
                int _511 = ~_509;
                _161 = _485;
                _163 = _487;
                _165 = _489;
                _167 = _491;
                _169 = _493;
                _171 = _495;
                _173 = _497;
                _175 = _499;
                _177 = _501;
                if (!(_511 != 0))
                {
                    float _513 = float(_503);
                    float _515 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _517 = fma(_513, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _1216 = float2(_517, _515);
                    float3 _519 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1216, float2(0.0), isnan(_1216)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1216, float2(0.0), isnan(_1216)), level(0.0)).xyz;
                    float _521 = _519.x;
                    float _523 = _519.y;
                    float _525 = _519.z;
                    float _527 = precise::max(_521, _523);
                    float _529 = precise::min(_521, _523);
                    float _531 = precise::max(_525, _527);
                    float _533 = precise::min(_525, _529);
                    float _535 = _531 + 0.001000000047497451305389404296875;
                    float _537 = -_533;
                    float _539 = _531 + _537;
                    float _541 = 1.0 / _535;
                    float _543 = _539 * _541;
                    float _545 = precise::max(_491, _543);
                    float _547 = precise::min(_493, _543);
                    _167 = _545;
                    _169 = _547;
                    _171 = as_type<int>(_541);
                    _173 = as_type<int>(_531);
                }
            }
            int _549 = _159;
            int _551 = _161;
            int _553 = _163;
            int _555 = _165;
            float _557 = _167;
            float _559 = _169;
            int _561 = _171;
            int _563 = _173;
            int _565 = _175;
            int _567 = _177;
            _103 = !_131;
            _87 = _549;
            _89 = _551;
            _91 = _553;
            _93 = _555;
            _77 = _557;
            _79 = _559;
            _95 = _561;
            _97 = _563;
            _99 = _565;
            _101 = _567;
            _81 = _559;
            _83 = _557;
        } while (_103);
    }
    float _569 = _81;
    float _571 = _83;
    int _573 = _61 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _575 = _573 + _53;
    float _577 = -_569;
    float _579 = _577 + _571;
    int _581 = _575 << 2;
    uint _584 = uint(int(uint(_581) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_584)] = as_type<uint>(_579);
}

