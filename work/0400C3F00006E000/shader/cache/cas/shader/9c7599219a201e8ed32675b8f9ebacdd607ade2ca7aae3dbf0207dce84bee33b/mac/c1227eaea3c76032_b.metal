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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_CSmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn6)]];
    float4 m_35 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _75 = -_73;
    float _77 = exp2(_75);
    float _79 = 1.0 / _47;
    float _81 = _79 * _53;
    float _83 = _79 * _59;
    float _85 = _79 * _65;
    float _87 = _79 * _71;
    float _89 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _91 = _81 + _89;
    float _93 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _95 = _83 + _93;
    float _97 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _99 = _85 + _97;
    float _101 = _81 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _103 = _91 * _91;
    float _105 = abs(_91);
    bool _109 = _105 > 0.00999999977648258209228515625;
    float _111 = -_87;
    float _113 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _115 = _111 + _113;
    float _117 = fma(_83, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _101);
    float _119 = fma(_95, _95, _103);
    float _121 = _109 ? _91 : 0.00999999977648258209228515625;
    float _123 = fma(_85, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _117);
    float _125 = fma(_99, _99, _119);
    float _127 = _121 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _129 = sqrt(_125);
    float _131 = precise::max(_127, -127.0);
    float _133 = 1.0 / _131;
    float _135 = spvFAdd(_129, 9.9999997473787516355514526367188e-06);
    float _137 = _129 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _139 = 1.0 / _135;
    float _141 = _91 * _139;
    float _143 = _95 * _139;
    float _145 = _99 * _139;
    float _147 = _123 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _149 = _141 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _151 = trunc(_147);
    int _154 = int(_151);
    float _156 = fma(_143, (*spvDescriptorSet0.fp_c9)._m0[69].x, _149);
    float _158 = fma(_145, (*spvDescriptorSet0.fp_c9)._m0[69].z, _156);
    float _160 = _81 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _162 = -_131;
    float _164 = exp2(_162);
    float _166 = fma(_158, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _168 = fma(_83, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _160);
    float _170 = fma(_166, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _172 = fma(_85, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _168);
    int _174 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _176 = _154 + _174;
    int _178 = _176 + 1;
    float _180 = _172 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _182 = abs(_170);
    float _184 = log2(_182);
    bool _186 = _178 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _188 = -_164;
    float _190 = _188 + 1.0;
    float _192 = trunc(_180);
    int _194 = int(_192);
    float _196 = _77 * _190;
    float _198 = _196 * _133;
    float _200 = _184 * 1.5;
    float _202 = _198 * _137;
    float _204 = exp2(_200);
    int _206 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _208 = _194 + _206;
    int _210 = _208 + 1;
    int _212 = _178 | _210;
    float _214 = -_202;
    float _216 = exp2(_214);
    bool _218 = _212 < 0;
    bool _220 = _218 || _186;
    bool _222 = _210 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _224 = _222 || _220;
    float _226 = _204 * 12.56637096405029296875;
    float _228 = 1.0 / _226;
    float _230 = _198;
    if (_224)
    {
        _230 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _232 = _230;
    float _234 = _232;
    if (!_224)
    {
        int _236 = _210 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _238 = _236 + _178;
        float _240 = floor(_147);
        int _242 = _238 << 2;
        int _244 = _238 >> 2;
        int _246 = 12 & _242;
        int _248 = _244 << 4;
        int _250 = _248 + _246;
        float _252 = floor(_180);
        int _254 = _250 + 16256;
        uint _257 = uint(int(uint(_254) >> uint(2)));
        uint _259 = uint(int(uint(int(_257)) >> uint(2)));
        int _261 = int(_257) & 3;
        float _263 = (*spvDescriptorSet0.fp_c9)._m0[int(_259)][_261];
        float _265 = -_240;
        float _267 = _147 + _265;
        float _269 = -_252;
        float _271 = _180 + _269;
        float _273 = rint(_263);
        float _275 = precise::max(_273, 0.0);
        uint _277 = uint(_275);
        uint _279 = clamp(_277, 0u, 65535u);
        float3 _762 = float3(_267, _271, float(int(_279)));
        float3 _766 = select(_762, float3(0.0), isnan(_762));
        float _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _766.xy, uint(rint(_766.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _766.xy, uint(rint(_766.z))).x;
        int _283 = _238 << 4;
        int _285 = _283 + 17904;
        int _287 = _250 + 24304;
        uint _289 = uint(int(uint(_287) >> uint(2)));
        uint _291 = uint(int(uint(int(_289)) >> uint(2)));
        int _293 = int(_289) & 3;
        float _295 = (*spvDescriptorSet0.fp_c9)._m0[int(_291)][_293];
        uint _297 = uint(int(uint(_285) >> uint(2)));
        uint _299 = uint(int(uint(int(_297)) >> uint(2)));
        int _301 = int(_297) & 3;
        float _303 = (*spvDescriptorSet0.fp_c9)._m0[int(_299)][_301];
        int _305 = int(_297) + 1;
        uint _307 = uint(int(uint(_305) >> uint(2)));
        int _309 = _305 & 3;
        float _311 = (*spvDescriptorSet0.fp_c9)._m0[int(_307)][_309];
        int _313 = _285 + 8;
        uint _315 = uint(int(uint(_313) >> uint(2)));
        uint _317 = uint(int(uint(int(_315)) >> uint(2)));
        int _319 = int(_315) & 3;
        float _321 = (*spvDescriptorSet0.fp_c9)._m0[int(_317)][_319];
        int _323 = int(_315) + 1;
        uint _325 = uint(int(uint(_323) >> uint(2)));
        int _327 = _323 & 3;
        float _329 = (*spvDescriptorSet0.fp_c9)._m0[int(_325)][_327];
        float _331 = 1.0 / _295;
        float _333 = _81 * _311;
        float _335 = fma(_83, _303, _333);
        float _337 = fma(_85, _321, _335);
        float _339 = _337 + _329;
        float _341 = precise::clamp(_339, 0.0, 1.0);
        float _343 = -_341;
        float _345 = _343 + _281;
        float _347 = _295 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _349 = fma(_331, (*spvDescriptorSet0.fp_c13)._m0[4].w, _345);
        float _351 = _347 * _349;
        float _353 = exp2(_351);
        float _355 = 0.0 + _353;
        float _357 = precise::clamp(_355, 0.0, 1.0);
        float _359 = precise::min(_357, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _234 = _359;
    }
    float _361 = _234;
    float _363 = _115 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = -_361;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _373 = fma(_371, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _375 = -_216;
    float _377 = _375 + 1.0;
    float _379 = fma(_365, _369, _361);
    float _381 = _373 * _228;
    float _383 = precise::min(_379, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _385 = _377 * _381;
    float _387 = _383 * _385;
    float _389 = _387 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _391 = _387 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _393 = _387 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    out.m_38.x = _389;
    out.m_38.y = _391;
    out.m_38.z = _393;
    out.m_38.w = 0.0;
    out.m_40.x = _389;
    out.m_40.y = _391;
    out.m_40.z = _393;
    out.m_40.w = 0.0;
    return out;
}

