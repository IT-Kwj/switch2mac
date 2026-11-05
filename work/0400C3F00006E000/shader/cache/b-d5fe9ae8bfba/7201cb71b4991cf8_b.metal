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
    float _77 = 0.0;
    float _79 = 0.0;
    if (!_75)
    {
        int _81 = 0;
        int _83 = 0;
        int _85 = 0;
        int _87 = 0;
        int _89 = 0;
        int _91 = 0;
        int _93 = 0;
        bool _95;
        bool _171;
        do
        {
            int _97 = _81;
            int _99 = _83;
            int _101 = _85;
            int _103 = _87;
            int _105 = _89;
            float _107 = _77;
            int _109 = _91;
            int _111 = _93;
            bool _113 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
            int _115 = _97 + 1;
            bool _117 = _115 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
            bool _119 = !_113;
            _81 = _115;
            float _121 = _107;
            int _123 = _99;
            int _125 = _101;
            int _127 = _103;
            int _129 = _105;
            float _131 = _107;
            int _133 = _109;
            int _135 = _111;
            int _137 = _99;
            int _139 = _101;
            int _141 = _103;
            int _143 = _105;
            float _145 = _107;
            int _147 = _109;
            int _149 = _111;
            if (!_119)
            {
                float _151 = float(_97);
                int _153 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _155 = _153 + 1;
                bool _157 = _155 > 3;
                bool _159 = !_157;
                int _161 = 0;
                int _163 = 0;
                int _165 = -1;
                if (!_159)
                {
                    float _167 = fma(_151, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    int _169 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x) + (-3);
                    _165 = 0;
                    do
                    {
                        int _173 = _161;
                        float _175 = _121;
                        float _177 = float(_173);
                        int _179 = _173 + 1;
                        int _181 = _173 + 2;
                        float _183 = fma(_177, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _185 = float(_179);
                        int _187 = _173 + 3;
                        float _189 = float(_181);
                        float _191 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _672 = float2(_183, _167);
                        float3 _195 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_672, float2(0.0), isnan(_672)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_672, float2(0.0), isnan(_672)), level(0.0)).xyz;
                        float _197 = _195.x;
                        float _199 = _195.y;
                        float _201 = _195.z;
                        float _203 = float(_187);
                        float _205 = fma(_189, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _695 = float2(_191, _167);
                        float3 _207 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_695, float2(0.0), isnan(_695)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_695, float2(0.0), isnan(_695)), level(0.0)).xyz;
                        float _209 = _207.x;
                        float _211 = _207.y;
                        float _213 = _207.z;
                        float _215 = fma(_203, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _714 = float2(_205, _167);
                        float3 _217 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714)), level(0.0)).xyz;
                        float _219 = _217.x;
                        float _221 = _217.y;
                        float _223 = _217.z;
                        float2 _728 = float2(_215, _167);
                        float3 _225 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_728, float2(0.0), isnan(_728)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_728, float2(0.0), isnan(_728)), level(0.0)).xyz;
                        float _227 = _225.x;
                        float _229 = _225.y;
                        float _231 = _225.z;
                        int _233 = _173 + 4;
                        bool _235 = _233 >= _169;
                        float _237 = precise::max(_199, _197);
                        float _239 = precise::min(_199, _197);
                        float _241 = precise::max(_201, _237);
                        float _243 = precise::max(_211, _209);
                        float _245 = precise::min(_201, _239);
                        float _247 = _241 + 0.001000000047497451305389404296875;
                        float _249 = precise::max(_221, _219);
                        float _251 = precise::max(_213, _243);
                        float _253 = -_245;
                        float _255 = _241 + _253;
                        float _257 = precise::max(_223, _249);
                        float _259 = 1.0 / _247;
                        float _261 = precise::max(_229, _227);
                        float _263 = _251 + 0.001000000047497451305389404296875;
                        float _265 = precise::min(_211, _209);
                        float _267 = _257 + 0.001000000047497451305389404296875;
                        float _269 = precise::max(_231, _261);
                        float _271 = precise::min(_213, _265);
                        float _273 = 1.0 / _263;
                        float _275 = precise::min(_221, _219);
                        float _277 = _269 + 0.001000000047497451305389404296875;
                        float _279 = precise::min(_229, _227);
                        float _281 = -_271;
                        float _283 = _251 + _281;
                        float _285 = precise::min(_223, _275);
                        float _287 = precise::min(_231, _279);
                        float _289 = 1.0 / _267;
                        float _291 = fma(_255, _259, _175);
                        float _293 = -_285;
                        float _295 = _257 + _293;
                        float _297 = -_287;
                        float _299 = _269 + _297;
                        float _301 = 1.0 / _277;
                        float _303 = fma(_283, _273, _291);
                        float _305 = fma(_295, _289, _303);
                        float _307 = fma(_299, _301, _305);
                        _171 = !_235;
                        _161 = _233;
                        _121 = _307;
                        _123 = as_type<int>(_305);
                        _125 = as_type<int>(_289);
                        _127 = as_type<int>(_283);
                        _129 = as_type<int>(_223);
                        _131 = _307;
                        _163 = _233;
                        _133 = as_type<int>(_219);
                        _135 = as_type<int>(_303);
                    } while (_171);
                }
                int _309 = _123;
                int _311 = _125;
                int _313 = _127;
                int _315 = _129;
                float _317 = _131;
                int _319 = _163;
                int _321 = _133;
                int _323 = _135;
                int _325 = _165;
                int _327 = ~_319;
                int _329 = _327 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _331 = _329 + 1;
                bool _333 = _331 > 1;
                bool _335 = !_333;
                int _337 = _309;
                int _339 = _313;
                float _341 = _317;
                int _343 = _321;
                int _345 = _323;
                int _347 = _319;
                int _349 = _325;
                _139 = _311;
                _143 = _315;
                if (!_335)
                {
                    int _351 = _319 + 1;
                    float _353 = fma(_151, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _355 = float(_319);
                    float _357 = float(_351);
                    float _359 = fma(_355, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float _361 = fma(_357, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _926 = float2(_359, _353);
                    float3 _363 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_926, float2(0.0), isnan(_926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_926, float2(0.0), isnan(_926)), level(0.0)).xyz;
                    float _365 = _363.x;
                    float _367 = _363.y;
                    float _369 = _363.z;
                    float2 _940 = float2(_361, _353);
                    float3 _371 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_940, float2(0.0), isnan(_940)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_940, float2(0.0), isnan(_940)), level(0.0)).xyz;
                    float _373 = _371.x;
                    float _375 = _371.y;
                    float _377 = _371.z;
                    int _379 = _319 + 2;
                    float _381 = precise::max(_367, _365);
                    float _383 = precise::max(_375, _373);
                    float _385 = precise::max(_369, _381);
                    float _387 = precise::max(_377, _383);
                    float _389 = precise::min(_367, _365);
                    float _391 = _385 + 0.001000000047497451305389404296875;
                    float _393 = precise::min(_375, _373);
                    float _395 = _387 + 0.001000000047497451305389404296875;
                    float _397 = precise::min(_369, _389);
                    float _399 = precise::min(_377, _393);
                    float _401 = 1.0 / _391;
                    float _403 = -_397;
                    float _405 = _385 + _403;
                    float _407 = -_399;
                    float _409 = _387 + _407;
                    float _411 = 1.0 / _395;
                    float _413 = fma(_405, _401, _317);
                    float _415 = fma(_409, _411, _413);
                    _337 = as_type<int>(_401);
                    _339 = as_type<int>(_353);
                    _341 = _415;
                    _343 = as_type<int>(_413);
                    _345 = as_type<int>(_409);
                    _347 = _379;
                    _349 = 0;
                }
                int _417 = _337;
                int _419 = _339;
                float _421 = _341;
                int _423 = _343;
                int _425 = _345;
                int _427 = _347;
                int _429 = _349;
                bool _431 = _427 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _433 = (_431 ? (-1) : 0) | _429;
                int _435 = ~_433;
                _137 = _417;
                _141 = _419;
                _145 = _421;
                _147 = _423;
                _149 = _425;
                if (!(_435 != 0))
                {
                    float _437 = float(_427);
                    float _439 = fma(_151, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _441 = fma(_437, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _1056 = float2(_441, _439);
                    float3 _443 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1056, float2(0.0), isnan(_1056)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1056, float2(0.0), isnan(_1056)), level(0.0)).xyz;
                    float _445 = _443.x;
                    float _447 = _443.y;
                    float _449 = _443.z;
                    float _451 = precise::max(_445, _447);
                    float _453 = precise::min(_445, _447);
                    float _455 = precise::max(_449, _451);
                    float _457 = precise::min(_449, _453);
                    float _459 = _455 + 0.001000000047497451305389404296875;
                    float _461 = -_457;
                    float _463 = _455 + _461;
                    float _465 = 1.0 / _459;
                    float _467 = fma(_463, _465, _421);
                    _145 = _467;
                }
            }
            int _469 = _137;
            int _471 = _139;
            int _473 = _141;
            int _475 = _143;
            float _477 = _145;
            int _479 = _147;
            int _481 = _149;
            _95 = !_117;
            _83 = _469;
            _85 = _471;
            _87 = _473;
            _89 = _475;
            _77 = _477;
            _91 = _479;
            _93 = _481;
            _79 = _477;
        } while (_95);
    }
    float _483 = _79;
    int _485 = _61 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _487 = _485 + _53;
    float _489 = _483 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    int _491 = _487 << 2;
    uint _494 = uint(int(uint(_491) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_494)] = as_type<uint>(_489);
}

