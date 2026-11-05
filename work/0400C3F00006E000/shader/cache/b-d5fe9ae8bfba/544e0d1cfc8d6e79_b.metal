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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
    float4 m_25 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_23.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_25.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_25.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_27.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _37;
    float _71 = _69 * _43;
    float _73 = _69 * _67;
    float _75 = _71 * 0.15915493667125701904296875;
    float _77 = _69 * _49;
    float _79 = _75 * 6.283185482025146484375;
    float _81 = cos(_79);
    float _83 = _77 * 0.15915493667125701904296875;
    float _85 = _69 * _55;
    float _87 = _85 * 0.15915493667125701904296875;
    float _89 = _69 * _61;
    float _91 = _83 * 6.283185482025146484375;
    float _93 = cos(_91);
    float _95 = _89 * 0.15915493667125701904296875;
    float _97 = _87 * 6.283185482025146484375;
    float _99 = sin(_97);
    float _101 = _81 * _81;
    float _103 = _95 * 6.283185482025146484375;
    float _105 = cos(_103);
    float _107 = _101 * _93;
    float _109 = _99 * 0.0199999995529651641845703125;
    float _111 = _107 * _105;
    float _113 = fma(_111, 0.5, _109);
    float _115 = in.m_27.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _113 * 16.0;
    float _123 = floor(_121);
    float _125 = -_123;
    float _127 = _121 + _125;
    float _129 = _127 * 2.0;
    bool _133 = _129 >= 1.0;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = _69 * _119;
    int _146 = as_type<int>(_87);
    int _148 = as_type<int>(_55);
    int _150 = 1;
    int _152 = as_type<int>(_119);
    int _154 = 16;
    if (_141)
    {
        float2 _534 = float2(_143, _73);
        float4 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_534, float2(0.0), isnan(_534)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_534, float2(0.0), isnan(_534)), int2(1, 0)).xyzw;
        float _159 = _157.x;
        float _161 = _157.y;
        float _163 = _157.z;
        float _165 = _157.w;
        _146 = as_type<int>(_159);
        _148 = as_type<int>(_161);
        _150 = as_type<int>(_163);
        _152 = as_type<int>(_165);
    }
    int _167 = _146;
    int _169 = _148;
    int _171 = _150;
    int _173 = _152;
    int _175 = as_type<int>(_121);
    int _177 = as_type<int>(_129);
    int _179 = as_type<int>(_75);
    int _181 = as_type<int>(_95);
    if (!_141)
    {
        float2 _579 = float2(_143, _73);
        float4 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_579, float2(0.0), isnan(_579))).xyzw;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float _191 = _183.w;
        _175 = as_type<int>(_185);
        _177 = as_type<int>(_187);
        _179 = as_type<int>(_189);
        _181 = as_type<int>(_191);
    }
    int _193 = _175;
    int _195 = _177;
    int _197 = _179;
    int _199 = _181;
    int _201 = 0;
    int _203 = 0;
    int _205 = 0;
    if (!_141)
    {
        float2 _611 = float2(_143, _73);
        float4 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611)), int2(0, 1)).xyzw;
        float _209 = _207.x;
        float _211 = _207.y;
        float _213 = _207.z;
        float _215 = _207.w;
        _201 = as_type<int>(_209);
        _203 = as_type<int>(_211);
        _154 = as_type<int>(_213);
        _205 = as_type<int>(_215);
    }
    int _217 = _201;
    int _219 = _203;
    int _221 = _154;
    int _223 = _205;
    int _225 = 0;
    int _227 = 0;
    int _229 = 17;
    int _231 = 0;
    if (_141)
    {
        float2 _644 = float2(_143, _73);
        float4 _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_644, float2(0.0), isnan(_644)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_644, float2(0.0), isnan(_644)), int2(1)).xyzw;
        float _235 = _233.x;
        float _237 = _233.y;
        float _239 = _233.z;
        float _241 = _233.w;
        _225 = as_type<int>(_235);
        _227 = as_type<int>(_237);
        _229 = as_type<int>(_239);
        _231 = as_type<int>(_241);
    }
    int _243 = _225;
    int _245 = _227;
    int _247 = _229;
    int _249 = _231;
    float _251 = in.m_23.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_23.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_25.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_25.w;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = _69 * _255;
    float _277 = _275 * 0.15915493667125701904296875;
    float _279 = _69 * _261;
    float _281 = _277 * 6.283185482025146484375;
    float _283 = sin(_281);
    float _285 = _279 * 0.15915493667125701904296875;
    float _287 = _69 * _267;
    float _289 = _69 * _273;
    float _291 = _287 * 0.15915493667125701904296875;
    float _293 = _289 * 0.15915493667125701904296875;
    float _295 = _285 * 6.283185482025146484375;
    float _297 = sin(_295);
    float _299 = _291 * 6.283185482025146484375;
    float _301 = sin(_299);
    float _303 = _283 * _283;
    float _305 = _293 * 6.283185482025146484375;
    float _307 = cos(_305);
    float _309 = _303 * _297;
    float _311 = _309 * _301;
    float _313 = _307 * 0.0199999995529651641845703125;
    float _315 = fma(_311, 0.5, _313);
    float _317 = _315 * 16.0;
    float _319 = floor(_317);
    float _321 = -_319;
    float _323 = _317 + _321;
    float _325 = _323 * 2.0;
    bool _327 = _325 >= 1.0;
    bool _329 = isnan(_325);
    bool _331 = _327 || _329;
    bool _333 = isnan(1.0);
    bool _335 = _331 || _333;
    bool _337 = !_141;
    int _339 = _337 ? _193 : _167;
    bool _341 = !_141;
    int _343 = _341 ? _195 : _169;
    bool _345 = !_141;
    int _347 = _345 ? _197 : _171;
    bool _349 = !_141;
    int _351 = _349 ? _199 : _173;
    int _353 = _339;
    int _355 = _343;
    int _357 = _347;
    int _359 = _351;
    if (_335)
    {
        bool _361 = !_141;
        int _363 = _361 ? _217 : _243;
        _353 = _363;
    }
    int _365 = _353;
    if (_335)
    {
        bool _367 = !_141;
        int _369 = _367 ? _219 : _245;
        _355 = _369;
    }
    int _371 = _355;
    if (_335)
    {
        bool _373 = !_141;
        int _375 = _373 ? _221 : _247;
        _357 = _375;
    }
    int _377 = _357;
    if (_335)
    {
        bool _379 = !_141;
        int _381 = _379 ? _223 : _249;
        _359 = _381;
    }
    int _383 = _359;
    out.m_30.x = as_type<float>(_365);
    out.m_30.y = as_type<float>(_371);
    out.m_30.z = as_type<float>(_377);
    out.m_30.w = as_type<float>(_383);
    return out;
}


struct main0_out_u
{
    uint4 m_30 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_23.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_25.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_25.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_27.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _37;
    float _71 = _69 * _43;
    float _73 = _69 * _67;
    float _75 = _71 * 0.15915493667125701904296875;
    float _77 = _69 * _49;
    float _79 = _75 * 6.283185482025146484375;
    float _81 = cos(_79);
    float _83 = _77 * 0.15915493667125701904296875;
    float _85 = _69 * _55;
    float _87 = _85 * 0.15915493667125701904296875;
    float _89 = _69 * _61;
    float _91 = _83 * 6.283185482025146484375;
    float _93 = cos(_91);
    float _95 = _89 * 0.15915493667125701904296875;
    float _97 = _87 * 6.283185482025146484375;
    float _99 = sin(_97);
    float _101 = _81 * _81;
    float _103 = _95 * 6.283185482025146484375;
    float _105 = cos(_103);
    float _107 = _101 * _93;
    float _109 = _99 * 0.0199999995529651641845703125;
    float _111 = _107 * _105;
    float _113 = fma(_111, 0.5, _109);
    float _115 = in.m_27.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _113 * 16.0;
    float _123 = floor(_121);
    float _125 = -_123;
    float _127 = _121 + _125;
    float _129 = _127 * 2.0;
    bool _133 = _129 >= 1.0;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = _69 * _119;
    int _146 = as_type<int>(_87);
    int _148 = as_type<int>(_55);
    int _150 = 1;
    int _152 = as_type<int>(_119);
    int _154 = 16;
    if (_141)
    {
        float2 _534 = float2(_143, _73);
        float4 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_534, float2(0.0), isnan(_534)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_534, float2(0.0), isnan(_534)), int2(1, 0)).xyzw;
        float _159 = _157.x;
        float _161 = _157.y;
        float _163 = _157.z;
        float _165 = _157.w;
        _146 = as_type<int>(_159);
        _148 = as_type<int>(_161);
        _150 = as_type<int>(_163);
        _152 = as_type<int>(_165);
    }
    int _167 = _146;
    int _169 = _148;
    int _171 = _150;
    int _173 = _152;
    int _175 = as_type<int>(_121);
    int _177 = as_type<int>(_129);
    int _179 = as_type<int>(_75);
    int _181 = as_type<int>(_95);
    if (!_141)
    {
        float2 _579 = float2(_143, _73);
        float4 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_579, float2(0.0), isnan(_579))).xyzw;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float _191 = _183.w;
        _175 = as_type<int>(_185);
        _177 = as_type<int>(_187);
        _179 = as_type<int>(_189);
        _181 = as_type<int>(_191);
    }
    int _193 = _175;
    int _195 = _177;
    int _197 = _179;
    int _199 = _181;
    int _201 = 0;
    int _203 = 0;
    int _205 = 0;
    if (!_141)
    {
        float2 _611 = float2(_143, _73);
        float4 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611)), int2(0, 1)).xyzw;
        float _209 = _207.x;
        float _211 = _207.y;
        float _213 = _207.z;
        float _215 = _207.w;
        _201 = as_type<int>(_209);
        _203 = as_type<int>(_211);
        _154 = as_type<int>(_213);
        _205 = as_type<int>(_215);
    }
    int _217 = _201;
    int _219 = _203;
    int _221 = _154;
    int _223 = _205;
    int _225 = 0;
    int _227 = 0;
    int _229 = 17;
    int _231 = 0;
    if (_141)
    {
        float2 _644 = float2(_143, _73);
        float4 _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_644, float2(0.0), isnan(_644)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_644, float2(0.0), isnan(_644)), int2(1)).xyzw;
        float _235 = _233.x;
        float _237 = _233.y;
        float _239 = _233.z;
        float _241 = _233.w;
        _225 = as_type<int>(_235);
        _227 = as_type<int>(_237);
        _229 = as_type<int>(_239);
        _231 = as_type<int>(_241);
    }
    int _243 = _225;
    int _245 = _227;
    int _247 = _229;
    int _249 = _231;
    float _251 = in.m_23.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_23.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_25.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_25.w;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = _69 * _255;
    float _277 = _275 * 0.15915493667125701904296875;
    float _279 = _69 * _261;
    float _281 = _277 * 6.283185482025146484375;
    float _283 = sin(_281);
    float _285 = _279 * 0.15915493667125701904296875;
    float _287 = _69 * _267;
    float _289 = _69 * _273;
    float _291 = _287 * 0.15915493667125701904296875;
    float _293 = _289 * 0.15915493667125701904296875;
    float _295 = _285 * 6.283185482025146484375;
    float _297 = sin(_295);
    float _299 = _291 * 6.283185482025146484375;
    float _301 = sin(_299);
    float _303 = _283 * _283;
    float _305 = _293 * 6.283185482025146484375;
    float _307 = cos(_305);
    float _309 = _303 * _297;
    float _311 = _309 * _301;
    float _313 = _307 * 0.0199999995529651641845703125;
    float _315 = fma(_311, 0.5, _313);
    float _317 = _315 * 16.0;
    float _319 = floor(_317);
    float _321 = -_319;
    float _323 = _317 + _321;
    float _325 = _323 * 2.0;
    bool _327 = _325 >= 1.0;
    bool _329 = isnan(_325);
    bool _331 = _327 || _329;
    bool _333 = isnan(1.0);
    bool _335 = _331 || _333;
    bool _337 = !_141;
    int _339 = _337 ? _193 : _167;
    bool _341 = !_141;
    int _343 = _341 ? _195 : _169;
    bool _345 = !_141;
    int _347 = _345 ? _197 : _171;
    bool _349 = !_141;
    int _351 = _349 ? _199 : _173;
    int _353 = _339;
    int _355 = _343;
    int _357 = _347;
    int _359 = _351;
    if (_335)
    {
        bool _361 = !_141;
        int _363 = _361 ? _217 : _243;
        _353 = _363;
    }
    int _365 = _353;
    if (_335)
    {
        bool _367 = !_141;
        int _369 = _367 ? _219 : _245;
        _355 = _369;
    }
    int _371 = _355;
    if (_335)
    {
        bool _373 = !_141;
        int _375 = _373 ? _221 : _247;
        _357 = _375;
    }
    int _377 = _357;
    if (_335)
    {
        bool _379 = !_141;
        int _381 = _379 ? _223 : _249;
        _359 = _381;
    }
    int _383 = _359;
    out.m_30.x = as_type<float>(_365);
    out.m_30.y = as_type<float>(_371);
    out.m_30.z = as_type<float>(_377);
    out.m_30.w = as_type<float>(_383);
    return main0_out_u{as_type<uint4>(out.m_30)};
}

