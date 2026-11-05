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
    float4 m_40 [[color(2)]];
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
    float2 _242 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = gl_FragCoord.y;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = gl_FragCoord.x;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _94 = _63 * _90;
    float _96 = _65 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _105 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _101;
    float _115 = trunc(_88);
    int _117 = int(_115);
    int _119 = _109 * 2;
    int _121 = _117 & 1;
    int _123 = 2 & _119;
    int _125 = (-3) & _121;
    int _127 = _123 | _125;
    int _129 = _113 * 4;
    int _131 = _129 + _127;
    float _133 = precise::min(_70, _72);
    float _135 = precise::min(_74, _76);
    float _137 = precise::min(_133, _135);
    float _139 = precise::max(_70, _72);
    float _141 = precise::max(_74, _76);
    float _143 = -_137;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _149 = _137 >= 1.0;
    bool _151 = isnan(_137);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = 1.0 / _145;
    float _161 = precise::max(_139, _141);
    float _163 = -_161;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _169 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[1].w, _167);
    float _171 = _169 * 16777215.0;
    float _173 = 1.0 / _165;
    bool _175 = !_157;
    float _177 = _175 ? _171 : 16777215.0;
    int _179 = _131 << 2;
    float _181 = trunc(_177);
    float _183 = precise::max(_181, 0.0);
    uint _186 = uint(_183);
    bool _188 = _161 >= 1.0;
    bool _190 = isnan(_161);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _200 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].w, _198);
    bool _202 = !_196;
    int _204 = _202 ? as_type<int>(_200) : 1065353216;
    uint _206 = uint(int(uint(_179) >> uint(2)));
    uint _438 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_206)], _186, memory_order_relaxed);
    uint _208 = _438;
    out.gl_FragDepth = _165;
    out.m_40.x = as_type<float>(_204);
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(2)]];
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
    float2 _242 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = gl_FragCoord.y;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = gl_FragCoord.x;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _94 = _63 * _90;
    float _96 = _65 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _105 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _101;
    float _115 = trunc(_88);
    int _117 = int(_115);
    int _119 = _109 * 2;
    int _121 = _117 & 1;
    int _123 = 2 & _119;
    int _125 = (-3) & _121;
    int _127 = _123 | _125;
    int _129 = _113 * 4;
    int _131 = _129 + _127;
    float _133 = precise::min(_70, _72);
    float _135 = precise::min(_74, _76);
    float _137 = precise::min(_133, _135);
    float _139 = precise::max(_70, _72);
    float _141 = precise::max(_74, _76);
    float _143 = -_137;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _149 = _137 >= 1.0;
    bool _151 = isnan(_137);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = 1.0 / _145;
    float _161 = precise::max(_139, _141);
    float _163 = -_161;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _169 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[1].w, _167);
    float _171 = _169 * 16777215.0;
    float _173 = 1.0 / _165;
    bool _175 = !_157;
    float _177 = _175 ? _171 : 16777215.0;
    int _179 = _131 << 2;
    float _181 = trunc(_177);
    float _183 = precise::max(_181, 0.0);
    uint _186 = uint(_183);
    bool _188 = _161 >= 1.0;
    bool _190 = isnan(_161);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _200 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].w, _198);
    bool _202 = !_196;
    int _204 = _202 ? as_type<int>(_200) : 1065353216;
    uint _206 = uint(int(uint(_179) >> uint(2)));
    uint _438 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_206)], _186, memory_order_relaxed);
    uint _208 = _438;
    out.gl_FragDepth = _165;
    out.m_40.x = as_type<float>(_204);
    return main0_out_u{as_type<uint4>(out.m_40), out.gl_FragDepth};
}

