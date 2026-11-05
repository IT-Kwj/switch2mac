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
    int _79 = -887581056;
    if (!_75)
    {
        int _81 = 0;
        int _83 = 0;
        int _85 = 0;
        int _87 = 0;
        int _89 = 0;
        int _91 = 0;
        int _93 = 0;
        int _95 = 0;
        bool _97;
        bool _179;
        do
        {
            int _99 = _81;
            int _101 = _83;
            int _103 = _85;
            int _105 = _87;
            float _107 = _77;
            int _109 = _89;
            int _111 = _91;
            int _113 = _93;
            int _115 = _95;
            bool _117 = 0 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
            int _119 = _99 + 1;
            bool _121 = _119 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
            bool _123 = !_117;
            _81 = _119;
            float _125 = _107;
            int _127 = _101;
            int _129 = _103;
            int _131 = _105;
            float _133 = _107;
            int _135 = _109;
            int _137 = _111;
            int _139 = _113;
            int _141 = _115;
            int _143 = _101;
            int _145 = _103;
            int _147 = _105;
            float _149 = _107;
            int _151 = _109;
            int _153 = _111;
            int _155 = _113;
            int _157 = _115;
            if (!_123)
            {
                float _159 = float(_99);
                int _161 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _163 = _161 + 1;
                bool _165 = _163 > 3;
                bool _167 = !_165;
                int _169 = 0;
                int _171 = 0;
                int _173 = -1;
                if (!_167)
                {
                    float _175 = fma(_159, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    int _177 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x) + (-3);
                    _137 = as_type<int>(_175);
                    _173 = 0;
                    do
                    {
                        int _181 = _169;
                        float _183 = _125;
                        int _185 = _181 + 1;
                        float _187 = float(_181);
                        float _189 = float(_185);
                        int _191 = _181 + 3;
                        float _193 = fma(_187, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        int _195 = _181 + 2;
                        float _197 = fma(_189, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _199 = float(_191);
                        float _201 = float(_195);
                        float2 _712 = float2(_193, _175);
                        float3 _205 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_712, float2(0.0), isnan(_712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_712, float2(0.0), isnan(_712)), level(0.0)).xyz;
                        float _207 = _205.x;
                        float _209 = _205.y;
                        float _211 = _205.z;
                        float _213 = fma(_199, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float _215 = fma(_201, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                        float2 _739 = float2(_197, _175);
                        float3 _217 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_739, float2(0.0), isnan(_739)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_739, float2(0.0), isnan(_739)), level(0.0)).xyz;
                        float _219 = _217.x;
                        float _221 = _217.y;
                        float _223 = _217.z;
                        float2 _753 = float2(_215, _175);
                        float3 _225 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_753, float2(0.0), isnan(_753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_753, float2(0.0), isnan(_753)), level(0.0)).xyz;
                        float _227 = _225.x;
                        float _229 = _225.y;
                        float _231 = _225.z;
                        float2 _767 = float2(_213, _175);
                        float3 _233 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_767, float2(0.0), isnan(_767)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_767, float2(0.0), isnan(_767)), level(0.0)).xyz;
                        float _235 = _233.x;
                        float _237 = _233.y;
                        float _239 = _233.z;
                        int _241 = _181 + 4;
                        bool _243 = _241 >= _177;
                        float _245 = precise::max(_209, _207);
                        float _247 = precise::max(_211, _245);
                        float _249 = precise::max(_221, _219);
                        float _251 = precise::min(_221, _219);
                        float _253 = _247 + 0.001000000047497451305389404296875;
                        float _255 = precise::max(_223, _249);
                        float _257 = precise::max(_229, _227);
                        float _259 = precise::max(_237, _235);
                        float _261 = _255 + 0.001000000047497451305389404296875;
                        float _263 = precise::max(_231, _257);
                        float _265 = 1.0 / _253;
                        float _267 = precise::min(_209, _207);
                        float _269 = precise::max(_239, _259);
                        float _271 = _263 + 0.001000000047497451305389404296875;
                        float _273 = precise::min(_211, _267);
                        float _275 = precise::min(_229, _227);
                        float _277 = 1.0 / _261;
                        float _279 = _269 + 0.001000000047497451305389404296875;
                        float _281 = precise::min(_223, _251);
                        float _283 = -_273;
                        float _285 = _247 + _283;
                        float _287 = precise::min(_231, _275);
                        float _289 = precise::min(_237, _235);
                        float _291 = -_281;
                        float _293 = _255 + _291;
                        float _295 = 1.0 / _271;
                        float _297 = _285 * _265;
                        float _299 = precise::min(_239, _289);
                        float _301 = -_287;
                        float _303 = _263 + _301;
                        float _305 = precise::max(_297, _183);
                        float _307 = -_299;
                        float _309 = _269 + _307;
                        float _311 = 1.0 / _279;
                        float _313 = _293 * _277;
                        float _315 = precise::max(_305, _313);
                        float _317 = _303 * _295;
                        float _319 = precise::max(_315, _317);
                        float _321 = _309 * _311;
                        float _323 = precise::max(_319, _321);
                        _179 = !_243;
                        _169 = _241;
                        _125 = _323;
                        _127 = as_type<int>(_269);
                        _129 = as_type<int>(_305);
                        _131 = as_type<int>(_231);
                        _133 = _323;
                        _171 = _241;
                        _135 = as_type<int>(_251);
                        _139 = as_type<int>(_281);
                        _141 = as_type<int>(_279);
                    } while (_179);
                }
                int _325 = _127;
                int _327 = _129;
                int _329 = _131;
                float _331 = _133;
                int _333 = _171;
                int _335 = _135;
                int _337 = _137;
                int _339 = _139;
                int _341 = _173;
                int _343 = _141;
                int _345 = ~_333;
                int _347 = _345 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _349 = _347 + 1;
                bool _351 = _349 > 1;
                bool _353 = !_351;
                int _355 = _325;
                int _357 = _329;
                float _359 = _331;
                int _361 = _335;
                int _363 = _337;
                int _365 = _339;
                int _367 = _333;
                int _369 = _341;
                int _371 = _343;
                _145 = _327;
                if (!_353)
                {
                    int _373 = _333 + 1;
                    float _375 = fma(_159, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _377 = float(_333);
                    float _379 = float(_373);
                    float _381 = fma(_377, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float _383 = fma(_379, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _975 = float2(_381, _375);
                    float3 _385 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_975, float2(0.0), isnan(_975)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_975, float2(0.0), isnan(_975)), level(0.0)).xyz;
                    float _387 = _385.x;
                    float _389 = _385.y;
                    float _391 = _385.z;
                    float2 _989 = float2(_383, _375);
                    float3 _393 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_989, float2(0.0), isnan(_989)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_989, float2(0.0), isnan(_989)), level(0.0)).xyz;
                    float _395 = _393.x;
                    float _397 = _393.y;
                    float _399 = _393.z;
                    int _401 = _333 + 2;
                    float _403 = precise::max(_389, _387);
                    float _405 = precise::max(_397, _395);
                    float _407 = precise::max(_391, _403);
                    float _409 = precise::max(_399, _405);
                    float _411 = precise::min(_389, _387);
                    float _413 = _407 + 0.001000000047497451305389404296875;
                    float _415 = precise::min(_397, _395);
                    float _417 = _409 + 0.001000000047497451305389404296875;
                    float _419 = precise::min(_391, _411);
                    float _421 = 1.0 / _413;
                    float _423 = precise::min(_399, _415);
                    float _425 = -_419;
                    float _427 = _407 + _425;
                    float _429 = -_423;
                    float _431 = _409 + _429;
                    float _433 = 1.0 / _417;
                    float _435 = _427 * _421;
                    float _437 = precise::max(_331, _435);
                    float _439 = _431 * _433;
                    float _441 = precise::max(_437, _439);
                    _355 = as_type<int>(_413);
                    _357 = as_type<int>(_417);
                    _359 = _441;
                    _361 = as_type<int>(_437);
                    _363 = as_type<int>(_431);
                    _365 = as_type<int>(_439);
                    _367 = _401;
                    _369 = 0;
                    _371 = as_type<int>(_407);
                }
                int _443 = _355;
                int _445 = _357;
                float _447 = _359;
                int _449 = _361;
                int _451 = _363;
                int _453 = _365;
                int _455 = _367;
                int _457 = _369;
                int _459 = _371;
                bool _461 = _455 < as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].x);
                int _463 = (_461 ? (-1) : 0) | _457;
                int _465 = ~_463;
                _143 = _443;
                _147 = _445;
                _149 = _447;
                _151 = _449;
                _153 = _451;
                _155 = _453;
                _157 = _459;
                if (!(_465 != 0))
                {
                    float _467 = float(_455);
                    float _469 = fma(_159, (*spvDescriptorSet0.cp_c3)._m0[4].y, _73);
                    float _471 = fma(_467, (*spvDescriptorSet0.cp_c3)._m0[4].x, _71);
                    float2 _1117 = float2(_471, _469);
                    float3 _473 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1117, float2(0.0), isnan(_1117)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1117, float2(0.0), isnan(_1117)), level(0.0)).xyz;
                    float _475 = _473.x;
                    float _477 = _473.y;
                    float _479 = _473.z;
                    float _481 = precise::max(_475, _477);
                    float _483 = precise::min(_475, _477);
                    float _485 = precise::max(_479, _481);
                    float _487 = precise::min(_479, _483);
                    float _489 = _485 + 0.001000000047497451305389404296875;
                    float _491 = -_487;
                    float _493 = _485 + _491;
                    float _495 = 1.0 / _489;
                    float _497 = _493 * _495;
                    float _499 = precise::max(_447, _497);
                    _149 = _499;
                    _157 = as_type<int>(_495);
                }
            }
            int _501 = _143;
            int _503 = _145;
            int _505 = _147;
            float _507 = _149;
            int _509 = _151;
            int _511 = _153;
            int _513 = _155;
            int _515 = _157;
            _97 = !_121;
            _83 = _501;
            _85 = _503;
            _87 = _505;
            _77 = _507;
            _89 = _509;
            _91 = _511;
            _93 = _513;
            _95 = _515;
            _79 = as_type<int>(_507);
        } while (_97);
    }
    int _517 = _79;
    int _519 = _61 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _521 = _519 + _53;
    int _523 = _521 << 2;
    uint _526 = uint(int(uint(_523) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_526)] = uint(_517);
}

