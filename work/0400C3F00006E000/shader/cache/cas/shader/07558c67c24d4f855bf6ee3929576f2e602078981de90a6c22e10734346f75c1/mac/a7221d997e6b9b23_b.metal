#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c3 [[id(0)]];
    constant _16* vp_c1 [[id(1)]];
};

struct main0_out
{
    float4 m_27 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_24 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _181 = false;
    bool _179 = false;
    bool _175 = false;
    bool _171 = false;
    bool _167 = false;
    bool _163 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_24.x;
    float _43 = in.m_24.y;
    float _45 = in.m_24.z;
    bool _49 = as_type<uint>((*spvDescriptorSet0.vp_c3)._m0[5].x) < 6u;
    int _52 = _49 ? as_type<int>((*spvDescriptorSet0.vp_c3)._m0[5].x) : 6;
    int _54 = _52 << 2;
    uint _57 = uint(int(uint(_54) >> uint(2)));
    uint _59 = uint(int(uint(int(_57)) >> uint(2)));
    int _61 = int(_57) & 3;
    float _63 = (*spvDescriptorSet0.vp_c1)._m0[int(_59)][_61];
    bool _65 = _43 >= 0.0;
    bool _67 = isnan(_43);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    float _75 = _43 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    bool _77 = _41 > 0.0;
    float _79 = _43 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _81 = _43 > 0.0;
    float _83 = _43 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _85 = _43 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _87 = _41 >= 0.0;
    bool _89 = isnan(_41);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _99 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _101 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[3].x, _83);
    float _103 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[4].x, _85);
    int _105 = _95 ? 0 : 1;
    float _107 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[1].z, _97);
    bool _109 = !_81;
    int _111 = _109 ? 0 : 1;
    float _113 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[2].z, _99);
    int _115 = ~_105;
    int _117 = _115 + 1;
    int _119 = _117 + 1;
    float _121 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[3].z, _101);
    int _123 = ~_111;
    int _125 = _123 + 1;
    int _127 = _125 + 1;
    float _129 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _103);
    int _131 = _119;
    int _133 = _127;
    if (!_77)
    {
        int _135 = ~_105;
        int _137 = _135 + 1;
        _131 = _137;
    }
    int _139 = _131;
    float _141 = _107 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    if (_73)
    {
        int _143 = ~_111;
        int _145 = _143 + 1;
        _133 = _145;
    }
    int _147 = _133;
    float _149 = _113 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _151 = _121 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _155 = float(_139);
    float _157 = float(_147);
    bool _159 = as_type<int>(_63) == 576;
    if (!_159)
    {
        bool _161 = as_type<int>(_63) == 656;
        _163 = _161;
        if (!_163)
        {
            bool _165 = as_type<int>(_63) == 720;
            _167 = _165;
            if (!_167)
            {
                bool _169 = as_type<int>(_63) == 784;
                _171 = _169;
                if (!_171)
                {
                    bool _173 = as_type<int>(_63) == 864;
                    _175 = _173;
                    if (!_175)
                    {
                        bool _177 = as_type<int>(_63) == 944;
                        _179 = _177;
                        if (!_179)
                        {
                            _181 = true;
                        }
                    }
                }
            }
        }
    }
    if ((((((!_181) || _179) || _175) || _171) || _167) || _163)
    {
        if (!_163)
        {
            if (!_167)
            {
                if (!_171)
                {
                    if (!_175)
                    {
                        if (!_179)
                        {
                            float _183 = -_157;
                            float _185 = _183 + (-0.0);
                            float _187 = -_155;
                            float _189 = _187 + (-0.0);
                            out.m_27.x = 1.0;
                            out.m_27.y = _185;
                            out.m_27.z = _189;
                        }
                    }
                }
            }
        }
        if (((((false || _179) || _175) || _171) || _167) || _163)
        {
            if ((!_167) || _163)
            {
                if ((!_171) || _163)
                {
                    if ((!_175) || _163)
                    {
                        if ((!_179) || _163)
                        {
                            _163 = false;
                            float _191 = -_157;
                            float _193 = _191 + (-0.0);
                            out.m_27.x = -1.0;
                            out.m_27.y = _193;
                            out.m_27.z = _155;
                        }
                    }
                }
            }
            if ((((false || _179) || _175) || _171) || _167)
            {
                if ((!_171) || _167)
                {
                    if ((!_175) || _167)
                    {
                        if ((!_179) || _167)
                        {
                            _167 = false;
                            out.m_27.x = _155;
                            out.m_27.y = 1.0;
                            out.m_27.z = _157;
                        }
                    }
                }
                if (((false || _179) || _175) || _171)
                {
                    if ((!_175) || _171)
                    {
                        if ((!_179) || _171)
                        {
                            _171 = false;
                            float _195 = -_157;
                            float _197 = _195 + (-0.0);
                            out.m_27.x = _155;
                            out.m_27.y = -1.0;
                            out.m_27.z = _197;
                        }
                    }
                    if ((false || _179) || _175)
                    {
                        if ((!_179) || _175)
                        {
                            _175 = false;
                            float _199 = -_157;
                            float _201 = _199 + (-0.0);
                            out.m_27.x = _155;
                            out.m_27.y = _201;
                            out.m_27.z = 1.0;
                        }
                        if (false || _179)
                        {
                            _179 = false;
                            float _203 = -_155;
                            float _205 = _203 + (-0.0);
                            float _207 = -_157;
                            float _209 = _207 + (-0.0);
                            out.m_27.x = _205;
                            out.m_27.y = _209;
                            out.m_27.z = -1.0;
                        }
                    }
                }
            }
        }
    }
    _181 = false;
    out.gl_Position.x = _141;
    out.gl_Position.y = _149;
    out.gl_Position.z = _151;
    out.gl_Position.w = _153;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _181 = false;
    bool _179 = false;
    bool _175 = false;
    bool _171 = false;
    bool _167 = false;
    bool _163 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_24.x;
    float _43 = in.m_24.y;
    float _45 = in.m_24.z;
    bool _49 = as_type<uint>((*spvDescriptorSet0.vp_c3)._m0[5].x) < 6u;
    int _52 = _49 ? as_type<int>((*spvDescriptorSet0.vp_c3)._m0[5].x) : 6;
    int _54 = _52 << 2;
    uint _57 = uint(int(uint(_54) >> uint(2)));
    uint _59 = uint(int(uint(int(_57)) >> uint(2)));
    int _61 = int(_57) & 3;
    float _63 = (*spvDescriptorSet0.vp_c1)._m0[int(_59)][_61];
    bool _65 = _43 >= 0.0;
    bool _67 = isnan(_43);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    float _75 = _43 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    bool _77 = _41 > 0.0;
    float _79 = _43 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _81 = _43 > 0.0;
    float _83 = _43 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _85 = _43 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _87 = _41 >= 0.0;
    bool _89 = isnan(_41);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _99 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _101 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[3].x, _83);
    float _103 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[4].x, _85);
    int _105 = _95 ? 0 : 1;
    float _107 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[1].z, _97);
    bool _109 = !_81;
    int _111 = _109 ? 0 : 1;
    float _113 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[2].z, _99);
    int _115 = ~_105;
    int _117 = _115 + 1;
    int _119 = _117 + 1;
    float _121 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[3].z, _101);
    int _123 = ~_111;
    int _125 = _123 + 1;
    int _127 = _125 + 1;
    float _129 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _103);
    int _131 = _119;
    int _133 = _127;
    if (!_77)
    {
        int _135 = ~_105;
        int _137 = _135 + 1;
        _131 = _137;
    }
    int _139 = _131;
    float _141 = _107 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    if (_73)
    {
        int _143 = ~_111;
        int _145 = _143 + 1;
        _133 = _145;
    }
    int _147 = _133;
    float _149 = _113 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _151 = _121 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _155 = float(_139);
    float _157 = float(_147);
    bool _159 = as_type<int>(_63) == 576;
    if (!_159)
    {
        bool _161 = as_type<int>(_63) == 656;
        _163 = _161;
        if (!_163)
        {
            bool _165 = as_type<int>(_63) == 720;
            _167 = _165;
            if (!_167)
            {
                bool _169 = as_type<int>(_63) == 784;
                _171 = _169;
                if (!_171)
                {
                    bool _173 = as_type<int>(_63) == 864;
                    _175 = _173;
                    if (!_175)
                    {
                        bool _177 = as_type<int>(_63) == 944;
                        _179 = _177;
                        if (!_179)
                        {
                            _181 = true;
                        }
                    }
                }
            }
        }
    }
    if ((((((!_181) || _179) || _175) || _171) || _167) || _163)
    {
        if (!_163)
        {
            if (!_167)
            {
                if (!_171)
                {
                    if (!_175)
                    {
                        if (!_179)
                        {
                            float _183 = -_157;
                            float _185 = _183 + (-0.0);
                            float _187 = -_155;
                            float _189 = _187 + (-0.0);
                            out.m_27.x = 1.0;
                            out.m_27.y = _185;
                            out.m_27.z = _189;
                        }
                    }
                }
            }
        }
        if (((((false || _179) || _175) || _171) || _167) || _163)
        {
            if ((!_167) || _163)
            {
                if ((!_171) || _163)
                {
                    if ((!_175) || _163)
                    {
                        if ((!_179) || _163)
                        {
                            _163 = false;
                            float _191 = -_157;
                            float _193 = _191 + (-0.0);
                            out.m_27.x = -1.0;
                            out.m_27.y = _193;
                            out.m_27.z = _155;
                        }
                    }
                }
            }
            if ((((false || _179) || _175) || _171) || _167)
            {
                if ((!_171) || _167)
                {
                    if ((!_175) || _167)
                    {
                        if ((!_179) || _167)
                        {
                            _167 = false;
                            out.m_27.x = _155;
                            out.m_27.y = 1.0;
                            out.m_27.z = _157;
                        }
                    }
                }
                if (((false || _179) || _175) || _171)
                {
                    if ((!_175) || _171)
                    {
                        if ((!_179) || _171)
                        {
                            _171 = false;
                            float _195 = -_157;
                            float _197 = _195 + (-0.0);
                            out.m_27.x = _155;
                            out.m_27.y = -1.0;
                            out.m_27.z = _197;
                        }
                    }
                    if ((false || _179) || _175)
                    {
                        if ((!_179) || _175)
                        {
                            _175 = false;
                            float _199 = -_157;
                            float _201 = _199 + (-0.0);
                            out.m_27.x = _155;
                            out.m_27.y = _201;
                            out.m_27.z = 1.0;
                        }
                        if (false || _179)
                        {
                            _179 = false;
                            float _203 = -_155;
                            float _205 = _203 + (-0.0);
                            float _207 = -_157;
                            float _209 = _207 + (-0.0);
                            out.m_27.x = _205;
                            out.m_27.y = _209;
                            out.m_27.z = -1.0;
                        }
                    }
                }
            }
        }
    }
    _181 = false;
    out.gl_Position.x = _141;
    out.gl_Position.y = _149;
    out.gl_Position.z = _151;
    out.gl_Position.w = _153;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _181 = false;
    bool _179 = false;
    bool _175 = false;
    bool _171 = false;
    bool _167 = false;
    bool _163 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_24.x;
    float _43 = in.m_24.y;
    float _45 = in.m_24.z;
    bool _49 = as_type<uint>((*spvDescriptorSet0.vp_c3)._m0[5].x) < 6u;
    int _52 = _49 ? as_type<int>((*spvDescriptorSet0.vp_c3)._m0[5].x) : 6;
    int _54 = _52 << 2;
    uint _57 = uint(int(uint(_54) >> uint(2)));
    uint _59 = uint(int(uint(int(_57)) >> uint(2)));
    int _61 = int(_57) & 3;
    float _63 = (*spvDescriptorSet0.vp_c1)._m0[int(_59)][_61];
    bool _65 = _43 >= 0.0;
    bool _67 = isnan(_43);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    float _75 = _43 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    bool _77 = _41 > 0.0;
    float _79 = _43 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _81 = _43 > 0.0;
    float _83 = _43 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _85 = _43 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _87 = _41 >= 0.0;
    bool _89 = isnan(_41);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _99 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _101 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[3].x, _83);
    float _103 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[4].x, _85);
    int _105 = _95 ? 0 : 1;
    float _107 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[1].z, _97);
    bool _109 = !_81;
    int _111 = _109 ? 0 : 1;
    float _113 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[2].z, _99);
    int _115 = ~_105;
    int _117 = _115 + 1;
    int _119 = _117 + 1;
    float _121 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[3].z, _101);
    int _123 = ~_111;
    int _125 = _123 + 1;
    int _127 = _125 + 1;
    float _129 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _103);
    int _131 = _119;
    int _133 = _127;
    if (!_77)
    {
        int _135 = ~_105;
        int _137 = _135 + 1;
        _131 = _137;
    }
    int _139 = _131;
    float _141 = _107 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    if (_73)
    {
        int _143 = ~_111;
        int _145 = _143 + 1;
        _133 = _145;
    }
    int _147 = _133;
    float _149 = _113 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _151 = _121 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _155 = float(_139);
    float _157 = float(_147);
    bool _159 = as_type<int>(_63) == 576;
    if (!_159)
    {
        bool _161 = as_type<int>(_63) == 656;
        _163 = _161;
        if (!_163)
        {
            bool _165 = as_type<int>(_63) == 720;
            _167 = _165;
            if (!_167)
            {
                bool _169 = as_type<int>(_63) == 784;
                _171 = _169;
                if (!_171)
                {
                    bool _173 = as_type<int>(_63) == 864;
                    _175 = _173;
                    if (!_175)
                    {
                        bool _177 = as_type<int>(_63) == 944;
                        _179 = _177;
                        if (!_179)
                        {
                            _181 = true;
                        }
                    }
                }
            }
        }
    }
    if ((((((!_181) || _179) || _175) || _171) || _167) || _163)
    {
        if (!_163)
        {
            if (!_167)
            {
                if (!_171)
                {
                    if (!_175)
                    {
                        if (!_179)
                        {
                            float _183 = -_157;
                            float _185 = _183 + (-0.0);
                            float _187 = -_155;
                            float _189 = _187 + (-0.0);
                            out.m_27.x = 1.0;
                            out.m_27.y = _185;
                            out.m_27.z = _189;
                        }
                    }
                }
            }
        }
        if (((((false || _179) || _175) || _171) || _167) || _163)
        {
            if ((!_167) || _163)
            {
                if ((!_171) || _163)
                {
                    if ((!_175) || _163)
                    {
                        if ((!_179) || _163)
                        {
                            _163 = false;
                            float _191 = -_157;
                            float _193 = _191 + (-0.0);
                            out.m_27.x = -1.0;
                            out.m_27.y = _193;
                            out.m_27.z = _155;
                        }
                    }
                }
            }
            if ((((false || _179) || _175) || _171) || _167)
            {
                if ((!_171) || _167)
                {
                    if ((!_175) || _167)
                    {
                        if ((!_179) || _167)
                        {
                            _167 = false;
                            out.m_27.x = _155;
                            out.m_27.y = 1.0;
                            out.m_27.z = _157;
                        }
                    }
                }
                if (((false || _179) || _175) || _171)
                {
                    if ((!_175) || _171)
                    {
                        if ((!_179) || _171)
                        {
                            _171 = false;
                            float _195 = -_157;
                            float _197 = _195 + (-0.0);
                            out.m_27.x = _155;
                            out.m_27.y = -1.0;
                            out.m_27.z = _197;
                        }
                    }
                    if ((false || _179) || _175)
                    {
                        if ((!_179) || _175)
                        {
                            _175 = false;
                            float _199 = -_157;
                            float _201 = _199 + (-0.0);
                            out.m_27.x = _155;
                            out.m_27.y = _201;
                            out.m_27.z = 1.0;
                        }
                        if (false || _179)
                        {
                            _179 = false;
                            float _203 = -_155;
                            float _205 = _203 + (-0.0);
                            float _207 = -_157;
                            float _209 = _207 + (-0.0);
                            out.m_27.x = _205;
                            out.m_27.y = _209;
                            out.m_27.z = -1.0;
                        }
                    }
                }
            }
        }
    }
    _181 = false;
    out.gl_Position.x = _141;
    out.gl_Position.y = _149;
    out.gl_Position.z = _151;
    out.gl_Position.w = _153;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

