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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.x;
    float _41 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _43 = _39 / _41;
    float _45 = trunc(_43);
    int _48 = int(_45);
    int _50 = _48 << 4;
    uint _53 = uint(int(uint(_50) >> uint(2)));
    uint _55 = uint(int(uint(int(_53)) >> uint(2)));
    int _57 = int(_53) & 3;
    float _59 = (*spvDescriptorSet0.fp_c4)._m0[int(_55)][_57];
    int _61 = int(_53) + 1;
    uint _63 = uint(int(uint(_61) >> uint(2)));
    int _65 = _61 & 3;
    float _67 = (*spvDescriptorSet0.fp_c4)._m0[int(_63)][_65];
    int _69 = _50 + 8;
    uint _71 = uint(int(uint(_69) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.fp_c4)._m0[int(_73)][_75];
    float _79 = _67 * (*spvDescriptorSet0.fp_c3)._m0[101].y;
    float _81 = _67 * (*spvDescriptorSet0.fp_c3)._m0[102].y;
    float _83 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[101].x, _79);
    float _85 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[102].x, _81);
    float _87 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[101].z, _83);
    float _89 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[102].z, _85);
    float _91 = _87 + (*spvDescriptorSet0.fp_c3)._m0[101].w;
    float _93 = _89 + (*spvDescriptorSet0.fp_c3)._m0[102].w;
    float _95 = trunc(_91);
    int _97 = int(_95);
    float _99 = trunc(_93);
    int _101 = int(_99);
    int _103 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].y);
    int _105 = _97 + _103;
    int _107 = _105 + 1;
    bool _111 = _107 >= 0;
    int _113 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].z);
    int _115 = _101 + _113;
    int _117 = _115 + 1;
    bool _119 = _107 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].x);
    bool _121 = !_111;
    bool _123 = _119 || _121;
    bool _125 = _117 < 0;
    bool _127 = _125 || _123;
    bool _129 = _117 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].x);
    bool _131 = _129 || _127;
    int _133 = _97;
    if (_131)
    {
        _133 = 1065353216;
    }
    int _135 = _133;
    if (_131)
    {
        out.m_32.x = as_type<float>(_135);
        return out;
    }
    int _137 = _117 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].x);
    int _139 = _137 + _107;
    float _141 = floor(_93);
    int _143 = _139 << 2;
    int _145 = _139 >> 2;
    int _147 = 12 & _143;
    int _149 = _145 << 4;
    int _151 = _149 + _147;
    float _153 = floor(_91);
    uint _155 = uint(int(uint(_151) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.fp_c3)._m0[int(_157)][_159];
    float _163 = -_141;
    float _165 = _93 + _163;
    float _167 = -_153;
    float _169 = _91 + _167;
    float _171 = rint(_161);
    float _173 = precise::max(_171, 0.0);
    uint _175 = uint(_173);
    uint _177 = clamp(_175, 0u, 65535u);
    float3 _494 = float3(_169, _165, float(int(_177)));
    float3 _498 = select(_494, float3(0.0), isnan(_494));
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _498.xy, uint(rint(_498.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _498.xy, uint(rint(_498.z))).x;
    int _181 = _139 << 4;
    int _183 = _181 + 1648;
    int _185 = _151 + 8048;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.fp_c3)._m0[int(_189)][_191];
    uint _195 = uint(int(uint(_183) >> uint(2)));
    uint _197 = uint(int(uint(int(_195)) >> uint(2)));
    int _199 = int(_195) & 3;
    float _201 = (*spvDescriptorSet0.fp_c3)._m0[int(_197)][_199];
    int _203 = int(_195) + 1;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    int _207 = _203 & 3;
    float _209 = (*spvDescriptorSet0.fp_c3)._m0[int(_205)][_207];
    int _211 = _183 + 8;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    uint _215 = uint(int(uint(int(_213)) >> uint(2)));
    int _217 = int(_213) & 3;
    float _219 = (*spvDescriptorSet0.fp_c3)._m0[int(_215)][_217];
    int _221 = int(_213) + 1;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    int _225 = _221 & 3;
    float _227 = (*spvDescriptorSet0.fp_c3)._m0[int(_223)][_225];
    float _229 = 1.0 / _193;
    float _231 = _67 * _209;
    float _233 = fma(_59, _201, _231);
    float _235 = fma(_77, _219, _233);
    float _237 = _235 + _227;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = -_239;
    float _243 = _241 + _179;
    float _245 = _193 * 5.0;
    float _247 = fma(_229, 0.20000000298023223876953125, _243);
    float _249 = _245 * _247;
    float _251 = exp2(_249);
    float _253 = 0.0 + _251;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    out.m_32.x = _255;
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.x;
    float _41 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _43 = _39 / _41;
    float _45 = trunc(_43);
    int _48 = int(_45);
    int _50 = _48 << 4;
    uint _53 = uint(int(uint(_50) >> uint(2)));
    uint _55 = uint(int(uint(int(_53)) >> uint(2)));
    int _57 = int(_53) & 3;
    float _59 = (*spvDescriptorSet0.fp_c4)._m0[int(_55)][_57];
    int _61 = int(_53) + 1;
    uint _63 = uint(int(uint(_61) >> uint(2)));
    int _65 = _61 & 3;
    float _67 = (*spvDescriptorSet0.fp_c4)._m0[int(_63)][_65];
    int _69 = _50 + 8;
    uint _71 = uint(int(uint(_69) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.fp_c4)._m0[int(_73)][_75];
    float _79 = _67 * (*spvDescriptorSet0.fp_c3)._m0[101].y;
    float _81 = _67 * (*spvDescriptorSet0.fp_c3)._m0[102].y;
    float _83 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[101].x, _79);
    float _85 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[102].x, _81);
    float _87 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[101].z, _83);
    float _89 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[102].z, _85);
    float _91 = _87 + (*spvDescriptorSet0.fp_c3)._m0[101].w;
    float _93 = _89 + (*spvDescriptorSet0.fp_c3)._m0[102].w;
    float _95 = trunc(_91);
    int _97 = int(_95);
    float _99 = trunc(_93);
    int _101 = int(_99);
    int _103 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].y);
    int _105 = _97 + _103;
    int _107 = _105 + 1;
    bool _111 = _107 >= 0;
    int _113 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].z);
    int _115 = _101 + _113;
    int _117 = _115 + 1;
    bool _119 = _107 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].x);
    bool _121 = !_111;
    bool _123 = _119 || _121;
    bool _125 = _117 < 0;
    bool _127 = _125 || _123;
    bool _129 = _117 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].x);
    bool _131 = _129 || _127;
    int _133 = _97;
    if (_131)
    {
        _133 = 1065353216;
    }
    int _135 = _133;
    if (_131)
    {
        out.m_32.x = as_type<float>(_135);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    int _137 = _117 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[100].x);
    int _139 = _137 + _107;
    float _141 = floor(_93);
    int _143 = _139 << 2;
    int _145 = _139 >> 2;
    int _147 = 12 & _143;
    int _149 = _145 << 4;
    int _151 = _149 + _147;
    float _153 = floor(_91);
    uint _155 = uint(int(uint(_151) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.fp_c3)._m0[int(_157)][_159];
    float _163 = -_141;
    float _165 = _93 + _163;
    float _167 = -_153;
    float _169 = _91 + _167;
    float _171 = rint(_161);
    float _173 = precise::max(_171, 0.0);
    uint _175 = uint(_173);
    uint _177 = clamp(_175, 0u, 65535u);
    float3 _494 = float3(_169, _165, float(int(_177)));
    float3 _498 = select(_494, float3(0.0), isnan(_494));
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _498.xy, uint(rint(_498.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _498.xy, uint(rint(_498.z))).x;
    int _181 = _139 << 4;
    int _183 = _181 + 1648;
    int _185 = _151 + 8048;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.fp_c3)._m0[int(_189)][_191];
    uint _195 = uint(int(uint(_183) >> uint(2)));
    uint _197 = uint(int(uint(int(_195)) >> uint(2)));
    int _199 = int(_195) & 3;
    float _201 = (*spvDescriptorSet0.fp_c3)._m0[int(_197)][_199];
    int _203 = int(_195) + 1;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    int _207 = _203 & 3;
    float _209 = (*spvDescriptorSet0.fp_c3)._m0[int(_205)][_207];
    int _211 = _183 + 8;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    uint _215 = uint(int(uint(int(_213)) >> uint(2)));
    int _217 = int(_213) & 3;
    float _219 = (*spvDescriptorSet0.fp_c3)._m0[int(_215)][_217];
    int _221 = int(_213) + 1;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    int _225 = _221 & 3;
    float _227 = (*spvDescriptorSet0.fp_c3)._m0[int(_223)][_225];
    float _229 = 1.0 / _193;
    float _231 = _67 * _209;
    float _233 = fma(_59, _201, _231);
    float _235 = fma(_77, _219, _233);
    float _237 = _235 + _227;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = -_239;
    float _243 = _241 + _179;
    float _245 = _193 * 5.0;
    float _247 = fma(_229, 0.20000000298023223876953125, _243);
    float _249 = _245 * _247;
    float _251 = exp2(_249);
    float _253 = 0.0 + _251;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    out.m_32.x = _255;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

