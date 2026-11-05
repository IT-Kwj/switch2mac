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
    texturecube<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_27 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = in.m_27.x;
    float _47 = in.m_27.y;
    bool _51 = 0.0 <= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _53 = fma(_45, _45, 1.0);
    float _55 = fma(_47, _47, _53);
    float _57 = rsqrt(_55);
    float _59 = _45 * _57;
    float _61 = _47 * _57;
    float _63 = -_47;
    float _65 = _63 + 0.00340000004507601261138916015625;
    float _67 = _45 + (-0.007199999876320362091064453125);
    float _69 = _59 * 0.00340000004507601261138916015625;
    float _71 = _57 * _65;
    float _73 = _57 * _67;
    float _75 = -_69;
    float _77 = fma(_61, 0.007199999876320362091064453125, _75);
    float _79 = _77 * _77;
    float _81 = fma(_71, _71, _79);
    float _83 = fma(_73, _73, _81);
    float _85 = rsqrt(_83);
    float _87 = _71 * _85;
    float _89 = _77 * _85;
    float _91 = _73 * _85;
    bool _93 = !_51;
    float _95 = 0.0;
    float _97 = 0.0;
    float _99 = 0.0;
    float _101 = 0.0;
    float _103 = 0.0;
    float _105 = 0.0;
    float _107 = 0.0;
    float _109 = 0.0;
    if (!_93)
    {
        float _111 = gl_FragCoord.w;
        float _113 = _57 * _91;
        float _115 = _61 * _87;
        float _117 = _59 * _89;
        float _119 = -_113;
        float _121 = fma(_61, _89, _119);
        float _123 = -_115;
        float _125 = fma(_59, _91, _123);
        float _127 = -_117;
        float _129 = fma(_57, _87, _127);
        float _131 = 1.0 / _111;
        float _133 = 0.0;
        bool _135;
        bool _249;
        float _365;
        float _367;
        float _369;
        do
        {
            float _137 = _133;
            float _139 = _95;
            float _141 = _97;
            float _143 = _99;
            float _145 = _101;
            float _147 = in.m_31.x;
            float _149 = gl_FragCoord.w;
            float _151 = _147 * _149;
            float _153 = in.m_31.y;
            float _155 = gl_FragCoord.w;
            float _157 = _153 * _155;
            float _159 = in.m_31.z;
            float _161 = gl_FragCoord.w;
            float _163 = _159 * _161;
            float _165 = in.m_33.x;
            float _167 = gl_FragCoord.w;
            float _169 = _165 * _167;
            float _171 = in.m_33.z;
            float _173 = gl_FragCoord.w;
            float _175 = _171 * _173;
            float _177 = in.m_35.z;
            float _179 = gl_FragCoord.w;
            float _181 = _177 * _179;
            float _183 = in.m_33.y;
            float _185 = gl_FragCoord.w;
            float _187 = _183 * _185;
            float _189 = in.m_35.x;
            float _191 = gl_FragCoord.w;
            float _193 = _189 * _191;
            float _195 = in.m_35.y;
            float _197 = gl_FragCoord.w;
            float _199 = _195 * _197;
            float _201 = _137 * 0.15915493667125701904296875;
            float _203 = _201 * 6.283185482025146484375;
            float _205 = cos(_203);
            float _207 = _201 * 6.283185482025146484375;
            float _209 = sin(_207);
            float _211 = _205 * _205;
            float _213 = _57 * _205;
            float _215 = _131 * _151;
            float _217 = _131 * _157;
            float _219 = _131 * _163;
            float _221 = _131 * _169;
            float _223 = _131 * _175;
            float _225 = _131 * _181;
            float _227 = _131 * _187;
            float _229 = _131 * _193;
            float _231 = _131 * _199;
            float _233 = precise::max(0.0, _205);
            float _235 = _59 * _205;
            float _237 = _61 * _205;
            float _239 = -3.1415927410125732421875;
            float _241 = _145;
            float _243 = _139;
            float _245 = _141;
            float _247 = _143;
            do
            {
                float _251 = _239;
                float _253 = _241;
                float _255 = _243;
                float _257 = _245;
                float _259 = _247;
                float _261 = _251 * 0.15915493667125701904296875;
                float _263 = _261 * 6.283185482025146484375;
                float _265 = cos(_263);
                float _267 = _261 * 6.283185482025146484375;
                float _269 = sin(_267);
                float _271 = _209 * _265;
                float _273 = fma(_271, _271, _211);
                float _275 = _209 * _269;
                float _277 = fma(_275, _275, _273);
                float _279 = rsqrt(_277);
                float _281 = _271 * _279;
                float _283 = _279 * _213;
                float _285 = _275 * _279;
                float _287 = _279 * _235;
                float _289 = _279 * _237;
                float _291 = fma(_89, _281, _283);
                float _293 = fma(_87, _281, _287);
                float _295 = fma(_91, _281, _289);
                float _297 = fma(_125, _285, _291);
                float _299 = fma(_121, _285, _293);
                float _301 = fma(_129, _285, _295);
                float _303 = _297 * _217;
                float _305 = _297 * _227;
                float _307 = _297 * _231;
                float _309 = fma(_299, _215, _303);
                float _311 = fma(_299, _221, _305);
                float _313 = fma(_299, _229, _307);
                float _315 = fma(_301, _219, _309);
                float _317 = fma(_301, _223, _311);
                float _319 = fma(_301, _225, _313);
                float _321 = abs(_315);
                float _323 = abs(_317);
                float _325 = precise::max(_321, _323);
                float _327 = abs(_319);
                float _329 = precise::max(_327, _325);
                float _331 = 1.0 / _329;
                float _333 = _315 * _331;
                float _335 = -_331;
                float _337 = _319 * _335;
                float _339 = _317 * _331;
                float3 _771 = float3(_333, _339, _337);
                float3 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_771, float3(0.0), isnan(_771)), level((*spvDescriptorSet0.fp_c3)._m0[2].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_771, float3(0.0), isnan(_771)), level((*spvDescriptorSet0.fp_c3)._m0[2].x)).xyz;
                float _345 = _343.x;
                float _347 = _343.y;
                float _349 = _343.z;
                float _351 = _251 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
                float _353 = _233 + _253;
                bool _355 = _351 >= 3.1415927410125732421875;
                bool _357 = isnan(_351);
                bool _359 = _355 || _357;
                bool _361 = isnan(3.1415927410125732421875);
                bool _363 = _359 || _361;
                _365 = fma(_233, _345, _255);
                _367 = fma(_233, _347, _257);
                _369 = fma(_233, _349, _259);
                _249 = !_363;
                _101 = _353;
                _239 = _351;
                _241 = _353;
                _243 = _365;
                _245 = _367;
                _247 = _369;
                _103 = _353;
            } while (_249);
            float _371 = _137 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
            bool _373 = _371 > (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _375 = isnan(_371);
            bool _377 = _373 || _375;
            bool _379 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _381 = _377 || _379;
            _135 = !_381;
            _133 = _371;
            _95 = _365;
            _97 = _367;
            _99 = _369;
            _105 = _365;
            _107 = _367;
            _109 = _369;
        } while (_135);
    }
    float _383 = _103;
    float _385 = _105;
    float _387 = _107;
    float _389 = _109;
    float _391 = 1.0 / _383;
    float _393 = _391 * _385;
    float _395 = _391 * _387;
    float _397 = _391 * _389;
    out.m_38.x = _393;
    out.m_38.y = _395;
    out.m_38.z = _397;
    out.m_38.w = 1.0;
    return out;
}

