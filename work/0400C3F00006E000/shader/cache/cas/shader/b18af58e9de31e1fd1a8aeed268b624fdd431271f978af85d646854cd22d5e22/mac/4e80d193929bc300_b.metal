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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_46 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _418 = float2(_73, _75);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_418, float2(0.0), isnan(_418))).w;
    float _79 = in.m_35.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = _71 * _83;
    float _105 = _71 * _89;
    float _107 = _71 * _95;
    float _109 = in.m_35.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_37.z;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = -_103;
    float _123 = fma(_77, _105, _121);
    float _125 = _71 * _101;
    float _127 = _107 * _123;
    float _129 = 0.0 + _127;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = _131 * _125;
    bool _137 = _133 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _139 = isnan(_133);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    if (!_145)
    {
        discard_fragment();
    }
    float _153 = _71 * _113;
    float _155 = _71 * _151;
    float _157 = in.m_37.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = _153 * _155;
    float _165 = in.m_35.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _71 * _161;
    float _173 = in.m_35.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _71 * _169;
    float _181 = _179 * _171;
    float _183 = _71 * _177;
    float _185 = _71 * _119;
    float _187 = _183 * _185;
    if (!_145)
    {
        out.m_44.x = _163;
        out.m_44.y = _181;
        out.m_44.z = _187;
        out.m_44.w = _127;
        return out;
    }
    float _189 = in.m_46.w;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = _71 * _193;
    bool _197 = _195 != 1.0;
    bool _199 = isnan(_195);
    bool _201 = _197 || _199;
    bool _203 = isnan(1.0);
    bool _205 = _201 || _203;
    bool _207 = !_205;
    if (!_207)
    {
        float _209 = gl_FragCoord.x;
        float _211 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _213 = _209 / _211;
        float _215 = gl_FragCoord.y;
        float _217 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _219 = _215 / _217;
        float _221 = _195 * 256.0;
        float _223 = trunc(_221);
        int _226 = int(_223);
        uint _229 = uint(int(uint(_226) >> uint(7)));
        int _231 = int(_229) + _226;
        float _233 = trunc(_213);
        int _235 = int(_233);
        float _237 = trunc(_219);
        int _239 = int(_237);
        int _241 = _235 + 2;
        int _243 = _241 >> 1;
        uint _245 = uint(int(uint(_239) >> uint(1)));
        int _247 = _243 ^ int(_245);
        int _249 = _247 << 16;
        int _251 = _249 ^ _243;
        int _253 = 983055 & _251;
        int _255 = _253 << 6;
        int _257 = _255 + _253;
        int _259 = _257 & 13369548;
        uint _261 = uint(int(uint(_259) >> uint(3)));
        int _263 = _259 | int(_261);
        int _265 = _263 & 5570560;
        int _267 = _263 & 85;
        uint _269 = uint(int(uint(_265) >> uint(15)));
        int _271 = int(_269) + _267;
        bool _273 = uint(_231) > uint(_271);
        if (!_273)
        {
            discard_fragment();
        }
        if (!_273)
        {
            out.m_44.x = _163;
            out.m_44.y = _181;
            out.m_44.z = _187;
            out.m_44.w = _133;
            return out;
        }
    }
    float _275 = _181 * 0.715200006961822509765625;
    float _277 = in.m_48.w;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_48.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_48.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = fma(_163, 0.2125999927520751953125, _275);
    float _297 = in.m_48.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = fma(_187, 0.072200000286102294921875, _295);
    bool _305 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _307 = 1.0 / _303;
    float _309 = _307 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = fma(_311, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _315 = _71 * _281;
    float _317 = 0.0 + _133;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = _71 * _287;
    float _323 = _71 * _301;
    float _325 = _313 * _315;
    float _327 = _71 * _293;
    float _329 = fma(_187, _325, _321);
    float _331 = fma(_163, _325, _327);
    float _333 = fma(_181, _325, _323);
    float _335 = _321;
    if (!_305)
    {
        _335 = _319;
    }
    float _337 = _335;
    bool _339 = !_305;
    float _341 = _337;
    if (!_339)
    {
        float _343 = in.m_50.w;
        float _345 = gl_FragCoord.w;
        float _347 = _343 * _345;
        float _349 = in.m_50.z;
        float _351 = gl_FragCoord.w;
        float _353 = _349 * _351;
        float _355 = _71 * _347;
        float _357 = _71 * _353;
        float _359 = 1.0 / _355;
        float _361 = _357 * _359;
        float _363 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _365 = fma(_361, (*spvDescriptorSet0.fp_c8)._m0[30].w, _363);
        float _367 = 1.0 / _365;
        float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _371 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _373 = fma(_367, _369, _371);
        float _375 = _373 * 8.0;
        float _377 = precise::clamp(_375, 0.0, 1.0);
        float _379 = _319 * _377;
        _341 = _379;
    }
    float _381 = _341;
    float _383 = 0.0 + _381;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    out.m_44.x = _331;
    out.m_44.y = _333;
    out.m_44.z = _329;
    out.m_44.w = _385;
    return out;
}

