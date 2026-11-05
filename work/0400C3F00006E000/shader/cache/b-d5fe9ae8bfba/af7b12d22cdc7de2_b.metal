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
};

struct main0_out
{
    float4 m_27 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_24 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _146 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = in.m_22.z;
    bool _49 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _51 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _53 = _41 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[5].z, _61);
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _63);
    float _71 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[6].z, _65);
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _79 = _73 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = _73 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].x, _79);
    float _89 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[2].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[3].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].z, _87);
    float _97 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].z, _91);
    float _101 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].z, _93);
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _103;
    out.gl_Position.z = _107;
    out.gl_Position.w = _109;
    bool _111 = !_49;
    float _113 = _53;
    float _139;
    int _142;
    float _144;
    if (!_111)
    {
        float _115 = _51 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _117 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _119 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _121 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[17].x, _115);
        float _123 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _117);
        float _125 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _119);
        float _127 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[17].z, _121);
        float _129 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[14].z, _123);
        float _131 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[15].z, _125);
        float _133 = _127 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _135 = _129 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _137 = _131 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _139 = _137;
        _142 = as_type<int>(_133);
        _144 = _135;
        _146 = true;
    }
    else
    {
        int _148 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _150 = _148 != 0;
        float _152 = _45;
        float _154 = _75;
        if (!_150)
        {
            float _156 = in.m_24.x;
            float _158 = in.m_24.y;
            _152 = _156;
            _154 = _158;
        }
        float _160 = _152;
        float _162 = _154;
        if (!_150)
        {
            _113 = 1.0;
        }
        float _164 = _113;
        bool _166 = !_150;
        _139 = _162;
        _142 = as_type<int>(_164);
        _144 = _160;
        if (!_166)
        {
            int _168 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _170 = _168 != 0;
            float _172 = _164;
            float _174 = _51;
            if (!_170)
            {
                float _176 = in.m_24.x;
                float _178 = in.m_24.y;
                _172 = _176;
                _174 = _178;
            }
            float _180 = _172;
            float _182 = _174;
            bool _184 = !_170;
            float _186 = _182;
            float _188 = _180;
            int _190 = as_type<int>(_180);
            float _192 = _182;
            if (!_184)
            {
                float _194 = in.m_24.x;
                float _196 = in.m_24.y;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _216 = _214 != 0;
                if (_200)
                {
                    _186 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _186;
                float _220 = _218;
                if (_200)
                {
                    _188 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _188;
                float _224 = _222;
                if (!_200)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _220;
                if (!_200)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _228 = _224;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _232 = _228 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _234 = _194;
                float _236 = _196;
                if (_212)
                {
                    float _238 = _230 * _194;
                    _234 = _238;
                }
                float _240 = _234;
                float _242 = -_230;
                float _244 = _242 + 1.0;
                int _246 = as_type<int>(_240);
                if (_216)
                {
                    float _248 = _232 * _196;
                    _236 = _248;
                }
                float _250 = _236;
                float _252 = -_232;
                float _254 = _252 + 1.0;
                float _256 = _250;
                if (_204)
                {
                    float _258 = _240 + _244;
                    _246 = as_type<int>(_258);
                }
                int _260 = _246;
                if (_208)
                {
                    float _262 = _250 + _254;
                    _256 = _262;
                }
                float _264 = _256;
                _190 = _260;
                _192 = _264;
            }
            int _266 = _190;
            float _268 = _192;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _280 = _278 != 0;
            int _282 = _266;
            int _284 = as_type<int>(_268);
            _142 = 1065353216;
            if (_276)
            {
                float _286 = -as_type<float>(_266);
                float _288 = _286 + 1.0;
                _282 = as_type<int>(_288);
            }
            int _290 = _282;
            if (_280)
            {
                float _292 = -_268;
                float _294 = _292 + 1.0;
                _284 = as_type<int>(_294);
            }
            int _296 = _284;
            bool _298 = !_272;
            float _300 = _298 ? as_type<float>(_290) : as_type<float>(_296);
            bool _302 = !_272;
            float _304 = _302 ? as_type<float>(_296) : as_type<float>(_290);
            _139 = _304;
            _144 = _300;
        }
    }
    _146 = false;
    float _306 = _139;
    int _308 = _142;
    float _310 = _144;
    float _312 = _306 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _314 = _306 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_308);
    float _316 = fma(_310, (*spvDescriptorSet0.vp_c3)._m0[8].x, _312);
    float _318 = fma(_310, (*spvDescriptorSet0.vp_c3)._m0[7].x, _314);
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _324 = -_320;
    float _326 = _324 + 1.0;
    out.m_27.x = _322;
    out.m_27.y = _326;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _146 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = in.m_22.z;
    bool _49 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _51 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _53 = _41 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[5].z, _61);
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _63);
    float _71 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[6].z, _65);
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _79 = _73 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = _73 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].x, _79);
    float _89 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[2].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[3].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].z, _87);
    float _97 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].z, _91);
    float _101 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].z, _93);
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _103;
    out.gl_Position.z = _107;
    out.gl_Position.w = _109;
    bool _111 = !_49;
    float _113 = _53;
    float _139;
    int _142;
    float _144;
    if (!_111)
    {
        float _115 = _51 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _117 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _119 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _121 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[17].x, _115);
        float _123 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _117);
        float _125 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _119);
        float _127 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[17].z, _121);
        float _129 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[14].z, _123);
        float _131 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[15].z, _125);
        float _133 = _127 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _135 = _129 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _137 = _131 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _139 = _137;
        _142 = as_type<int>(_133);
        _144 = _135;
        _146 = true;
    }
    else
    {
        int _148 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _150 = _148 != 0;
        float _152 = _45;
        float _154 = _75;
        if (!_150)
        {
            float _156 = in.m_24.x;
            float _158 = in.m_24.y;
            _152 = _156;
            _154 = _158;
        }
        float _160 = _152;
        float _162 = _154;
        if (!_150)
        {
            _113 = 1.0;
        }
        float _164 = _113;
        bool _166 = !_150;
        _139 = _162;
        _142 = as_type<int>(_164);
        _144 = _160;
        if (!_166)
        {
            int _168 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _170 = _168 != 0;
            float _172 = _164;
            float _174 = _51;
            if (!_170)
            {
                float _176 = in.m_24.x;
                float _178 = in.m_24.y;
                _172 = _176;
                _174 = _178;
            }
            float _180 = _172;
            float _182 = _174;
            bool _184 = !_170;
            float _186 = _182;
            float _188 = _180;
            int _190 = as_type<int>(_180);
            float _192 = _182;
            if (!_184)
            {
                float _194 = in.m_24.x;
                float _196 = in.m_24.y;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _216 = _214 != 0;
                if (_200)
                {
                    _186 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _186;
                float _220 = _218;
                if (_200)
                {
                    _188 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _188;
                float _224 = _222;
                if (!_200)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _220;
                if (!_200)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _228 = _224;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _232 = _228 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _234 = _194;
                float _236 = _196;
                if (_212)
                {
                    float _238 = _230 * _194;
                    _234 = _238;
                }
                float _240 = _234;
                float _242 = -_230;
                float _244 = _242 + 1.0;
                int _246 = as_type<int>(_240);
                if (_216)
                {
                    float _248 = _232 * _196;
                    _236 = _248;
                }
                float _250 = _236;
                float _252 = -_232;
                float _254 = _252 + 1.0;
                float _256 = _250;
                if (_204)
                {
                    float _258 = _240 + _244;
                    _246 = as_type<int>(_258);
                }
                int _260 = _246;
                if (_208)
                {
                    float _262 = _250 + _254;
                    _256 = _262;
                }
                float _264 = _256;
                _190 = _260;
                _192 = _264;
            }
            int _266 = _190;
            float _268 = _192;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _280 = _278 != 0;
            int _282 = _266;
            int _284 = as_type<int>(_268);
            _142 = 1065353216;
            if (_276)
            {
                float _286 = -as_type<float>(_266);
                float _288 = _286 + 1.0;
                _282 = as_type<int>(_288);
            }
            int _290 = _282;
            if (_280)
            {
                float _292 = -_268;
                float _294 = _292 + 1.0;
                _284 = as_type<int>(_294);
            }
            int _296 = _284;
            bool _298 = !_272;
            float _300 = _298 ? as_type<float>(_290) : as_type<float>(_296);
            bool _302 = !_272;
            float _304 = _302 ? as_type<float>(_296) : as_type<float>(_290);
            _139 = _304;
            _144 = _300;
        }
    }
    _146 = false;
    float _306 = _139;
    int _308 = _142;
    float _310 = _144;
    float _312 = _306 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _314 = _306 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_308);
    float _316 = fma(_310, (*spvDescriptorSet0.vp_c3)._m0[8].x, _312);
    float _318 = fma(_310, (*spvDescriptorSet0.vp_c3)._m0[7].x, _314);
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _324 = -_320;
    float _326 = _324 + 1.0;
    out.m_27.x = _322;
    out.m_27.y = _326;
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
    bool _146 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = in.m_22.z;
    bool _49 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _51 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _53 = _41 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[5].z, _61);
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _63);
    float _71 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[6].z, _65);
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _79 = _73 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = _73 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].x, _79);
    float _89 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[2].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[3].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].z, _87);
    float _97 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].z, _91);
    float _101 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].z, _93);
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _103;
    out.gl_Position.z = _107;
    out.gl_Position.w = _109;
    bool _111 = !_49;
    float _113 = _53;
    float _139;
    int _142;
    float _144;
    if (!_111)
    {
        float _115 = _51 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _117 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _119 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _121 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[17].x, _115);
        float _123 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _117);
        float _125 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _119);
        float _127 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[17].z, _121);
        float _129 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[14].z, _123);
        float _131 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[15].z, _125);
        float _133 = _127 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _135 = _129 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _137 = _131 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _139 = _137;
        _142 = as_type<int>(_133);
        _144 = _135;
        _146 = true;
    }
    else
    {
        int _148 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _150 = _148 != 0;
        float _152 = _45;
        float _154 = _75;
        if (!_150)
        {
            float _156 = in.m_24.x;
            float _158 = in.m_24.y;
            _152 = _156;
            _154 = _158;
        }
        float _160 = _152;
        float _162 = _154;
        if (!_150)
        {
            _113 = 1.0;
        }
        float _164 = _113;
        bool _166 = !_150;
        _139 = _162;
        _142 = as_type<int>(_164);
        _144 = _160;
        if (!_166)
        {
            int _168 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _170 = _168 != 0;
            float _172 = _164;
            float _174 = _51;
            if (!_170)
            {
                float _176 = in.m_24.x;
                float _178 = in.m_24.y;
                _172 = _176;
                _174 = _178;
            }
            float _180 = _172;
            float _182 = _174;
            bool _184 = !_170;
            float _186 = _182;
            float _188 = _180;
            int _190 = as_type<int>(_180);
            float _192 = _182;
            if (!_184)
            {
                float _194 = in.m_24.x;
                float _196 = in.m_24.y;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _216 = _214 != 0;
                if (_200)
                {
                    _186 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _186;
                float _220 = _218;
                if (_200)
                {
                    _188 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _188;
                float _224 = _222;
                if (!_200)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _220;
                if (!_200)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _228 = _224;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _232 = _228 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _234 = _194;
                float _236 = _196;
                if (_212)
                {
                    float _238 = _230 * _194;
                    _234 = _238;
                }
                float _240 = _234;
                float _242 = -_230;
                float _244 = _242 + 1.0;
                int _246 = as_type<int>(_240);
                if (_216)
                {
                    float _248 = _232 * _196;
                    _236 = _248;
                }
                float _250 = _236;
                float _252 = -_232;
                float _254 = _252 + 1.0;
                float _256 = _250;
                if (_204)
                {
                    float _258 = _240 + _244;
                    _246 = as_type<int>(_258);
                }
                int _260 = _246;
                if (_208)
                {
                    float _262 = _250 + _254;
                    _256 = _262;
                }
                float _264 = _256;
                _190 = _260;
                _192 = _264;
            }
            int _266 = _190;
            float _268 = _192;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _280 = _278 != 0;
            int _282 = _266;
            int _284 = as_type<int>(_268);
            _142 = 1065353216;
            if (_276)
            {
                float _286 = -as_type<float>(_266);
                float _288 = _286 + 1.0;
                _282 = as_type<int>(_288);
            }
            int _290 = _282;
            if (_280)
            {
                float _292 = -_268;
                float _294 = _292 + 1.0;
                _284 = as_type<int>(_294);
            }
            int _296 = _284;
            bool _298 = !_272;
            float _300 = _298 ? as_type<float>(_290) : as_type<float>(_296);
            bool _302 = !_272;
            float _304 = _302 ? as_type<float>(_296) : as_type<float>(_290);
            _139 = _304;
            _144 = _300;
        }
    }
    _146 = false;
    float _306 = _139;
    int _308 = _142;
    float _310 = _144;
    float _312 = _306 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _314 = _306 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_308);
    float _316 = fma(_310, (*spvDescriptorSet0.vp_c3)._m0[8].x, _312);
    float _318 = fma(_310, (*spvDescriptorSet0.vp_c3)._m0[7].x, _314);
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _324 = -_320;
    float _326 = _324 + 1.0;
    out.m_27.x = _322;
    out.m_27.y = _326;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

