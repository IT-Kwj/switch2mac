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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = precise::min((*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _55 = _53 * 0.5;
    float _57 = 1.0 / _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = fma(_61, -6.283185482025146484375, 4.7123889923095703125);
    float _65 = precise::max(0.001000000047497451305389404296875, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _67 = precise::max(0.001000000047497451305389404296875, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _69 = _63 * 0.15915493667125701904296875;
    float _71 = _65 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _73 = _71 * 0.5;
    float _75 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _77 = _69 * 6.283185482025146484375;
    float _79 = sin(_77);
    float _81 = _67 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _83 = _81 * 0.5;
    float _85 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _87 = 1.0 / _73;
    float _89 = _69 * 6.283185482025146484375;
    float _91 = cos(_89);
    bool _95 = _79 >= 0.0;
    bool _97 = isnan(_79);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.0);
    bool _103 = _99 || _101;
    float _105 = 1.0 / _83;
    float _107 = _79 * _87;
    float _109 = _85 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _111 = _107 * _107;
    float _113 = abs(_91);
    float _115 = precise::max(_113, 0.001000000047497451305389404296875);
    float _117 = 0.0;
    float _119 = _59;
    float _121 = 0.5;
    if (!_103)
    {
        float _123 = 1.0 / _75;
        _117 = _123;
    }
    float _125 = _117;
    float _127 = _91 * _105;
    float _129 = 1.0 / _115;
    float _131 = fma(_127, _127, _111);
    float _133 = -_109;
    float _135 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[0].y, _133);
    float _137 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _139 = rsqrt(_131);
    float _141 = abs(_79);
    float _143 = _141 * _129;
    float _145 = _129;
    if (!_103)
    {
        float _147 = _135 * _125;
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 > _149;
    bool _153 = !_103;
    bool _155 = _151 && _153;
    bool _157 = _143 > _149;
    float _159 = _59 * _51;
    float _161 = _107 * _139;
    float _163 = _127 * _139;
    float _165 = _73 * _161;
    float _167 = _83 * _163;
    float _169 = _83;
    if (_155)
    {
        float _171 = abs(_79);
        float _173 = 1.0 / _171;
        _169 = _173;
    }
    float _175 = _169;
    float _177 = _165 * _165;
    float _179 = fma(_167, _167, _177);
    float _181 = sqrt(_179);
    if (_155)
    {
        float _183 = _135 * _175;
        _119 = _183;
    }
    float _185 = _119;
    bool _187 = !_103;
    bool _189 = _187 && _157;
    float _191 = _185;
    if (!_189)
    {
        bool _193 = _79 > 0.0;
        float _195 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[1].w, 0.5);
        float _197 = _195 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _199 = _135;
        float _201 = _197;
        if (_193)
        {
            float _203 = 1.0 / _75;
            _199 = _203;
        }
        float _205 = _199;
        if (_193)
        {
            float _207 = _197 * _205;
            _121 = _207;
        }
        float _209 = _121;
        bool _211 = _143 > _209;
        bool _213 = _211 && _193;
        float _215 = _209;
        if (_213)
        {
            float _217 = abs(_79);
            float _219 = 1.0 / _217;
            _215 = _219;
        }
        float _221 = _215;
        float _223 = _143;
        if (!_213)
        {
            float _225 = abs(_91);
            float _227 = 1.0 / _225;
            _223 = _227;
        }
        float _229 = _223;
        if (_213)
        {
            float _231 = _197 * _221;
            _201 = _231;
        }
        float _233 = _201;
        _191 = _233;
        if (!_213)
        {
            float _235 = _75 * _229;
            _191 = _235;
        }
    }
    float _237 = _191;
    float _239 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _241 = -_181;
    float _243 = _241 + _237;
    float _245 = _91 * _137;
    float _247 = -_85;
    float _249 = _247 + 0.5;
    float _251 = fma(_159, _243, _181);
    float _253 = _91 * _251;
    float _255 = _251 * _57;
    float _257 = fma(_137, _253, 0.5);
    float _259 = _255 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _261 = -_255;
    float _263 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[1].z, _251);
    float _265 = _79 * _239;
    float _267 = _79 * _251;
    float _269 = fma(_259, -2.0, _251);
    float _271 = fma(_259, -3.0, _251);
    float _273 = fma(_263, _265, _249);
    float _275 = fma(_239, _267, _249);
    float _277 = fma(_263, _245, 0.5);
    float _279 = fma(_269, _265, _249);
    float _281 = fma(_271, _265, _249);
    float _283 = fma(_269, _245, 0.5);
    float _285 = fma(_271, _245, 0.5);
    float2 _808 = float2(_257, _275);
    float3 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_808, float2(0.0), isnan(_808))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_808, float2(0.0), isnan(_808))).xyz;
    float _291 = _289.x;
    float _293 = _289.y;
    float _295 = _289.z;
    float2 _824 = float2(_277, _273);
    float3 _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_824, float2(0.0), isnan(_824))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_824, float2(0.0), isnan(_824))).xyz;
    float _299 = _297.x;
    float _301 = _297.y;
    float _303 = _297.z;
    float2 _838 = float2(_283, _279);
    float3 _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_838, float2(0.0), isnan(_838))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_838, float2(0.0), isnan(_838))).xyz;
    float _307 = _305.x;
    float _309 = _305.y;
    float _311 = _305.z;
    float2 _852 = float2(_285, _281);
    float3 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_852, float2(0.0), isnan(_852))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_852, float2(0.0), isnan(_852))).xyz;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _293 * 0.586610972881317138671875;
    float _323 = _301 * 0.586610972881317138671875;
    float _325 = fma(_291, 0.298911988735198974609375, _321);
    float _327 = _309 * 0.586610972881317138671875;
    float _329 = fma(_299, 0.298911988735198974609375, _323);
    float _331 = fma(_295, 0.114477999508380889892578125, _325);
    float _333 = fma(_307, 0.298911988735198974609375, _327);
    float _335 = _317 * 0.586610972881317138671875;
    float _337 = fma(_303, 0.114477999508380889892578125, _329);
    float _339 = fma(_311, 0.114477999508380889892578125, _333);
    bool _341 = _331 >= 20.0;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan(20.0);
    bool _349 = _345 || _347;
    float _351 = fma(_315, 0.298911988735198974609375, _335);
    bool _353 = _337 >= 20.0;
    bool _355 = isnan(_337);
    bool _357 = _353 || _355;
    bool _359 = isnan(20.0);
    bool _361 = _357 || _359;
    float _363 = fma(_319, 0.114477999508380889892578125, _351);
    bool _365 = _339 >= 20.0;
    bool _367 = isnan(_339);
    bool _369 = _365 || _367;
    bool _371 = isnan(20.0);
    bool _373 = _369 || _371;
    bool _375 = !_349;
    float _377 = _375 ? 1.00000095367431640625 : 9.9999999747524270787835121154785e-07;
    bool _379 = !_361;
    float _381 = _379 ? 1.00000095367431640625 : 9.9999999747524270787835121154785e-07;
    bool _383 = _363 >= 20.0;
    bool _385 = isnan(_363);
    bool _387 = _383 || _385;
    bool _389 = isnan(20.0);
    bool _391 = _387 || _389;
    float _393 = _291 * _377;
    bool _395 = !_373;
    float _397 = _395 ? 1.00000095367431640625 : 9.9999999747524270787835121154785e-07;
    float _399 = _377 + _381;
    bool _401 = !_391;
    float _403 = _401 ? 1.00000095367431640625 : 9.9999999747524270787835121154785e-07;
    float _405 = _293 * _377;
    float _407 = _295 * _377;
    float _409 = _399 + _397;
    float _411 = fma(_299, _381, _393);
    float _413 = fma(_301, _381, _405);
    float _415 = fma(_303, _381, _407);
    float _417 = _403 + _409;
    float _419 = fma(_307, _397, _411);
    float _421 = fma(_309, _397, _413);
    float _423 = fma(_311, _397, _415);
    float _425 = fma(_315, _403, _419);
    float _427 = 1.0 / _417;
    float _429 = fma(_317, _403, _421);
    float _431 = fma(_319, _403, _423);
    float _433 = _425 * _427;
    float _435 = _429 * _427;
    float _437 = _431 * _427;
    out.m_32.x = _433;
    out.m_32.y = _435;
    out.m_32.z = _437;
    out.m_32.w = 1.0;
    return out;
}

