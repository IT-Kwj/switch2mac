#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_34.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_34.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _234 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_234, float2(0.0), isnan(_234)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = gl_FragCoord.x;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = gl_FragCoord.y;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = _65 * _90;
    float _96 = _63 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _101 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _105;
    float _115 = trunc(_88);
    int _117 = int(_115);
    int _119 = _117 << 1;
    float _121 = precise::min(_70, _72);
    float _123 = precise::min(_74, _76);
    float _125 = precise::min(_121, _123);
    bool _129 = _125 >= 1.0;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = -_125;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _143 = 1.0 / _141;
    float _145 = -_76;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _151 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[1].w, _149);
    float _153 = _151 * 16777215.0;
    int _155 = _109 & 1;
    float _157 = 1.0 / _147;
    int _159 = 2 & _119;
    int _161 = (-3) & _155;
    int _163 = _159 | _161;
    bool _165 = !_137;
    float _167 = _165 ? _153 : 16777215.0;
    int _169 = _113 * 4;
    int _171 = _169 + _163;
    float _173 = trunc(_167);
    float _175 = precise::max(_173, 0.0);
    uint _178 = uint(_175);
    int _180 = _171 << 2;
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _184 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[1].w, _182);
    bool _186 = _76 != 1.0;
    bool _188 = isnan(_76);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    int _196 = _194 ? as_type<int>(_184) : 1065353216;
    uint _198 = uint(int(uint(_180) >> uint(2)));
    uint _419 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_198)], _178, memory_order_relaxed);
    uint _200 = _419;
    out.gl_FragDepth = _76;
    out.m_40.x = as_type<float>(_196);
    out.m_40.y = as_type<float>(_196);
    out.m_40.z = as_type<float>(_196);
    out.m_40.w = as_type<float>(_196);
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_34.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_34.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _234 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_234, float2(0.0), isnan(_234)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = gl_FragCoord.x;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = gl_FragCoord.y;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = _65 * _90;
    float _96 = _63 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _101 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _105;
    float _115 = trunc(_88);
    int _117 = int(_115);
    int _119 = _117 << 1;
    float _121 = precise::min(_70, _72);
    float _123 = precise::min(_74, _76);
    float _125 = precise::min(_121, _123);
    bool _129 = _125 >= 1.0;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = -_125;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _143 = 1.0 / _141;
    float _145 = -_76;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _151 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[1].w, _149);
    float _153 = _151 * 16777215.0;
    int _155 = _109 & 1;
    float _157 = 1.0 / _147;
    int _159 = 2 & _119;
    int _161 = (-3) & _155;
    int _163 = _159 | _161;
    bool _165 = !_137;
    float _167 = _165 ? _153 : 16777215.0;
    int _169 = _113 * 4;
    int _171 = _169 + _163;
    float _173 = trunc(_167);
    float _175 = precise::max(_173, 0.0);
    uint _178 = uint(_175);
    int _180 = _171 << 2;
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _184 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[1].w, _182);
    bool _186 = _76 != 1.0;
    bool _188 = isnan(_76);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    int _196 = _194 ? as_type<int>(_184) : 1065353216;
    uint _198 = uint(int(uint(_180) >> uint(2)));
    uint _419 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_198)], _178, memory_order_relaxed);
    uint _200 = _419;
    out.gl_FragDepth = _76;
    out.m_40.x = as_type<float>(_196);
    out.m_40.y = as_type<float>(_196);
    out.m_40.z = as_type<float>(_196);
    out.m_40.w = as_type<float>(_196);
    return main0_out_u{as_type<uint4>(out.m_40), out.gl_FragDepth};
}

